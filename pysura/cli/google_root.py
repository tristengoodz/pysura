from pysura.pysura_types.root_cmd import RootCmd
from pysura.pysura_types.google_pysura_env import *
import json
import os
from pydantic.error_wrappers import ValidationError
import logging
import random
from string import ascii_letters, digits
import psycopg2
import site
import shutil
import plistlib
import re


class GoogleRoot(RootCmd):

    def __init__(self, *arg, **kwargs):
        super().__init__(*arg, **kwargs)
        self.intro = "Welcome to Pysura for Google Architectures! Type help or ? to list commands."
        self.prompt = "(pysura_cli) >>> "

    @staticmethod
    def get_site_packages_path(submodule="pysura_auth"):
        return os.path.join(site.getsitepackages()[0], "pysura", "library_data", submodule)

    @staticmethod
    def get_database_connection(
            host="secret",
            name="postgres",
            user="postgres",
            password="secret",
            port=5432):
        conn = psycopg2.connect(
            host=host,
            database=name,
            user=user,
            password=password,
            port=port
        )
        return conn

    @staticmethod
    def password(length: int = 64):
        return "".join(random.choices(ascii_letters + digits, k=length))

    @staticmethod
    def get_env(file_name: str = "env.json") -> GooglePysuraEnv:
        try:
            with open(file_name, "r") as f:
                return GooglePysuraEnv(**json.load(f))
        except FileNotFoundError:
            env = GooglePysuraEnv()
            with open(file_name, "w") as f:
                json.dump(env.dict(), f)
            return env

    @staticmethod
    def set_env(value: GooglePysuraEnv, file_name: str = "env.json"):
        with open(file_name, "w") as f:
            json.dump(value.dict(), f)

    def gcloud_list_typed_choice(self, command_str, prompt_str, default="name"):
        self.log(command_str, logging.DEBUG)
        response = os.popen(command_str).read()
        gcloud_list = json.loads(response)
        try:
            choice_list = [i[default] for i in gcloud_list]
        except KeyError:
            self.log(f"Invalid default: {default}")
            return
        try:
            if len(gcloud_list) > 0:
                choice = self.collect(prompt_str, choice_list)
                if choice not in choice_list:
                    self.log("Invalid choice.")
                    return
                return choice
            else:
                self.log("No items found.")
        except Exception as e:
            self.log(str(e), logging.ERROR)

    @staticmethod
    def get_env_names(cls):
        cls_name = cls.schema()["title"]
        attr_names = {
            "selected": None,
            "list": None
        }
        env_properties = GoogleRoot.get_env().schema()["properties"]
        for k, v in env_properties.items():
            if isinstance(v, dict) and cls_name == v.get("$ref", "").split("/")[-1]:
                attr_names["selected"] = k
            elif isinstance(v, dict) and "items" in v:
                if cls_name == v["items"].get("$ref", "").split("/")[-1]:
                    attr_names["list"] = k
        return attr_names

    def gcloud_list_choice(self, command_str, model):
        env_names = self.get_env_names(model)
        self.log(command_str, logging.DEBUG)
        if "--format" not in command_str:
            command_str += " --format=json"
        response = os.popen(command_str).read()
        gcloud_list = json.loads(response)
        choice = None
        if choice is None:
            for i, gcloud_dict in enumerate(gcloud_list):
                self.log(f"\n{i}\t{gcloud_dict.get('name', None)}:\n{json.dumps(gcloud_dict, indent=4)}")
            choice = self.collect("Select a number from the list above: ").strip()
            choice = int(choice)
        if choice is not None:
            env_item = gcloud_list[choice]
            try:
                env_item = model(**env_item)
            except ValidationError:
                self.log("The selected item has inconsistent metadata.")
                return self.gcloud_list_choice(command_str, model)
            env = self.get_env()
            env[env_names["selected"]] = env_item
            self.set_env(env)
            return env_item, gcloud_list

    def do_exit(self, _):
        """
        Exits the application.
        Usage: exit
        """
        self.log("Exiting...")
        exit(0)

    def do_quit(self, _):
        """
        Exits the application.
        Usage: quit
        """
        self.log("Exiting...")
        exit(0)

    def do_gcloud_login(self, check_logged_in=False):
        """
        Logs into gcloud.
        Usage: gcloud_login
        """
        if isinstance(check_logged_in, str):
            check_logged_in = False
        if check_logged_in:
            env = self.get_env()
            self.log("Checking if already logged into gcloud...")
            if env.gcloud_logged_in:
                self.log("Already logged into gcloud!")
                return
        self.log("Logging into gcloud...")
        cmd_str = "gcloud auth login"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        login_success = self.collect("Did you successfully login? (y/n) ")
        if login_success.strip().lower() == "y":
            env = self.get_env()
            env.gcloud_logged_in = True
            self.set_env(env)
        else:
            self.user_input_no_loop(self.do_gcloud_login)

    def do_gcloud_link_billing_account(self, project_id=None):
        """
        Links a billing account to a project.
        Usage: gcloud_link_billing_account
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if project_id is None or (isinstance(project_id, str) and len(project_id.strip()) == 0):
            project_id = env.project.name.split("/")[-1]
        billing_account, billing_accounts = self.gcloud_list_choice(
            "gcloud beta billing accounts list --format=json",
            GoogleBillingAccount)
        env.billing_account = billing_account
        env.billing_accounts = billing_accounts
        self.set_env(env)
        cmd_str = f"gcloud beta billing projects link {project_id} " \
                  f"--billing-account={billing_account.name.split('/')[-1]}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)

    def do_gcloud_enable_api_services(self, _):
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        self.log("Enabling services...")
        project_id = env.project.name.split("/")[-1]
        cmd_str = f"gcloud services enable servicenetworking.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services enable compute.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services enable sqladmin.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services enable vpcaccess.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services enable identitytoolkit.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services enable run.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services enable secretmanager.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services enable cloudfunctions.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services enable cloudbuild.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services list --project={project_id} --format=json"
        self.log(cmd_str, level=logging.DEBUG)
        response = os.popen(cmd_str).read()
        services = json.loads(response)
        env.api_services = services
        self.set_env(env)

    def do_gcloud_choose_organization(self, _):
        """
        Chooses an organization.
        Usage: gcloud_choose_organization
        """
        self.log("Choosing organization...")
        org, orgs = self.gcloud_list_choice("gcloud organizations list --format=json", GoogleOrganization)
        env = self.get_env()
        env.organization = org
        env.organizations = orgs
        self.set_env(env)

    def do_gcloud_create_project(self, project_id=""):
        """
        Creates a gcloud project.
        Usage: gcloud_project_create
        """
        env = self.get_env()
        use_organization = self.collect("Do you want to use an organization? (y/n) ")
        use_org = use_organization.strip().lower() == "y"
        if use_org:
            if env.organization is None:
                self.log("No organization selected.")
                return
        arg_len = len(project_id.strip())
        if arg_len == 0:
            project_name = self.collect("Enter a project name: ")
        else:
            project_name = project_id
        if arg_len > 0 or self.confirm_loop(project_name):
            cmd_str = f"gcloud projects create {project_name}"
            if use_org:
                assert env.organization is not None
                cmd_str += f" --organization={env.organization.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)
            cmd_str = f"gcloud projects list --format=json"
            self.log(cmd_str, level=logging.DEBUG)
            response = os.popen(cmd_str).read()
            projects = json.loads(response)
            project = None
            for p in projects:
                project_data = GoogleProject(**p)
                if project_data.name.split("/")[-1] == project_name:
                    project = GoogleProject(**p)
                    break
            assert project is not None
            cmd_str = f"gcloud config set project {project.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)
            env.project = project
            env.projects = projects
            self.set_env(env)
        else:
            self.user_input_no_loop(self.do_gcloud_create_project)

    def do_gcloud_choose_project(self, _):
        """
        Chooses a project.
        Usage: gcloud_choose_project
        """
        env = self.get_env()
        if not env.gcloud_logged_in:
            self.do_gcloud_login()
        self.log("Choosing project...")
        project, projects = self.gcloud_list_choice("gcloud projects list --format=json", GoogleProject)
        env.project = project
        env.projects = projects
        self.set_env(env)
        if project is not None:
            cmd_str = f"gcloud config set project {project.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)

    def do_gcloud_create_network(self, network_id=""):
        """
        Creates a Network.
        Usage: gcloud_network_create
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        arg_len = len(network_id.strip())
        if arg_len == 0:
            network_name = self.collect("Enter a network name: ")
        else:
            network_name = network_id
        if arg_len > 0 or self.confirm_loop(network_name):
            cmd_str = f"gcloud compute networks create {network_name}" \
                      f" --subnet-mode=auto" \
                      f" --project={env.project.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)
            cmd_str = f"gcloud compute networks list " \
                      f"--project={env.project.name.split('/')[-1]} " \
                      f"--format=json"
            gcloud_list = self.retry_loop(cmd_str, network_name)
            network_selected = None
            network_set = []
            for gcloud_item in gcloud_list:
                network = GoogleNetwork(
                    **gcloud_item
                )
                network_set.append(network)
                if network.name.split("/")[-1] == network_name:
                    network_selected = network

            if network_selected is None:
                self.log("Network not found.")
                return
            env.network = network_selected
            env.networks = network_set
            self.set_env(env)
        else:
            self.user_input_no_loop(self.do_gcloud_create_network)

    def do_gcloud_choose_network(self, _):
        """
        Chooses a Network.
        Usage: gcloud_network_choose
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        self.log("Choosing network...")
        network, networks = self.gcloud_list_choice(f"gcloud compute networks list "
                                                    f"--project={env.project.name.split('/')[-1]} "
                                                    f"--format=json", GoogleNetwork)
        env.network = network
        env.networks = networks
        self.set_env(env)

    def do_gcloud_create_address(self, address_id=""):
        """
        Creates an address.
        Usage: gcloud_address_create
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if env.network is None:
            self.log("No network selected.")
            return
        arg_len = len(address_id.strip())
        if arg_len == 0:
            address_name = self.collect("Enter an address name: ")
        else:
            address_name = address_id
        if arg_len > 0 or self.confirm_loop(address_name):
            cmd_str = f"gcloud compute addresses create {address_name} " \
                      f"--global " \
                      f"--purpose=VPC_PEERING " \
                      f"--prefix-length=16 " \
                      f"--network={env.network.name.split('/')[-1]} " \
                      f"--project={env.project.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)
            cmd_str = f"gcloud compute addresses list " \
                      f"--project={env.project.name.split('/')[-1]} " \
                      f"--format=json"
            gcloud_list = self.retry_loop(cmd_str, address_name)
            address_selected = None
            address_set = []
            for gcloud_item in gcloud_list:
                address = GoogleAddress(
                    **gcloud_item
                )
                address_set.append(address)
                if address.name.split('/')[-1] == address_name:
                    address_selected = address
            if address_selected is None:
                self.log("Address not found.")
                return
            env.address = address_selected
            env.addresses = address_set
            self.set_env(env)
            if address_selected is None:
                self.log("Address not found.")
                return
        else:
            self.user_input_no_loop(self.do_gcloud_create_address)

    def do_gcloud_choose_address(self, _):
        """
        Chooses an address.
        Usage: gcloud_address_choose
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if env.network is None:
            self.log("No network selected.")
            return
        self.log("Choosing address...")
        address, addresses = self.gcloud_list_choice(f"gcloud compute addresses list "
                                                     f"--project={env.project.name.split('/')[-1]} "
                                                     f"--format=json", GoogleAddress)
        env.address = address
        env.addresses = addresses
        self.set_env(env)

    def do_gcloud_create_vpc_peering(self, peering_id=""):
        """
        Creates a VPC Peering.
        Usage: gcloud_vpc_peering_create
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if env.network is None:
            self.log("No network selected.")
            return
        if env.address is None:
            self.log("No address selected.")
            return

        arg_len = len(peering_id.strip())
        if arg_len == 0:
            peering_name = self.collect("Enter a peering name: ")
        else:
            peering_name = peering_id
        if arg_len > 0 or self.confirm_loop(peering_name):
            cmd_str = f"gcloud services vpc-peerings connect " \
                      f"--service=servicenetworking.googleapis.com " \
                      f"--ranges={env.address.name.split('/')[-1]} " \
                      f"--network={env.network.name.split('/')[-1]} " \
                      f"--project={env.project.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)
            cmd_str = f"gcloud services vpc-peerings list " \
                      f"--project={env.project.name.split('/')[-1]} " \
                      f"--network={env.network.name.split('/')[-1]} --format=json"
            gcloud_list = self.retry_loop(cmd_str, peering_name)
            peering_selected = None
            peering_set = []
            for peering in gcloud_list:
                peering_data = GoogleVpcPeering(
                    **peering
                )
                peering_set.append(peering_data)
                if peering_name in peering_data.reservedPeeringRanges:
                    peering_selected = peering_data
            if peering_selected is None:
                self.log("Peering not found.")
                return
            env.peering = peering_selected
            env.peerings = peering_set
            self.set_env(env)
        else:
            self.user_input_no_loop(self.do_gcloud_create_vpc_peering)

    def do_gcloud_choose_vpc_peering(self, _):
        """
        Chooses a VPC Peering.
        Usage: gcloud_vpc_peering_choose
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if env.network is None:
            self.log("No network selected.")
            return
        if env.address is None:
            self.log("No address selected.")
            return
        self.log("Choosing peering...")
        peering, peerings = self.gcloud_list_choice(
            f"gcloud services vpc-peerings list "
            f"--project={env.project.name.split('/')[-1]} "
            f"--network={env.network.name.split('/')[-1]} --format=json",
            GoogleVpcPeering
        )
        env.peering = peering
        env.peerings = peerings
        self.set_env(env)

    def do_gcloud_create_firewall(self, firewall_id=""):
        """
        Creates a firewall.
        Usage: gcloud_firewall_create
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if env.network is None:
            self.log("No network selected.")
            return
        if env.address is None:
            self.log("No address selected.")
            return
        if env.peering is None:
            self.log("No peering selected.")
            return

        arg_len = len(firewall_id.strip())
        if arg_len == 0:
            firewall_name = self.collect("Enter a firewall name: ")
        else:
            firewall_name = firewall_id
        if arg_len > 0 or self.confirm_loop(firewall_name):
            cmd_str = f"gcloud compute firewall-rules create {firewall_name}-allow-traffic  " \
                      f"--network={env.network.name.split('/')[-1]} " \
                      f"--allow=tcp,udp,icmp " \
                      f"--source-ranges=0.0.0.0/0 " \
                      f"--project={env.project.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)
            cmd_str = f"gcloud compute firewall-rules list " \
                      f"--project={env.project.name.split('/')[-1]} " \
                      f"--format=json"
            self.retry_loop(cmd_str, f"{firewall_name}-allow-traffic")
            cmd_str = f"gcloud compute firewall-rules create {firewall_name}-allow-ssh  " \
                      f"--network={env.network.name.split('/')[-1]} " \
                      f"--allow=tcp:22,tcp:3389,icmp " \
                      f"--project={env.project.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)
            cmd_str = f"gcloud compute firewall-rules list " \
                      f"--project={env.project.name.split('/')[-1]} " \
                      f"--format=json"
            self.log(cmd_str, level=logging.DEBUG)
            gcloud_list = json.loads(os.popen(cmd_str).read())
            firewall_set = []
            for firewall in gcloud_list:
                firewall_data = GoogleFirewall(
                    **firewall
                )
                firewall_set.append(firewall_data)
            env.firewalls = firewall_set
            self.set_env(env)
        else:
            self.user_input_no_loop(self.do_gcloud_create_firewall)

    def do_gcloud_create_database(self, database_id=""):
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if env.network is None:
            self.log("No network selected.")
            return

        arg_len = len(database_id.strip())
        if arg_len == 0:
            db_name = self.collect("Enter a database name: ")
        else:
            db_name = database_id
        if arg_len == 0 and not self.confirm_loop(db_name):
            self.user_input_no_loop(self.do_gcloud_create_database)
            return
        cpu_number = self.collect("Enter the number of CPU's for the database number (Ex. 2): ")
        memory_amount = self.collect("Enter the amount of memory for the database (MiB) (Ex. 8192): ", ["2048",
                                                                                                        "4096",
                                                                                                        "8192",
                                                                                                        "16384",
                                                                                                        "24576",
                                                                                                        "32768"])
        db_version = self.collect("Enter the database version (Supports POSTGRES_14, ): ", ["POSTGRES_14"])
        cpu_number = str(int(cpu_number.strip()))
        memory_amount = f"{str(int(memory_amount.strip()))}MiB"
        zone = self.gcloud_list_typed_choice(f"gcloud compute zones list "
                                             f"--project={env.project.name.split('/')[-1]} "
                                             f"--format=json", "Enter a zone (Ex. us-central1-b): ", "name")
        if zone is None:
            self.log("No zone selected.")
            return
        availability_types = ["regional", "zonal"]
        availability_type = self.collect("Enter the availability type (regional/zonal): ", availability_types)
        if availability_type not in availability_types:
            self.log("Invalid availability type.")
            return
        db_password = self.password()
        self.log(f"You are preparing to create a database with the following parameters: "
                 f"Name: {db_name}, CPU's: {cpu_number}, Memory: {memory_amount}, "
                 f"Version: {db_version}, Zone: {zone}, "
                 f"Network: {env.network.name.split('/')[-1]}, Project: {env.project.name.split('/')[-1]}, "
                 f"DatabasePassword: {db_password}")
        continue_flag = self.collect("Continue? (y/n): ", ["y", "n"])
        if continue_flag.strip().lower() != "y":
            self.log("Aborting...")
            return
        cmd_str = (
            f"gcloud beta sql instances create {db_name} "
            f"--project={env.project.name.split('/')[-1]} "
            f"--network=projects/{env.project.name.split('/')[-1]}/global/networks/{env.network.name.split('/')[-1]} "
            f"--root-password={db_password} "
            f"--zone={zone} "
            f"--cpu={cpu_number} "
            f"--memory={memory_amount} "
            f"--database-version={db_version} "
            f"--availability-type={availability_type} "
            f"--enable-google-private-path"
        )
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud sql instances list " \
                  f"--project={env.project.name.split('/')[-1]} " \
                  f"--format=json"
        gcloud_list = self.retry_loop(cmd_str, f"{db_name}")
        db_selected = None
        db_set = []
        for db_instance in gcloud_list:
            db_data = GoogleDatabase(
                **db_instance
            )
            db_set.append(db_data)
            if db_data.name.split('/')[-1] == db_name:
                db_selected = db_data

        if db_selected is None:
            self.log("Database not found.")
            return

        db_creds = DatabaseCredential()
        db_creds.database_id = db_name
        db_creds.password = db_password
        private_address = None
        for addr in db_selected.ipAddresses:
            if addr.type == "PRIVATE":
                private_address = addr.ipAddress
        if private_address is not None:
            db_creds.connect_url = f"postgres://" \
                                   f"postgres:{db_password}" \
                                   f"@/postgres?host=" \
                                   f"{private_address}"
        env.database = db_selected
        env.databases = db_set
        if env.database_credential is None:
            env.database_credential = db_creds
        if env.database_credentials is None:
            env.database_credentials = [db_creds]
        else:
            env.database_credentials.append(db_creds)
        self.set_env(env)

    def do_gcloud_create_serverless_connector(self, connector_id=""):
        """
        Creates a serverless connector.
        Usage: create_serverless_connector
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if env.network is None:
            self.log("No network selected.")
            return
        if env.database is None:
            self.log("No database selected.")
            return

        range_choice = self.collect("Select a range (Ex. 10.8.0.0/28): ", [f"10.{i}.0.0/28" for i in range(8, 100)])
        arg_len = len(connector_id.split())
        if arg_len == 0:
            connector_name = self.collect("Enter a connector name: ")
        else:
            connector_name = connector_id
        if arg_len == 0 and not self.confirm_loop(connector_name):
            self.user_input_no_loop(self.do_gcloud_create_serverless_connector)
            return
        cmd_str = f"gcloud compute networks vpc-access connectors create {connector_name} " \
                  f"--network={env.network.name.split('/')[-1]} " \
                  f"--region={env.database.region} " \
                  f"--range={range_choice} " \
                  f"--project={env.project.name.split('/')[-1]}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud compute networks vpc-access connectors list " \
                  f"--project={env.project.name.split('/')[-1]} " \
                  f"--region={env.database.region} --format=json"
        gcloud_list = self.retry_loop(cmd_str, f"{connector_name}")
        connector_selected = None
        connector_set = []
        for connector in gcloud_list:
            connector_data = GoogleConnector(
                **connector
            )
            connector_set.append(connector_data)
            if connector_data.name.split("/")[-1] == connector_name:
                connector_selected = connector_data

        if connector_selected is None:
            self.log("Connector not found.")
            return
        env.connector = connector_selected
        env.connectors = connector_set
        self.set_env(env)

    def do_gcloud_choose_serverless_connector(self, _):
        """
        Chooses a serverless connector.
        Usage: choose_serverless_connector
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if env.network is None:
            self.log("No network selected.")
            return
        if env.database is None:
            self.log("No database selected.")
            return

        cmd_str = f"gcloud compute networks vpc-access connectors list " \
                  f"--region={env.database.region} " \
                  f"--project={env.project.name.split('/')[-1]} --format=json"
        self.log(cmd_str, level=logging.DEBUG)
        response = os.popen(cmd_str).read()
        gcloud_list = json.loads(response)
        connector_selected = None
        connector_set = []
        for connector in gcloud_list:
            connector_data = GoogleConnector(
                **connector
            )
            connector_set.append(connector_data)
            if connector_data.name.split("/")[-1] == env.connector.name.split('/')[-1]:
                connector_selected = connector_data

        if connector_selected is None:
            self.log("Connector not found.")
            return

        env.connector = connector_selected
        env.connectors = connector_set
        self.set_env(env)

    def do_gcloud_set_secret(self, secret_key, secret_value):
        env = self.get_env()
        create_secret = True
        if isinstance(env.secrets, list) and len(env.secrets) > 0:
            for secret in env.secrets:
                if secret.name.split("/")[-1] == secret_key:
                    create_secret = False
                    break
        else:
            cmd_str = f"gcloud secrets list --project={env.project.name.split('/')[-1]} --format=json"
            self.log(cmd_str, level=logging.DEBUG)
            secrets = json.loads(os.popen(cmd_str).read())
            if isinstance(secrets, list) and len(secrets) > 0:
                for secret in secrets:
                    secret_data = GoogleSecret(**secret)
                    if secret_data.name.split("/")[-1] == secret_key:
                        create_secret = False
                        break
        with open("secret", "w") as f:
            f.write(secret_value)
        if create_secret:
            cmd_str = f"gcloud secrets create {secret_key} " \
                      f"--project={env.project.name.split('/')[-1]} " \
                      f"--data-file=secret"
        else:
            cmd_str = f"gcloud secrets versions add {secret_key} " \
                      f"--project={env.project.name.split('/')[-1]} " \
                      f"--data-file=secret"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        os.remove("secret")
        secrets = self.retry_loop(f"gcloud secrets list --project={env.project.name.split('/')[-1]} --format=json",
                                  f"{secret_key}")
        secret_selected = None
        secret_set = []
        for secret in secrets:
            secret_data = GoogleSecret(
                **secret
            )
            secret_set.append(secret_data)
            if secret_data.name.split("/")[-1] == secret_key:
                secret_selected = secret_data
        if secret_selected is None:
            self.log("Secret not found.")
            return
        env.secrets = secret_set
        self.set_env(env)

    def do_update_default_compute_engine_service_account(self, _):
        env = self.get_env()
        account_choices = json.loads(os.popen(f"gcloud iam service-accounts list "
                                              f"--project={env.project.name.split('/')[-1]} "
                                              f"--format=json").read())
        service_accounts = []
        for i, account in enumerate(account_choices):
            account_data = GoogleServiceAccount(**account)
            if account_data.displayName == "Compute Engine default service account":
                env.hasura_service_account = account_data
            service_accounts.append(account_data)
        if env.hasura_service_account is None:
            self.log("No service account found.")
            return
        env.service_accounts = service_accounts
        cmd_log_str = (f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} "
                       f"--member=serviceAccount:{env.hasura_service_account.email} "
                       f"--role=roles/cloudbuild.builds.builder "
                       f"--format=json"
                       )
        self.log(cmd_log_str, level=logging.DEBUG)
        os.system(cmd_log_str)
        cmd_log_str = (f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} "
                       f"--member=serviceAccount:{env.hasura_service_account.email} "
                       f"--role=roles/run.admin "
                       f"--format=json"
                       )
        self.log(cmd_log_str, level=logging.DEBUG)
        os.system(cmd_log_str)
        cmd_log_str = (f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} "
                       f"--member=serviceAccount:{env.hasura_service_account.email} "
                       f"--role=roles/secretmanager.secretAccessor "
                       f"--format=json"
                       )
        self.log(cmd_log_str, level=logging.DEBUG)
        os.system(cmd_log_str)

    def do_gcloud_deploy_hasura(self, _):
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.")
            return
        if env.connector is None:
            self.log("No connector selected.")
            return
        if env.hasura is None:
            self.do_update_default_compute_engine_service_account(None)
            cmd_log_str = "docker pull --platform=linux/amd64 hasura/graphql-engine:latest"
            self.log(cmd_log_str, level=logging.DEBUG)
            os.system(cmd_log_str)
            cmd_log_str = f"docker tag hasura/graphql-engine:latest " \
                          f"gcr.io/{env.project.name.split('/')[-1]}/hasura:latest"
            self.log(cmd_log_str, level=logging.DEBUG)
            os.system(cmd_log_str)
            cmd_log_str = f"docker push gcr.io/{env.project.name.split('/')[-1]}/hasura:latest"
            self.log(cmd_log_str, level=logging.DEBUG)
            os.system(cmd_log_str)
            hasura_secret = self.password()
            timeout = self.collect("Timeout (Ex. 600s): ", ["60s", "300s", "600s", "900s", "1200s", "3600s"])
            memory = self.collect("Memory (Ex. 2Gi): ", ["256Mi", "512Mi", "1Gi", "2Gi", "4Gi", "8Gi", "16Gi", "32Gi"])
            max_instances = self.collect("Max instances (Ex. 10): ")
            hasura = Hasura(
                HASURA_GRAPHQL_CORS_DOMAIN="*",
                HASURA_GRAPHQL_ENABLED_CORS="true",
                HASURA_GRAPHQL_ENABLE_CONSOLE="true",
                HASURA_GRAPHQL_ADMIN_SECRET=hasura_secret,
                HASURA_GRAPHQL_DATABASE_URL=env.database_credential.connect_url,
                HASURA_GRAPHQL_METADATA_DATABASE_URL=env.database_credential.connect_url,
                vpc_connector=env.connector.name.split('/')[-1],
                timeout=timeout,
                project_id=env.project.name.split('/')[-1],
                cpu="1",
                memory=memory,
                min_instances="1",
                max_instances=max_instances
            )
            env.hasura = hasura
            env.hasura_admin_secret = hasura_secret
            self.set_env(env)
        hasura = env.hasura
        env_dict = {}
        for k, v in hasura.__dict__.items():
            if k.startswith("HASURA_"):
                env_dict[k] = v
        assert env.database_credential is not None
        for database_credential in env.database_credentials:
            if database_credential.database_id.split('/')[-1] != env.database_credential.database_id.split('/')[-1]:
                env_dict[
                    f"HASURA_SECONDARY_URLS_{database_credential.database_id.split('/')[-1]}"
                ] = database_credential.connect_url
        secret_text = " --update-secrets="
        for k, v in env_dict.items():
            if k.startswith("HASURA_") and v is not None:
                self.do_gcloud_set_secret(k, v)
                secret_text += f"{k}={k}:latest,"
        if secret_text == "--update-secrets=":
            secret_text = ""
        else:
            secret_text = secret_text[:-1]

        deploy_command = (f"gcloud run deploy hasura "
                          f"--image=gcr.io/{env.project.name.split('/')[-1]}/hasura:latest "
                          f"--min-instances=1 "
                          f"--max-instances={hasura.max_instances} "
                          f"--cpu=1 "
                          f"--memory={hasura.memory} "
                          f"--vpc-connector={env.connector.name.split('/')[-1]} "
                          f"--port=8080 "
                          f"--command='graphql-engine' "
                          f"--args='serve' "
                          f"--timeout=600s "
                          f"--platform=managed "
                          f"--allow-unauthenticated "
                          f"--no-cpu-throttling "
                          f"--project={env.project.name.split('/')[-1]}")
        deploy_command += secret_text
        self.log(deploy_command, level=logging.DEBUG)
        os.system(deploy_command)
        services = json.loads(os.popen(f"gcloud run services list "
                                       f"--project={env.project.name.split('/')[-1]} "
                                       f"--format=json").read())
        new_services = []
        for service in services:
            service_data = GoogleService(**service)
            if service_data.metadata.name == "hasura":
                env.hasura_service = service_data
                env.hasura_service_url = service_data.status.url
                env.hasura.HASURA_GRAPHQL_URL_ROOT = f"{service_data.status.url}/v1/graphql"
                self.do_gcloud_set_secret("HASURA_GRAPHQL_URL_ROOT", env.hasura.HASURA_GRAPHQL_URL_ROOT)
            new_services.append(service_data)
        env.services = new_services
        self.set_env(env)
        self.do_import_hasura_metadata(None)

    def do_set_hasura_service_url(self, service_url):
        """
        Sets the service URL for Hasura.
        Usage: set_hasura_metadata_url <service_url>
        Example: set_hasura_metadata_url https://hasura-1234567-uc.a.run.app
        """
        env = self.get_env()
        env.hasura_service_url = service_url
        self.set_env(env)
        self.log(f"Set metadata URL to {service_url}.")

    def do_set_hasura_admin_secret(self, admin_secret):
        """
        Sets the admin secret for Hasura.
        Usage: set_hasura_admin_secret <admin_secret>
        """
        env = self.get_env()
        env.hasura_admin_secret = admin_secret
        self.set_env(env)
        self.log(f"Set admin secret to {admin_secret}.")

    def do_set_hasura_database_connection_url(self, database_connection_url):
        env = self.get_env()
        if env.hasura is None:
            hasura_data = Hasura()
            env.hasura = hasura_data
        env.hasura.HASURA_GRAPHQL_DATABASE_URL = database_connection_url
        self.set_env(env)

    def do_import_hasura_metadata(self, _):
        """
        Imports Hasura metadata.
        Usage: import_hasura_metadata
        """
        env = self.get_env()
        if env.hasura_service_url is None:
            self.log("No metadata URL set. Please set one with set_hasura_metadata_url.")
            return
        if env.hasura_admin_secret is None:
            self.log("No admin secret set. Please set one with set_hasura_admin_secret.")
            return
        metadata_url = env.hasura_service_url + "/v1/metadata"
        cmd_str = f"""curl -d'{{"type": "export_metadata", "args": {{}}}}' {metadata_url} -H "X-Hasura-Admin-Secret: {
        env.hasura_admin_secret}" -o hasura_metadata.json"""
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)

    def do_export_hasura_metadata(self, _):
        self.log("Exporting Hasura metadata...")
        env = self.get_env()
        if env.hasura_service_url is None:
            self.log("No metadata URL set. Please set one with set_hasura_metadata_url.")
            return
        if env.hasura_admin_secret is None:
            self.log("No admin secret set. Please set one with set_hasura_admin_secret.")
            return
        metadata_url = env.hasura_service_url + "/v1/metadata"
        with open("hasura_metadata.json", "r") as f:
            json_data = json.load(f)
        json_data = json.dumps(json_data)
        cmd_str = f"""curl -d'{{"type": "replace_metadata", "args": {json_data}}}' {metadata_url} -H """ + \
                  f'''"X-Hasura-Admin-Secret: {env.hasura_admin_secret}"'''
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)

    def do_gcloud_interactive(self, _):
        """
        Starts an interactive gcloud shell.
        Usage: gcloud_interactive
        """
        self.log("Starting gcloud interactive shell...")
        cmd_str = "gcloud beta interactive"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)

    def do_enable_database_local(self, database_id=""):
        env = self.get_env()
        if env.database is None:
            self.log("No database set.")
            return
        if database_id == "":
            if env.database is None:
                self.log("No database selected.")
                return
            database_id = env.database.name.split("/")[-1]

        db_instance = None
        db_credentials = None
        for db, db_creds in zip(env.databases, env.database_credentials):
            if db.name.split("/")[-1] == database_id:
                db_instance = db
            if db_creds.database_id.split("/")[-1] == database_id:
                db_credentials = db_creds
            if db_instance is not None and db_credentials is not None:
                break
        if db_instance is None or db_credentials is None:
            self.log("Invalid database id.")
            return
        cmd_str = "curl ifconfig.me"
        self.log(cmd_str, level=logging.DEBUG)
        ip_address = os.popen(cmd_str).read().strip()
        self.log(f"Your IP address is {ip_address}.")
        cmd_str = cmd_log_str = (f"gcloud sql instances patch {db_instance.name.split('/')[-1]} "
                                 f"--authorized-networks={ip_address}")
        self.log(cmd_log_str, level=logging.DEBUG)
        os.system(cmd_str)

    def do_create_default_user_table(self, _):
        env = self.get_env()
        if env.database is None:
            self.log("No database set.")
            return
        if env.database_credentials is None:
            self.log("No database credentials set.")
            return

        host = None
        for ip_addr in env.database.ipAddresses:
            if ip_addr.type == "PRIMARY":
                host = ip_addr.ipAddress

        if host is None:
            self.log("No primary IP address found.")
            return

        conn = self.get_database_connection(
            host=host,
            password=env.database_credential.password
        )

        db_string = """create table if not exists "user"
        (
            user_id    text                     default gen_random_uuid() not null,
            user_phone text                                               not null,
            role       text                     default 'user'::text      not null,
            created_at timestamp with time zone default now(),
            updated_at timestamp with time zone default now(),
            primary key (user_id),
            unique (user_phone)
        );"""
        cursor = conn.cursor()
        cursor.execute(db_string)
        conn.commit()
        conn.close()
        self.do_import_hasura_metadata(None)
        with open("hasura_metadata.json", "r") as f:
            metadata = json.load(f)
        metadata["sources"][0]["tables"] = [
            {
                "table": {
                    "name": "user",
                    "schema": "public"
                }
            }
        ]
        with open("hasura_metadata.json", "w") as f:
            json.dump(metadata, f)
        self.do_export_hasura_metadata(None)

    def do_gcloud_create_auth_service_account(self, _):
        env = self.get_env()
        if env.auth_service_account is not None:
            self.log(f"Service account already created: {env.auth_service_account.email}")
            return
        if env.project is None:
            self.log("No project set. Please set one with gcloud_create_project.")
            return
        if env.hasura_service is None:
            self.log("No service account found.")
            return
        cmd_log_str = f"gcloud iam service-accounts create pysura-admin " \
                      f"--project={env.project.name.split('/')[-1]} " \
                      f"--display-name=pysuraadmin"
        self.log(cmd_log_str, level=logging.DEBUG)
        os.system(cmd_log_str)
        cmd_str = f"gcloud iam service-accounts list " \
                  f"--project={env.project.name.split('/')[-1]} " \
                  f"--format=json"
        self.log(cmd_str, level=logging.DEBUG)
        account_choices = json.loads(os.popen(cmd_str).read())
        service_accounts = []
        for i, account in enumerate(account_choices):
            account_data = GoogleServiceAccount(**account)
            if account_data.displayName == "pysuraadmin":
                env.auth_service_account = account_data
            service_accounts.append(account_data)
        if env.auth_service_account is None:
            self.log("No service account found.")
            return
        cmd_str = f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} " \
                  f"--member=serviceAccount:{env.auth_service_account.email} " \
                  f"--role=roles/firebase.admin " \
                  f"--format=json"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} " \
                  f"--member=serviceAccount:{env.auth_service_account.email} " \
                  f"--role=roles/cloudbuild.builds.builder " \
                  f"--format=json"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} " \
                  f"--member=serviceAccount:{env.auth_service_account.email} " \
                  f"--role=roles/firebaseauth.admin " \
                  f"--format=json"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud iam service-accounts keys create admin.json " \
                  f"--iam-account={env.auth_service_account.email} " \
                  f"--format=json"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        with open("admin.json", "r") as f:
            admin_secrets = json.load(f)
        env.auth_service_account.key_file = admin_secrets
        env.service_accounts = service_accounts
        self.set_env(env)
        os.remove("admin.json")

    def do_attach_auth(self, _):
        env = self.get_env()
        if os.path.isdir("pysura_auth"):
            os.chdir("pysura_auth")
        else:
            os.mkdir("pysura_auth")
            os.chdir("pysura_auth")
        path = self.get_site_packages_path(submodule="pysura_auth")
        # Remove the current files
        for root, dirs, files in os.walk(os.getcwd()):
            for f in files:
                os.remove(os.path.join(root, f))
        # Copy the new files
        for root, dirs, files in os.walk(path):
            for f in files:
                if "__pycache__" in root:
                    continue
                file_path = os.path.join(root, f)
                shutil.copy(file_path, os.path.join(os.getcwd(), f))
        with open("main.py", "r") as f:
            lines = f.readlines()
        new_lines = []
        for line in lines:
            if "PROJECT_ID_HERE" in line:
                line = line.replace("PROJECT_ID_HERE", env.project.name.split("/")[-1])
            new_lines.append(line)
        with open("main.py", "w") as f:
            f.writelines(new_lines)

        cmd_log_str = (f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} "
                       f"--member=serviceAccount:{env.project.name.split('/')[-1]}@appspot.gserviceaccount.com "
                       f"--role=roles/secretmanager.secretAccessor "
                       f"--format=json"
                       )
        self.log(cmd_log_str, level=logging.DEBUG)
        os.system(cmd_log_str)
        cmd_str = f'gcloud functions deploy on_user_create ' \
                  f'--runtime=python39 ' \
                  f'--trigger-event=providers/firebase.auth/eventTypes/user.create ' \
                  f'--trigger-resource={env.project.name.split("/")[-1]} ' \
                  f'--min-instances=1 ' \
                  f'--format=json'
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f'gcloud functions deploy on_user_delete ' \
                  f'--runtime=python39 ' \
                  f'--trigger-event=providers/firebase.auth/eventTypes/user.delete ' \
                  f'--trigger-resource={env.project.name.split("/")[-1]} ' \
                  f'--min-instances=1 ' \
                  f'--format=json'
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f'gcloud functions deploy logout_user ' \
                  f'--runtime=python39 ' \
                  f'--trigger-http ' \
                  f'--allow-unauthenticated ' \
                  f'--min-instances=1 ' \
                  f'--format=json'
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f'gcloud functions deploy refresh_user_claims ' \
                  f'--runtime=python39 ' \
                  f'--trigger-http ' \
                  f'--allow-unauthenticated ' \
                  f'--min-instances=1 ' \
                  f'--format=json'
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        os.chdir("..")
        cmd_str = f"gcloud functions list " \
                  f"--project={env.project.name.split('/')[-1]} " \
                  f"--format=json"
        self.log(cmd_str, level=logging.DEBUG)
        functions = json.loads(os.popen(cmd_str).read())
        new_functions = []
        for function in functions:
            function_data = GoogleCloudFunction(**function)
            new_functions.append(function_data)
        env.functions = new_functions
        jwt_config = json.dumps(json.loads("""{
          "type": "RS256",
          "jwk_url": "https://www.googleapis.com/service_accounts/v1/jwk/securetoken@system.gserviceaccount.com",
          "audience": "PROJECT_ID",
          "issuer": "https://securetoken.google.com/PROJECT_ID"
        }""".replace("PROJECT_ID", env.project.name.split("/")[-1])))
        env.hasura.HASURA_GRAPHQL_JWT_SECRET = jwt_config
        self.set_env(env)
        self.do_gcloud_deploy_hasura(None)

    def do_attach_firebase(self, _):
        env = self.get_env()
        cmd_str = f"firebase projects:addfirebase  {env.project.name.split('/')[-1]}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"firebase login --interactive"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        if env.auth_service_account is None:
            self.do_gcloud_create_auth_service_account(None)
            env = self.get_env()
        with open("admin.json", "w") as f:
            json.dump(env.auth_service_account.key_file, f)
        self.do_attach_flutter(None)
        cmd_str = f"gcloud auth activate-service-account --key-file=admin.json {env.auth_service_account.email}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        os.remove("admin.json")
        cmd_str = "gcloud auth print-access-token"
        self.log(cmd_str, level=logging.DEBUG)
        access_token = os.popen(cmd_str).read().strip()
        cmd_str = f"curl -X POST -H 'Authorization:Bearer {access_token}' -H 'Content-Type:application/json' " \
                  f"'https://identitytoolkit.googleapis.com/v2/projects" \
                  f"/{env.project.name.split('/')[-1]}/identityPlatform:initializeAuth'"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"curl -H 'Authorization:Bearer {access_token}' -H 'Content-Type:application/json' " \
                  f"'https://identitytoolkit.googleapis.com/admin/v2/projects" \
                  f"/{env.project.name.split('/')[-1]}/config'"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        body_data = {
            "authorizedDomains": [
                "localhost",
                f"{env.project.name.split('/')[-1]}.firebaseapp.com",
                f"{env.project.name.split('/')[-1]}.web.app"
            ],
            "signIn": {
                "phoneNumber": {
                    "enabled": True,
                    "testPhoneNumbers": {
                        "+15555215551": "000001",
                        "+15555215552": "000002"
                    }
                },
                "email": {
                    "enabled": False,
                    "passwordRequired": False
                },
                "anonymous": {
                    "enabled": False
                },
                "allowDuplicateEmails": False
            }
        }
        cmd_str = f"curl -X PATCH " \
                  f"-H 'Authorization:Bearer {access_token}' " \
                  f"-H 'Content-Type:application/json' " \
                  f"'https://identitytoolkit.googleapis.com/admin/v2/projects" \
                  f"/{env.project.name.split('/')[-1]}/config?updateMask=Config.authorizedDomains," \
                  f"Config.signIn.email.enabled,Config.signIn.email.passwordRequired," \
                  f"Config.signIn.phoneNumber.enabled,Config.signIn.phoneNumber.testPhoneNumbers," \
                  f"Config.signIn.anonymous.enabled," \
                  f"Config.signIn.allowDuplicateEmails' " \
                  f"-d '{json.dumps(body_data)}'"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = "gcloud auth login"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        self.do_attach_auth(None)
        self.log("Please enable phone sign in in the Firebase console", level=logging.INFO)
        self.log(f"https://console.firebase.google.com/project/{env.project.name.split('/')[-1]}/authentication"
                 f"/providers",
                 level=logging.INFO
                 )
        ready = self.collect("Have you enabled phone sign in in the Firebase console? (y/n): ")
        if ready != "y":
            self.log("Please enable phone sign in in the Firebase console", level=logging.INFO)
            return

    def do_check_gcloud(self, _):
        cmd_str = "gcloud version --format=json"
        self.log(cmd_str, level=logging.DEBUG)
        try:
            gcloud_version = json.loads(os.popen(cmd_str).read().strip())
            self.log(gcloud_version, level=logging.DEBUG)
            # ensure that Google Cloud SDK is at least 411.0.0
            if gcloud_version["Google Cloud SDK"] < "411.0.0":
                raise Exception("Google Cloud SDK is not up to date")
            # ensure that alpha is at least 2022.12.05
            if gcloud_version["alpha"] < "2022.12.05":
                raise Exception("Google Cloud SDK alpha is not up to date")
            # ensure that beta is at least 2022.12.05
            if gcloud_version["beta"] < "2022.12.05":
                raise Exception("Google Cloud SDK beta is not up to date")
            return True
        except Exception as e:
            self.log(str(e), level=logging.ERROR)
            self.log("Please update Google Cloud SDK", level=logging.ERROR)
            return False

    def do_attach_flutter(self, _):
        env = self.get_env()
        if env.hasura is None:
            self.log("Please setup Hasura first", level=logging.ERROR)
            return
        if os.path.isdir("frontend"):
            os.chdir("frontend")
        else:
            os.mkdir("frontend")
            os.chdir("frontend")
        cmd_str = f"flutter create . "
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        os.chdir("android")
        cmd_str = "./gradlew signingReport"
        self.log(cmd_str, level=logging.DEBUG)
        response = os.popen(cmd_str).read()
        variants = re.findall(r'Variant: (.+)', response)
        configs = re.findall(r'Config: (.+)', response)
        md5s = re.findall(r'MD5: (.+)', response)
        sha1s = re.findall(r'SHA1: (.+)', response)
        sha256s = re.findall(r'SHA-256: (.+)', response)
        valid_until = re.findall(r'Valid until: (.+)', response)
        signing_reports = []
        for variant, config, md5, sha1, sha256, valid in zip(variants, configs, md5s, sha1s, sha256s, valid_until):
            signing_report_data = {
                'variant': variant,
                'config': config,
                'md5': md5,
                'sha1': sha1,
                'sha256': sha256,
                'valid_until': valid
            }
            android_report = AndroidSigningReport(**signing_report_data)
            signing_reports.append(android_report)
            if android_report.variant == "debug":
                env.android_debug_signing_report = android_report
        env.android_signing_reports = signing_reports
        os.chdir("..")
        if not os.path.exists("pubspec.yaml"):
            self.log("pubspec.yaml not found", level=logging.ERROR)
            return
        os.remove("pubspec.yaml")
        if not os.path.exists("lib/main.dart"):
            self.log("lib/main.dart not found", level=logging.ERROR)
            return
        os.remove("lib/main.dart")
        os.mkdir("lib/common")
        os.mkdir("lib/controllers")
        os.mkdir("lib/pages")
        os.mkdir("lib/widgets")
        os.remove("test/widget_test.dart")
        path = self.get_site_packages_path(submodule="pysura_frontend")
        for root, dirs, files in os.walk(path):
            for f in files:
                if "__pycache__" in root or ".dart_tool" in root or ".idea" in root or ".git" in root:
                    continue
                if f == "pubspec.yaml":
                    shutil.copy(os.path.join(root, f), ".")
                else:
                    dir_path = root[root.rfind("lib"):]
                    file_path = os.path.join(root, f)
                    dir_paths = dir_path.split(os.sep)
                    dir_paths = ["/".join(dir_paths[:i + 1]) for i in range(len(dir_paths))]
                    for path in dir_paths:
                        if not os.path.isdir(path):
                            os.mkdir(path)
                    shutil.copy(file_path, dir_path)
        app_name = self.collect("What will your public facing App name be? (iOS store/Google Playstore): ")
        while not self.confirm_loop(app_name):
            app_name = self.collect("What will your public facing App name be? (iOS store/Google Playstore): ")

        with open("lib/common/constants.dart", "r") as f:
            constants = f.read()
        constants = constants.replace("APP_NAME", app_name)
        constants = constants.replace("HTTPS_URL", env.hasura.HASURA_GRAPHQL_URL_ROOT)
        constants = constants.replace("WS_URL", env.hasura.HASURA_GRAPHQL_URL_ROOT.replace("https", "ws"))
        with open("lib/common/constants.dart", "w") as f:
            f.write(constants)
        cmd_str = "npm install -g firebase-tools"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"dart pub global activate flutterfire_cli"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = 'export PATH="$PATH":"$HOME/.pub-cache/bin"'
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = "echo $0"
        self.log(cmd_str, level=logging.DEBUG)
        response = os.popen(cmd_str).read()
        if "zsh" in response:
            cmd_str = "source ~/.zshrc"
        elif "bash" in response:
            cmd_str = "source ~/.bashrc"
        else:
            cmd_str = "source ~/.profile"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"flutterfire configure " \
                  f"--platforms=android,ios,macos,web,linux,windows"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = "flutter pub get"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        with open("ios/Runner/GoogleService-Info.plist", "rb") as f:
            ios_plist = plistlib.load(f)
        reversed_ios_client_id = ios_plist["REVERSED_CLIENT_ID"]
        with open("ios/Runner/Info.plist", "rb") as f:
            ios_plist = plistlib.load(f)
        ios_bundle = {
            "CFBundleTypeRole": "Editor",
            "CFBundleURLSchemes": [reversed_ios_client_id]
        }
        ios_plist["CFBundleURLTypes"] = [
            ios_bundle
        ]
        env.ios_cf_bundle_url_types = IosCFBundleURLTypes(**ios_bundle)
        with open("ios/Runner/Info.plist", "wb") as f:
            plistlib.dump(ios_plist, f)
        self.log(f"SHA1:\n{env.android_debug_signing_report.sha1}", level=logging.DEBUG)
        self.log(f"SHA256:\n{env.android_debug_signing_report.sha256}", level=logging.DEBUG)
        self.log(f"Please visit:\nhttps://console.firebase.google.com/project/{env.project.name.split('/')[-1]}/"
                 f"settings/general/android\nAdd the SHA1 and SHA256 to the list of fingerprints", level=logging.DEBUG)
        ready = self.collect("Are you ready to continue? (y/n): ")
        while ready != "y":
            ready = self.collect("Are you ready to continue? (y/n): ")
        cmd_str = "flutter doctor"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        os.chdir("..")
        self.set_env(env)

    def do_setup_pysura(self, _):
        """
        Setups up a Pysura project
        """
        if not self.do_check_gcloud(None):
            return
        env = self.get_env()
        if env.gcloud_logged_in is False:
            self.do_gcloud_login()
        if env.organization is None:
            self.do_gcloud_choose_organization(None)
        hasura_project_name = self.collect("Hasura project name: ")
        if self.confirm_loop(hasura_project_name):
            if env.project is None:
                self.do_gcloud_create_project(project_id=hasura_project_name)
            if env.billing_account is None:
                self.do_gcloud_link_billing_account()
            if env.api_services is None:
                self.do_gcloud_enable_api_services(None)
            if env.network is None:
                self.do_gcloud_create_network(network_id=hasura_project_name)
            if env.address is None:
                self.do_gcloud_create_address(address_id=hasura_project_name)
            if env.peering is None:
                self.do_gcloud_create_vpc_peering(peering_id=hasura_project_name)
            if env.firewalls is None:
                self.do_gcloud_create_firewall(firewall_id=hasura_project_name)
            if env.database_credential is None:
                self.do_gcloud_create_database(database_id=hasura_project_name)
            if env.connector is None:
                self.do_gcloud_create_serverless_connector(connector_id=hasura_project_name)
            self.do_gcloud_deploy_hasura(None)
            self.do_gcloud_create_auth_service_account(None)
            env = self.get_env()
            self.do_enable_database_local(database_id=env.database.name.split("/")[-1])
            self.do_create_default_user_table(None)
            self.do_attach_firebase(None)
