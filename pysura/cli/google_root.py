from pysura.pysura_types.root_cmd import RootCmd
from pysura.pysura_types.google_pysura_env import *
import json
import os
from pydantic.error_wrappers import ValidationError
import logging
import random
from string import ascii_letters, digits
import site
import shutil
import plistlib
from python_graphql_client import GraphqlClient
from requests.exceptions import ConnectionError
import time
import re
import asyncpg
import asyncio


class Gql:
    GET_USER_ID_BY_PHONE_GQL = """query GetUserIdByPhone($phone_number: String = "") {
  user(where: {user_phone: {_eq: $phone_number}}, limit: 1) {
    user_id
  }
}
"""

    UPDATE_USER_ROLE_GQL = """mutation UpdateUserRole($user_id: String = "", $role: ENUM_ROLE_enum = admin) {
  update_user_by_pk(pk_columns: {user_id: $user_id}, _set: {role: $role}) {
    user_id
  }
}
"""


class GoogleRoot(RootCmd):

    def __init__(self, *arg, **kwargs):
        super().__init__(*arg, **kwargs)
        self.intro = "Welcome to Pysura for Google Architectures! Type help or ? to list commands."
        self.prompt = "(pysura_cli) >>> "
        self.setup_step = 0
        self.graphql_client = None

    def get_graphql_client(self):
        env = self.get_env()
        if env.hasura_service_url is None:
            self.log("Hasura service url is not set!", logging.ERROR)
            return None
        if env.hasura is None or env.hasura.HASURA_GRAPHQL_ADMIN_SECRET is None:
            self.log("Hasura admin secret is not set!", logging.ERROR)
            return None
        graphql_url = f"{env.hasura_service_url}/v1/graphql"
        headers = {
            "Content-Type": "application/json",
            "X-Hasura-Admin-Secret": env.hasura.HASURA_GRAPHQL_ADMIN_SECRET
        }
        self.graphql_client = GraphqlClient(endpoint=graphql_url, headers=headers)
        return self.graphql_client

    def execute_graphql(self, gql_str, variables):
        response = None
        client = self.graphql_client
        if client is None:
            client = self.get_graphql_client()
        try:
            response = client.execute(query=gql_str, variables=variables)
        except ConnectionError as e:
            self.log(str(e), logging.ERROR)
            client = self.get_graphql_client()
            response = client.execute(query=gql_str, variables=variables)
        except Exception as e:
            self.log(str(e), logging.ERROR)
        finally:
            return response

    @staticmethod
    def get_site_packages_path(submodule="pysura_auth"):
        return os.path.join(site.getsitepackages()[0], "pysura", "library_data", submodule)

    @staticmethod
    async def run_sql(host="secret",
                      name="postgres",
                      user="postgres",
                      password="secret",
                      port=5432,
                      sql=""):
        conn = await asyncpg.connect(
            host=host,
            database=name,
            user=user,
            password=password,
            port=port
        )
        await conn.execute(sql)
        await conn.close()

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
            self.log(f"Invalid default: {default}", level=logging.ERROR)
            return
        try:
            if len(gcloud_list) > 0:
                choice = self.collect(prompt_str, choice_list)
                if choice not in choice_list:
                    self.log("Invalid choice.", logging.ERROR)
                    return
                return choice
            else:
                self.log("No items found.", logging.ERROR)
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
        self.log(response, logging.DEBUG)
        gcloud_list = json.loads(response)
        choice = None
        if choice is None:
            for i, gcloud_dict in enumerate(gcloud_list):
                self.log(f"\n{i}\t{gcloud_dict.get('name', None)}:\n{json.dumps(gcloud_dict, indent=4)}", logging.INFO)
            choice = self.collect("Select a number from the list above: ").strip()
            choice = int(choice)
        if choice is not None:
            env_item = gcloud_list[choice]
            try:
                env_item = model(**env_item)
            except ValidationError:
                self.log("The selected item has inconsistent metadata.", logging.ERROR)
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
        self.log("Exiting...", level=logging.INFO)
        exit(0)

    def do_quit(self, _):
        """
        Exits the application.
        Usage: quit
        """
        self.log("Exiting...", level=logging.INFO)
        exit(0)

    def do_gcloud_login(self, check_logged_in=False, auto_advance=True):
        """
        Logs into gcloud.
        Usage: gcloud_login
        """
        if isinstance(check_logged_in, str):
            check_logged_in = False
        if check_logged_in:
            env = self.get_env()
            self.log("Checking if already logged into gcloud...", level=logging.INFO)
            if env.gcloud_logged_in:
                self.log("Already logged into gcloud!", level=logging.INFO)
                return
        self.log("Logging into gcloud...", level=logging.INFO)
        cmd_str = "gcloud auth login"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        if not auto_advance:
            login_success = self.collect("Did you successfully login? (y/n) ")
            if login_success.strip().lower() == "y":
                env = self.get_env()
                env.gcloud_logged_in = True
                self.set_env(env)
            else:
                self.user_input_no_loop(self.do_gcloud_login)
        else:
            env = self.get_env()
            env.gcloud_logged_in = True
            self.set_env(env)

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

    def do_gcloud_shutdown_project(self, _):
        """
        Shuts down the current project
        """
        pass

    def gcloud_enable_api_services(self):
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
        cmd_str = f"gcloud services enable artifactregistry.googleapis.com --project={project_id}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"gcloud services enable storage-api.googleapis.com --project={project_id}"
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

    def gcloud_create_project(self, project_id=""):
        """
        Creates a gcloud project.
        Usage: gcloud_project_create
        """
        env = self.get_env()
        use_organization = self.collect("Do you want to use an organization? (y/n) ")
        use_org = use_organization.strip().lower() == "y"
        if use_org:
            if env.organization is None:
                self.log("No organization selected.", level=logging.ERROR)
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
            if project is None:
                time.sleep(1)
                cmd_str = f"gcloud projects list --format=json"
                self.log(cmd_str, level=logging.DEBUG)
                response = os.popen(cmd_str).read()
                projects = json.loads(response)
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
            self.user_input_no_loop(self.gcloud_create_project)

    def gcloud_create_network(self, network_id=""):
        """
        Creates a Network.
        Usage: gcloud_network_create
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.", level=logging.ERROR)
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
            gcloud_list = self.gcloud_retry_loop(cmd_str, network_name)
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
            self.user_input_no_loop(self.gcloud_create_network)

    def gcloud_create_address(self, address_id=""):
        """
        Creates an address.
        Usage: gcloud_address_create
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.", level=logging.ERROR)
            return
        if env.network is None:
            self.log("No network selected.", level=logging.ERROR)
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
            gcloud_list = self.gcloud_retry_loop(cmd_str, address_name)
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
                self.log("Address not found.", level=logging.ERROR)
                return
            env.address = address_selected
            env.addresses = address_set
            self.set_env(env)
            if address_selected is None:
                self.log("Address not found.", level=logging.ERROR)
                return
        else:
            self.user_input_no_loop(self.gcloud_create_address)

    def gcloud_create_vpc_peering(self, peering_id=""):
        """
        Creates a VPC Peering.
        Usage: gcloud_vpc_peering_create
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.", level=logging.ERROR)
            return
        if env.network is None:
            self.log("No network selected.", level=logging.ERROR)
            return
        if env.address is None:
            self.log("No address selected.", level=logging.ERROR)
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
            gcloud_list = self.gcloud_retry_loop(cmd_str, peering_name)
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
                self.log("Peering not found.", level=logging.ERROR)
                return
            env.peering = peering_selected
            env.peerings = peering_set
            self.set_env(env)
        else:
            self.user_input_no_loop(self.gcloud_create_vpc_peering)

    def gcloud_create_firewall(self, firewall_id=""):
        """
        Creates a firewall.
        Usage: gcloud_firewall_create
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.", level=logging.ERROR)
            return
        if env.network is None:
            self.log("No network selected.", level=logging.ERROR)
            return
        if env.address is None:
            self.log("No address selected.", level=logging.ERROR)
            return
        if env.peering is None:
            self.log("No peering selected.", level=logging.ERROR)
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
            self.gcloud_retry_loop(cmd_str, f"{firewall_name}-allow-traffic")
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
            self.user_input_no_loop(self.gcloud_create_firewall)

    def do_gcloud_create_database(self,
                                  database_id="",
                                  cpu_default="2",
                                  memory_default="8192",
                                  db_version_default="POSTGRES_14",
                                  zone_default="us-central1-b",
                                  availability_type_default="regional",
                                  auto_advance=True):
        """
        Creates a database.
        :param database_id: The name for the database
        :param cpu_default: The number of CPU's for the database
        :param memory_default: The amount of RAM for the database
        :param db_version_default: The version of the database
        :param zone_default: The zone to create the database in
        :param availability_type_default:  The type of availability for the database
        :param auto_advance: Whether to automatically advance to the creation step


        Usage: gcloud_create_database database_id
        Example: gcloud_create_database my-database 2 8192 POSTGRES_14 us-central1-b regional True
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.", level=logging.ERROR)
            return
        if env.network is None:
            self.log("No network selected.", level=logging.ERROR)
            return

        arg_len = len(database_id.strip())
        if arg_len == 0:
            db_name = self.collect("Enter a database name: ")
        else:
            db_name = database_id
        if arg_len == 0 and not self.confirm_loop(db_name):
            self.user_input_no_loop(self.do_gcloud_create_database)
            return
        if len(cpu_default.strip()) == 0:
            cpu_number = self.collect("Enter the number of CPU's for the database number (Ex. 2): ")
        else:
            cpu_number = cpu_default
        if len(memory_default.strip()) == 0:
            memory_amount = self.collect("Enter the amount of memory for the database (MiB) (Ex. 8192): ", ["2048",
                                                                                                            "4096",
                                                                                                            "8192",
                                                                                                            "16384",
                                                                                                            "24576",
                                                                                                            "32768"])
        else:
            memory_amount = memory_default
        if len(db_version_default.strip()) == 0:
            db_version = self.collect("Enter the database version (Supports POSTGRES_14, ): ", ["POSTGRES_14"])
        else:
            db_version = db_version_default
        cpu_number = str(int(cpu_number.strip()))
        memory_amount = f"{str(int(memory_amount.strip()))}MiB"
        if len(zone_default.strip()) == 0:
            zone = self.gcloud_list_typed_choice(f"gcloud compute zones list "
                                                 f"--project={env.project.name.split('/')[-1]} "
                                                 f"--format=json", "Enter a zone (Ex. us-central1-b): ", "name")
        else:
            zone = zone_default
        if zone is None:
            self.log("No zone selected.", level=logging.ERROR)
            return
        if len(availability_type_default.strip()) == 0:
            availability_types = ["regional", "zonal"]
            availability_type = self.collect("Enter the availability type (regional/zonal): ", availability_types)
            if availability_type not in availability_types:
                self.log("Invalid availability type.", level=logging.ERROR)
                return
        else:
            availability_type = availability_type_default
        db_password = self.password()
        self.log(f"You are preparing to create a database with the following parameters: "
                 f"Name: {db_name}, CPU's: {cpu_number}, Memory: {memory_amount}, "
                 f"Version: {db_version}, Zone: {zone}, "
                 f"Network: {env.network.name.split('/')[-1]}, Project: {env.project.name.split('/')[-1]}, "
                 f"DatabasePassword: {db_password}")
        if not auto_advance:
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
        gcloud_list = self.gcloud_retry_loop(cmd_str, f"{db_name}")
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
            self.log("Database not found.", level=logging.ERROR)
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

    def gcloud_create_serverless_connector(self,
                                           connector_id="",
                                           range_default="10.8.0.0/28"):
        """
        Creates a serverless connector.
        Usage: create_serverless_connector
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.", level=logging.ERROR)
            return
        if env.network is None:
            self.log("No network selected.", level=logging.ERROR)
            return
        if env.database is None:
            self.log("No database selected.", level=logging.ERROR)
            return

        if len(range_default.strip()) == 0:
            range_choice = self.collect("Select a range (Ex. 10.8.0.0/28): ", [f"10.{i}.0.0/28" for i in range(8, 100)])
            arg_len = len(connector_id.split())
        else:
            range_choice = range_default
            arg_len = len(connector_id.split())
        if arg_len == 0:
            connector_name = self.collect("Enter a connector name: ")
        else:
            connector_name = connector_id
        if arg_len == 0 and not self.confirm_loop(connector_name):
            self.user_input_no_loop(self.gcloud_create_serverless_connector)
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
        gcloud_list = self.gcloud_retry_loop(cmd_str, f"{connector_name}")
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
            self.log("Connector not found.", level=logging.ERROR)
            return
        env.connector = connector_selected
        env.connectors = connector_set
        self.set_env(env)

    def gcloud_choose_serverless_connector(self):
        """
        Chooses a serverless connector.
        Usage: choose_serverless_connector
        """
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.", level=logging.ERROR)
            return
        if env.network is None:
            self.log("No network selected.", level=logging.ERROR)
            return
        if env.database is None:
            self.log("No database selected.", level=logging.ERROR)
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
            self.log("Connector not found.", level=logging.ERROR)
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
        secrets = self.gcloud_retry_loop(f"gcloud secrets list --project={env.project.name.split('/')[-1]} "
                                         f"--format=json",
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
            self.log("Secret not found.", level=logging.ERROR)
            return
        env.secrets = secret_set
        self.set_env(env)

    def update_default_compute_engine_service_account(self):
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
            self.log("No service account found.", level=logging.ERROR)
            return
        env.service_accounts = service_accounts
        cmd_log_str = (f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} "
                       f"--member=serviceAccount:{env.hasura_service_account.email} "
                       f"--role=roles/cloudbuild.builds.builder "
                       f"--format=json"
                       )
        self.log(cmd_log_str, level=logging.DEBUG)
        self.log(os.popen(cmd_log_str).read(), level=logging.DEBUG)
        cmd_log_str = (f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} "
                       f"--member=serviceAccount:{env.hasura_service_account.email} "
                       f"--role=roles/run.admin "
                       f"--format=json"
                       )
        self.log(cmd_log_str, level=logging.DEBUG)
        self.log(os.popen(cmd_log_str).read(), level=logging.DEBUG)
        cmd_log_str = (f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} "
                       f"--member=serviceAccount:{env.hasura_service_account.email} "
                       f"--role=roles/secretmanager.secretAccessor "
                       f"--format=json"
                       )
        self.log(cmd_log_str, level=logging.DEBUG)
        self.log(os.popen(cmd_log_str).read(), level=logging.DEBUG)
        self.set_env(env)

    def do_gcloud_deploy_hasura(self, timeout_default="600s", memory_default="2Gi", max_instances_default="10"):
        env = self.get_env()
        if env.project is None:
            self.log("No project selected.", level=logging.ERROR)
            return
        if env.connector is None:
            self.log("No connector selected.", level=logging.ERROR)
            return
        if env.hasura is None:
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
            if len(timeout_default.strip()) == 0:
                timeout = self.collect("Timeout (Ex. 600s): ", ["60s", "300s", "600s", "900s", "1200s", "3600s"])
            else:
                timeout = timeout_default
            if len(memory_default.strip()) == 0:
                memory = self.collect("Memory (Ex. 2Gi): ",
                                      ["256Mi", "512Mi", "1Gi", "2Gi", "4Gi", "8Gi", "16Gi", "32Gi"])
            else:
                memory = memory_default
            if len(max_instances_default.strip()) == 0:
                max_instances = self.collect("Max instances (Ex. 10): ")
            else:
                max_instances = max_instances_default
            hasura_event_secret = self.password()
            hasura_storage_bucket = f"{env.project.name.split('/')[-1]}-hasura-storage-{int(time.time())}"
            cmd_str = f"gcloud storage buckets create gs://{hasura_storage_bucket} " \
                      f"--project={env.project.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)
            hasura = Hasura(
                HASURA_GRAPHQL_CORS_DOMAIN="*",
                HASURA_GRAPHQL_ENABLED_CORS="true",
                HASURA_GRAPHQL_ENABLE_CONSOLE="true",
                HASURA_GRAPHQL_ADMIN_SECRET=hasura_secret,
                HASURA_GRAPHQL_DATABASE_URL=env.database_credential.connect_url,
                HASURA_GRAPHQL_METADATA_DATABASE_URL=env.database_credential.connect_url,
                HASURA_EVENT_SECRET=hasura_event_secret,
                HASURA_STORAGE_BUCKET=hasura_storage_bucket,
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
        if env.hasura is not None:
            if isinstance(env.hasura.microservice_urls, list):
                for micro_url in env.hasura.microservice_urls:
                    env_dict[micro_url.url_wrapper] = micro_url.url

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
            self.log("No metadata URL set. Please set one with set_hasura_metadata_url.", level=logging.ERROR)
            return
        if env.hasura_admin_secret is None:
            self.log("No admin secret set. Please set one with set_hasura_admin_secret.", level=logging.ERROR)
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
            self.log("No metadata URL set. Please set one with set_hasura_metadata_url.", level=logging.ERROR)
            return
        if env.hasura_admin_secret is None:
            self.log("No admin secret set. Please set one with set_hasura_admin_secret.", level=logging.ERROR)
            return
        metadata_url = env.hasura_service_url + "/v1/metadata"
        with open("hasura_metadata.json", "r") as f:
            json_data = json.load(f)
        hasura_metadata = HasuraMetadata(**json_data)
        json_data = json.dumps(json_data)
        cmd_str = f"""curl -d'{{"type": "replace_metadata", "args": {json_data}}}' {metadata_url} -H """ + \
                  f'''"X-Hasura-Admin-Secret: {env.hasura_admin_secret}"'''
        self.log(cmd_str, level=logging.DEBUG)
        response = json.loads(os.popen(cmd_str).read())
        retry_count = 0
        while response.get("message", None) != "success" and retry_count < 5:
            time.sleep(3 * retry_count)
            response = json.loads(os.popen(cmd_str).read())
            retry_count += 1

        env.hasura_metadata = hasura_metadata
        self.set_env(env)

    def gcloud_interactive(self):
        """
        Starts an interactive gcloud shell.
        Usage: gcloud_interactive
        """
        self.log("Starting gcloud interactive shell...")
        cmd_str = "gcloud beta interactive"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)

    def enable_database_local(self, database_id=""):
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
            self.log("Invalid database id.", level=logging.ERROR)
            return
        cmd_str = "curl ifconfig.me"
        self.log(cmd_str, level=logging.DEBUG)
        ip_address = os.popen(cmd_str).read().strip()
        self.log(f"Your IP address is {ip_address}.")
        cmd_str = cmd_log_str = (f"gcloud sql instances patch {db_instance.name.split('/')[-1]} "
                                 f"--authorized-networks={ip_address}")
        self.log(cmd_log_str, level=logging.DEBUG)
        os.system(cmd_str)
        env.local_database_enabled = True
        self.set_env(env)

    def create_default_user_table(self):
        env = self.get_env()
        if env.database is None:
            self.log("No database set.", level=logging.ERROR)
            return
        if env.database_credentials is None:
            self.log("No database credentials set.", level=logging.ERROR)
            return

        host = None
        for ip_addr in env.database.ipAddresses:
            if ip_addr.type == "PRIMARY":
                host = ip_addr.ipAddress

        if host is None:
            self.log("No primary IP address found.", level=logging.ERROR)
            return

        db_string = """create table "ENUM_ROLE"
(
    value   text not null,
    comment text,
    primary key (value)
);

alter table "ENUM_ROLE"
    owner to postgres;

create table "user"
(
    user_id    text                     default gen_random_uuid() not null,
    user_phone text                                               not null,
    role       text                     default 'user'::text      not null,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
    primary key (user_id),
    unique (user_phone),
    foreign key (role) references "ENUM_ROLE"
        on update cascade on delete cascade
);

alter table "user"
    owner to postgres;

create table public_user
(
    user_id text                                  not null,
    message text    default 'Pysura Rocks!'::text not null,
    number  integer default 0                     not null,
    primary key (user_id),
    foreign key (user_id) references "user"
        on update cascade on delete cascade
);

alter table public_user
    owner to postgres;

create table file
(
    file_id    text    default gen_random_uuid() not null,
    user_id    text,
    name       text                              not null,
    type       text                              not null,
    signed_url text                              not null,
    public     boolean default true              not null,
    primary key (file_id),
    foreign key (user_id) references "user"
        on update cascade on delete set null
);

alter table file
    owner to postgres;

create table app
(
    name              text not null,
    storage_bucket    text not null,
    version_latest    text not null,
    version_supported text not null,
    primary key (name)
);

alter table app
    owner to postgres;"""
        self.log(db_string, level=logging.DEBUG)
        asyncio.run(self.run_sql(
            host=host,
            password=env.database_credential.password,
            sql=db_string
        ))
        db_string = "insert into \"ENUM_ROLE\" (value) values ('admin')"
        asyncio.run(self.run_sql(
            host=host,
            password=env.database_credential.password,
            sql=db_string
        ))
        db_string = "insert into \"ENUM_ROLE\" (value) values ('user')"
        asyncio.run(self.run_sql(
            host=host,
            password=env.database_credential.password,
            sql=db_string
        ))
        self.do_import_hasura_metadata(None)
        with open("hasura_metadata.json", "r") as f:
            metadata = json.load(f)
        metadata["sources"][0]["tables"] = [
            {
                "table": {
                    "name": "ENUM_ROLE",
                    "schema": "public"
                },
                "is_enum": True,
                "select_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "columns": [
                                "comment",
                                "value"
                            ],
                            "filter": {}
                        }
                    }
                ]
            },
            {
                "table": {
                    "name": "app",
                    "schema": "public"
                }
            },
            {
                "table": {
                    "name": "file",
                    "schema": "public"
                },
                "insert_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "check": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            },
                            "columns": [
                                "file_id",
                                "name",
                                "signed_url",
                                "type",
                                "user_id"
                            ]
                        }
                    }
                ],
                "select_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "columns": [
                                "file_id",
                                "name",
                                "public",
                                "signed_url",
                                "type",
                                "user_id"
                            ],
                            "filter": {
                                "_or": [
                                    {
                                        "user_id": {
                                            "_eq": "X-Hasura-User-Id"
                                        }
                                    },
                                    {
                                        "public": {
                                            "_eq": True
                                        }
                                    }
                                ]
                            }
                        }
                    }
                ],
                "update_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "columns": [
                                "public",
                                "file_id",
                                "name",
                                "signed_url",
                                "type",
                                "user_id"
                            ],
                            "filter": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            },
                            "check": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            }
                        }
                    }
                ],
                "delete_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "filter": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            }
                        }
                    }
                ]
            },
            {
                "table": {
                    "name": "public_user",
                    "schema": "public"
                },
                "insert_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "check": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            },
                            "columns": [
                                "number",
                                "message",
                                "user_id"
                            ]
                        }
                    }
                ],
                "select_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "columns": [
                                "user_id",
                                "message",
                                "number"
                            ],
                            "filter": {}
                        }
                    }
                ],
                "update_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "columns": [
                                "number",
                                "message",
                                "user_id"
                            ],
                            "filter": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            },
                            "check": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            }
                        }
                    }
                ],
                "delete_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "filter": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            }
                        }
                    }
                ]
            },
            {
                "table": {
                    "name": "user",
                    "schema": "public"
                },
                "select_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "columns": [
                                "user_id",
                                "user_phone",
                                "role",
                                "created_at",
                                "updated_at"
                            ],
                            "filter": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            }
                        }
                    }
                ],
                "update_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "columns": [
                                "created_at",
                                "updated_at",
                                "user_phone"
                            ],
                            "filter": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            },
                            "check": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            }
                        }
                    }
                ],
                "delete_permissions": [
                    {
                        "role": "user",
                        "permission": {
                            "filter": {
                                "user_id": {
                                    "_eq": "X-Hasura-User-Id"
                                }
                            }
                        }
                    }
                ]
            }
        ]
        with open("hasura_metadata.json", "w") as f:
            json.dump(metadata, f)
        self.do_export_hasura_metadata(None)
        env.default_user_table_created = True
        self.set_env(env)

    def gcloud_create_auth_service_account(self):
        env = self.get_env()
        if env.auth_service_account is not None:
            self.log(f"Service account already created: {env.auth_service_account.email}", level=logging.DEBUG)
            return
        if env.project is None:
            self.log("No project set. Please set one with gcloud_create_project.", level=logging.ERROR)
            return
        if env.hasura_service is None:
            self.log("No service account found.", level=logging.ERROR)
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
        self.log(os.popen(cmd_str).read(), level=logging.DEBUG)
        cmd_str = f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} " \
                  f"--member=serviceAccount:{env.auth_service_account.email} " \
                  f"--role=roles/cloudbuild.builds.builder " \
                  f"--format=json"
        self.log(cmd_str, level=logging.DEBUG)
        self.log(os.popen(cmd_str).read(), level=logging.DEBUG)
        cmd_str = f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} " \
                  f"--member=serviceAccount:{env.auth_service_account.email} " \
                  f"--role=roles/firebaseauth.admin " \
                  f"--format=json"
        self.log(cmd_str, level=logging.DEBUG)
        self.log(os.popen(cmd_str).read(), level=logging.DEBUG)
        cmd_str = f"gcloud projects add-iam-policy-binding {env.project.name.split('/')[-1]} " \
                  f"--member=serviceAccount:{env.auth_service_account.email} " \
                  f"--role=roles/cloudsql.client " \
                  f"--format=json"
        self.log(cmd_str, level=logging.DEBUG)
        self.log(os.popen(cmd_str).read(), level=logging.DEBUG)
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

    def attach_auth(self):
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
        self.log(os.popen(cmd_log_str).read(), level=logging.DEBUG)
        cmd_str = f'gcloud functions deploy on_user_create ' \
                  f'--runtime=python39 ' \
                  f'--trigger-event=providers/firebase.auth/eventTypes/user.create ' \
                  f'--trigger-resource={env.project.name.split("/")[-1]} ' \
                  f'--min-instances=1 ' \
                  f'--format=json'
        self.log(cmd_str, level=logging.DEBUG)
        self.log(os.popen(cmd_str).read(), level=logging.DEBUG)
        cmd_str = f'gcloud functions deploy on_user_delete ' \
                  f'--runtime=python39 ' \
                  f'--trigger-event=providers/firebase.auth/eventTypes/user.delete ' \
                  f'--trigger-resource={env.project.name.split("/")[-1]} ' \
                  f'--min-instances=1 ' \
                  f'--format=json'
        self.log(cmd_str, level=logging.DEBUG)
        self.log(os.popen(cmd_str).read(), level=logging.DEBUG)
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
        self.do_gcloud_deploy_hasura()

    def attach_firebase(self):
        env = self.get_env()
        cmd_str = f"firebase projects:addfirebase  {env.project.name.split('/')[-1]}"
        log_str = "Please login to the same account that you used to create the project with firebase!"
        self.log(log_str, level=logging.INFO)
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = f"firebase login --interactive"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        if env.auth_service_account is None:
            self.gcloud_create_auth_service_account()
            env = self.get_env()
        with open("admin.json", "w") as f:
            json.dump(env.auth_service_account.key_file, f)
        admin_json = json.dumps(env.auth_service_account.key_file)
        self.do_gcloud_set_secret("HASURA_FIREBASE_SERVICE_ACCOUNT", admin_json)
        env.firebase_attached = True
        self.set_env(env)

    def activate_firebase_auth(self):
        env = self.get_env()
        cmd_str = f"gcloud auth activate-service-account --key-file=admin.json {env.auth_service_account.email}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = "gcloud auth print-access-token"
        self.log(cmd_str, level=logging.DEBUG)
        access_token = os.popen(cmd_str).read().strip()
        cmd_str = f"curl -X POST -H 'Authorization:Bearer {access_token}' -H 'Content-Type:application/json' " \
                  f"'https://identitytoolkit.googleapis.com/v2/projects" \
                  f"/{env.project.name.split('/')[-1]}/identityPlatform:initializeAuth'"
        self.log(cmd_str, level=logging.DEBUG)
        self.log(os.popen(cmd_str).read(), level=logging.DEBUG)
        cmd_str = f"curl -H 'Authorization:Bearer {access_token}' -H 'Content-Type:application/json' " \
                  f"'https://identitytoolkit.googleapis.com/admin/v2/projects" \
                  f"/{env.project.name.split('/')[-1]}/config'"
        self.log(cmd_str, level=logging.DEBUG)
        self.log(os.popen(cmd_str).read(), level=logging.DEBUG)
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
                    "enabled": True,
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
        self.log(os.popen(cmd_str).read(), level=logging.DEBUG)
        cmd_str = "gcloud auth login"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        self.attach_auth()
        self.log("Please enable phone sign in in the Firebase console", level=logging.INFO)
        self.log(f"https://console.firebase.google.com/project/{env.project.name.split('/')[-1]}/authentication"
                 f"/providers",
                 level=logging.INFO
                 )
        ready = self.collect("Have you enabled phone sign in in the Firebase console? (y/n): ")
        if ready != "y":
            self.log("Please enable phone sign in in the Firebase console", level=logging.INFO)
            return
        env.firebase_auth_activated = True
        self.set_env(env)

    def check_gcloud(self):
        cmd_str = "gcloud version --format=json"
        self.log(cmd_str, level=logging.DEBUG)
        try:
            gcloud_version = json.loads(os.popen(cmd_str).read().strip())
            self.log(gcloud_version, level=logging.DEBUG)
            # ensure that Google Cloud SDK is at least 411.0.0
            if gcloud_version["Google Cloud SDK"] < "411.0.0":
                raise Exception("Google Cloud SDK is not up to date")
            # ensure that beta is at least 2022.12.05
            if gcloud_version["beta"] < "2022.12.05":
                raise Exception("Google Cloud SDK beta is not up to date")
            return True
        except Exception as e:
            self.log(str(e), level=logging.ERROR)
            self.log("Please update Google Cloud SDK", level=logging.ERROR)
            return False

    def check_npm(self):
        try:
            result = os.popen('npm -v')
            output = result.read()
            version_regex = re.compile(r'^(\d+\.\d+\.\d+)$', re.MULTILINE)
            match = version_regex.search(output)
            if match is None:
                self.log("Please install npm", level=logging.ERROR)
                raise Exception("npm not installed")
            return True
        except Exception as e:
            self.log(str(e), level=logging.ERROR)
            return False

    def check_flutter(self):
        try:
            result = os.popen('flutter --version')
            output = result.read()
            version_regex = re.compile(r'^Flutter\s+(\d+\.\d+\.\d+)', re.MULTILINE)
            match = version_regex.search(output)
            if match is None:
                self.log("Please install flutter", level=logging.ERROR)
                raise Exception("flutter not installed")
            return True
        except Exception as e:
            self.log(str(e), level=logging.ERROR)
            return False

    def check_firebase(self):
        try:
            result = os.popen('firebase --version')
            output = result.read()
            version_regex = re.compile(r'^(\d+\.\d+\.\d+)$', re.MULTILINE)
            match = version_regex.search(output)
            if match is None:
                self.log("Please install firebase", level=logging.ERROR)
                raise Exception("firebase not installed")
            return True
        except Exception as e:
            self.log(str(e), level=logging.ERROR)
            return False

    def check_docker(self):
        try:
            result = os.popen('docker info')
            output = result.read()
            not_running = "Is the docker daemon running?"
            if not_running in output:
                self.log("Please start the docker daemon!", level=logging.ERROR)
                raise Exception("docker daemon not running")
            return True
        except Exception as e:
            self.log(str(e), level=logging.ERROR)
            return False

    def attach_flutter(self):
        env = self.get_env()
        if env.hasura is None:
            self.log("Please setup Hasura first", level=logging.ERROR)
            return
        self.log(f"Your project name is: {env.project.name.split('/')[-1]}", level=logging.INFO)
        confirm_choice = self.collect(f"Please enter a name of the Flutter project.\n"
                                      f"This will be used to register your app.\n"
                                      f"com.example.[projectName]\n"
                                      f"Do not use spaces, and use _ instead of -\n"
                                      f"Project Name: ",
                                      [env.project.name.split('/')[-1].replace("-", "_").replace(" ", "_")])
        if not self.confirm_loop(confirm_choice):
            self.attach_flutter()
        project_name = confirm_choice
        if os.path.isdir(project_name):
            os.chdir(project_name)
        else:
            os.mkdir(project_name)
            os.chdir(project_name)
        cmd_str = f"flutter create . "
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        os.mkdir("lib/common")
        os.mkdir("lib/controllers")
        os.mkdir("lib/pages")
        os.mkdir("lib/widgets")
        os.remove("lib/main.dart")
        os.remove("pubspec.yaml")
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
        app_name = env.project.name.replace("-", "_")
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
        cmd_str = f"dart pub global run flutterfire_cli:flutterfire configure " \
                  f"--platforms=android,ios,macos,web,linux,windows"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = "flutter pub get"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        cmd_str = "flutter doctor"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        if os.path.exists("ios/Runner/GoogleService-Info.plist") and os.path.exists("ios/Runner/Info.plist"):
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

        if os.path.isdir("android"):
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
            if len(variants) == 0:
                self.log("No signing report found", level=logging.WARNING)
                cmd_str = "gradlew signingReport"
                self.log(cmd_str, level=logging.DEBUG)
                response = os.popen(cmd_str).read()
                variants = re.findall(r'Variant: (.+)', response)
                configs = re.findall(r'Config: (.+)', response)
                md5s = re.findall(r'MD5: (.+)', response)
                sha1s = re.findall(r'SHA1: (.+)', response)
                sha256s = re.findall(r'SHA-256: (.+)', response)
                valid_until = re.findall(r'Valid until: (.+)', response)

            if len(variants) != 0:
                signing_reports = []
                for variant, config, md5, sha1, sha256, valid in zip(variants, configs, md5s, sha1s, sha256s,
                                                                     valid_until):
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
            else:
                self.log("No signing report found", level=logging.WARNING)
                env.android_signing_reports = []
            if env.android_debug_signing_report is not None and \
                    env.android_debug_signing_report.sha1 is not None and \
                    env.android_debug_signing_report.sha256 is not None:
                self.log(f"SHA1:\n{env.android_debug_signing_report.sha1}", level=logging.INFO)
                self.log(f"SHA256:\n{env.android_debug_signing_report.sha256}", level=logging.INFO)
                self.log(
                    f"Please visit:\nhttps://console.firebase.google.com/project/{env.project.name.split('/')[-1]}/"
                    f"settings/general/android\nAdd the SHA1 and SHA256 to the list of fingerprints",
                    level=logging.INFO)
                ready = self.collect("Are you ready to continue? (y/n): ")
                while ready != "y":
                    ready = self.collect("Are you ready to continue? (y/n): ")
            os.chdir("..")
        if env.hasura is not None and env.hasura.HASURA_GRAPHQL_URL_ROOT is not None and \
                env.hasura.HASURA_GRAPHQL_ADMIN_SECRET is not None:
            graphql_file = """{
  "name": "GraphQL Schema",
  "schemaPath": "schema.graphql",
  "extensions": {
    "endpoints": {
      "Default GraphQL Endpoint": {
        "url": "HASURA_GRAPHQL_URL_ROOT",
        "headers": {
          "x-hasura-admin-secret": "HASURA_GRAPHQL_ADMIN_SECRET"
        },
        "introspect": false
      }
    }
  }
}""".replace("HASURA_GRAPHQL_URL_ROOT", env.hasura.HASURA_GRAPHQL_URL_ROOT
             ).replace("HASURA_GRAPHQL_ADMIN_SECRET", env.hasura.HASURA_GRAPHQL_ADMIN_SECRET)
            with open("lib/graphql/.graphql", "w") as f:
                f.write(graphql_file)
        os.chdir("..")
        env.flutter_attached = True
        env.flutter_app_name = project_name
        self.set_env(env)

    @staticmethod
    def generate_types(ordered_custom_objects, ordered_custom_input_objects):
        base_models_template = """from typing import List
from pydantic import BaseModel

        """

        object_template = """\nclass {name}(BaseModel):\n    {fields}{config}\n"""
        field_template = "{}: {}"
        config_template = '\n\n    class Config:\n        schema_extra = {extra}'
        config_extra_start = '{"example": {'
        config_extra_middle_piece = '{field_pieces}'
        config_extra_end = "}}"
        config_field_template = '"{field_name}": {field_default}'
        field_type_map = {
            "String": "str",
            "Int": "int",
            "Float": "float",
            "Boolean": "bool",
            "ID": "str"
        }
        default_field_types = {
            "str": '"string"',
            "int": "0",
            "float": "0.0",
            "bool": "True"
        }
        for custom_object in ordered_custom_objects:
            assert len(custom_object) == 1
            custom_object_name = list(custom_object.keys())[0]
            custom_object_data = custom_object[custom_object_name]
            fields = []
            config_fields = []
            for field_name, field_data in custom_object_data["fields"].items():
                field_type = field_data["type"]
                if field_type in field_type_map:
                    field_type = field_type_map[field_type]
                if field_data["is_list"]:
                    field_type = f"List[{field_type}]"
                if field_data["is_optional"]:
                    field_type = f"{field_type} | None = None"
                if field_data["is_optional"]:
                    config_fields.append(config_field_template.format(field_name=field_name, field_default="None"))
                elif field_data["is_list"]:
                    config_fields.append(config_field_template.format(field_name=field_name, field_default="[]"))
                else:
                    config_fields.append(
                        config_field_template.format(field_name=field_name,
                                                     field_default=default_field_types[field_type]))
                fields.append(field_template.format(field_name, field_type))
            if len(config_fields) > 0:
                config_extra = config_extra_start + \
                               config_extra_middle_piece.format(field_pieces=", ".join(config_fields)) + \
                               config_extra_end
                base_models_template += object_template.format(name=custom_object_name,
                                                               fields="\n    ".join(fields),
                                                               config=config_template.format(extra=config_extra) if len(
                                                                   config_fields) > 0 else "")
            else:
                base_models_template += object_template.format(name=custom_object_name,
                                                               fields="\n    ".join(fields),
                                                               config="")
            base_models_template += "\n"

        for custom_input_object in ordered_custom_input_objects:
            assert len(custom_input_object) == 1
            custom_input_object_name = list(custom_input_object.keys())[0]
            custom_input_object_data = custom_input_object[custom_input_object_name]
            fields = []
            config_fields = []
            for field_name, field_data in custom_input_object_data["fields"].items():
                field_type = field_data["type"]
                if field_type in field_type_map:
                    field_type = field_type_map[field_type]
                if field_data["is_list"]:
                    field_type = f"List[{field_type}]"
                if field_data["is_optional"]:
                    field_type = f"{field_type} | None = None"
                if field_data["is_optional"]:
                    config_fields.append(config_field_template.format(field_name=field_name, field_default="None"))
                elif field_data["is_list"]:
                    config_fields.append(config_field_template.format(field_name=field_name, field_default="[]"))
                else:
                    config_fields.append(
                        config_field_template.format(field_name=field_name,
                                                     field_default=default_field_types[field_type]))
                fields.append(field_template.format(field_name, field_type))
            if len(config_fields) > 0:
                config_extra = config_extra_start + \
                               config_extra_middle_piece.format(field_pieces=", ".join(config_fields)) + \
                               config_extra_end
                base_models_template += object_template.format(name=custom_input_object_name,
                                                               fields="\n    ".join(fields),
                                                               config=config_template.format(extra=config_extra) if len(
                                                                   config_fields) > 0 else "")
            else:
                base_models_template += object_template.format(name=custom_input_object_name,
                                                               fields="\n    ".join(fields),
                                                               config="")
            base_models_template += "\n"

        base_models_template = base_models_template.rstrip("\n")
        base_models_template += "\n"
        with open("generated_types.py", "w") as f:
            f.write(base_models_template)

    @staticmethod
    def generate_actions(hasura_metadata, service_url, included_actions, new_hasura_metadata):
        action_template = """# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider
from pysura.faster_api.enums import ApiResponse, ClientRole
from generated_types import *

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

ROUTE = "/SNAKE/"
ALLOWED_ROLES = [  # The roles allowed to call this action
    # ALLOWED ROLES HERE
]
SNAKE_router = APIRouter(
    tags=["SNAKE"]
)


@SNAKE_router.post(ROUTE,
                   dependencies=[
                       Depends(PysuraSecurity(
                           require_jwt=True,
                           require_event_secret=True,
                           allowed_roles=ALLOWED_ROLES
                       ))
                   ],
                   response_model=CAMELOutput
                   )
async def SNAKE(_: Request,
                SNAKE_input: CAMELInput | None = None,
                provider: Provider | None = Depends(PysuraProvider(
                    # (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!
                    provide_identity=True,
                    provide_firebase=True,
                    provide_graphql=True,
                    provide_storage=True
                    # (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!
                ))):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    logging.log(logging.INFO, f"User {provider.user_identity.user_id} is authorized to access {ROUTE}")
    logging.log(logging.INFO, SNAKE_input)
    logging.log(logging.INFO, provider)
    response = CAMELOutput(
        data=None,
        nodes=None,
        response_name=ApiResponse.SUCCESS.name,
        response_value=ApiResponse.SUCCESS.value
    ).dict()
    return response
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
"""
        for action in hasura_metadata.get("actions", []):
            action_handler = action.get("definition", {}).get("handler", None)
            if action_handler == service_url:
                snake_replace = action["name"]
                camel_replace = snake_replace.replace("_", " ").title().replace(" ", "")
                new_action_template = action_template.replace("SNAKE", snake_replace).replace("CAMEL", camel_replace)
                collect_perms = []
                for permission in action["permissions"]:
                    collect_perms.append(permission["role"])
                else:
                    collect_perms.append("admin")
                collect_perms = [f"ClientRole.{i}.name" for i in sorted(list(set(collect_perms)))]
                new_action_template = new_action_template.replace("# ALLOWED ROLES HERE", ", ".join(collect_perms))
                rewrite = False
                original_data = None
                if os.path.isfile(f"actions/{snake_replace}.py"):
                    rewrite = True
                    with open(f"actions/{snake_replace}.py", "r") as f:
                        original_data = f.readlines()
                if rewrite:
                    dependency_injection = []
                    business_logic = []
                    import_lines = []
                    in_dependency_injection = False
                    in_business_logic = False
                    in_import_lines = False
                    for line in original_data:
                        if "# (IMPORTS-END) - DO NOT DELETE THIS LINE!" in line:
                            in_import_lines = False
                        if "# (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!" in line:
                            in_business_logic = False
                        if "# (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!" in line:
                            in_dependency_injection = False
                        if in_business_logic:
                            business_logic.append(line)
                        if in_dependency_injection:
                            dependency_injection.append(line)
                        if in_import_lines:
                            import_lines.append(line)
                        if "# (IMPORTS-START) - DO NOT DELETE THIS LINE!" in line:
                            in_import_lines = True
                        if "# (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!" in line:
                            in_business_logic = True
                        if "# (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!" in line:
                            in_dependency_injection = True

                    new_lines = []
                    in_business_logic = False
                    in_dependency_injection = False
                    in_import_lines = False
                    for line in new_action_template.splitlines():
                        if "# (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!" in line:
                            in_business_logic = True
                            new_lines.append(line + "\n")
                            for business_line in business_logic:
                                new_lines.append(business_line)
                        elif "# (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!" in line:
                            in_dependency_injection = True
                            new_lines.append(line + "\n")
                            for dependency_line in dependency_injection:
                                new_lines.append(dependency_line)
                        elif "# (IMPORTS-START) - DO NOT DELETE THIS LINE!" in line:
                            in_import_lines = True
                            new_lines.append(line + "\n")
                            for import_line in import_lines:
                                new_lines.append(import_line)
                        elif "# (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!" in line:
                            in_business_logic = False
                        elif "# (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!" in line:
                            in_dependency_injection = False
                        elif "# (IMPORTS-END) - DO NOT DELETE THIS LINE!" in line:
                            in_import_lines = False
                        if (not in_business_logic) and (not in_dependency_injection) and (not in_import_lines):
                            new_lines.append(line + "\n")
                with open(f"actions/{snake_replace}.py", "w") as f:
                    f.write(new_action_template)
        action_names = []
        for action_data in hasura_metadata.get("actions", []):
            if action_data.get("name") in included_actions:
                new_hasura_metadata["actions"].append(action_data)
                action_names.append(action_data.get("name"))

        init_str = ""
        for action_name in action_names:
            init_str += f"from actions.{action_name} import {action_name}_router\n"

        init_str += f"\naction_routers = [\n"
        for action_name in action_names:
            init_str += f"    {action_name}_router,\n"
        init_str += "]\n"
        with open("actions/__init__.py", "w") as f:
            f.write(init_str)

        return new_hasura_metadata

    @staticmethod
    def generate_event_triggers(hasura_metadata, service_url, new_hasura_metadata):
        event_triggers = []
        if isinstance(hasura_metadata.get("sources", None), list):
            sources = hasura_metadata.get("sources", [])
            for s in sources:
                source_name = s.get("name", None)
                tables = s.get("tables", None)
                if isinstance(tables, list):
                    for t in tables:
                        table_data = t.get("table", None)
                        table_name = table_data.get("name", None) if isinstance(table_data, dict) else None
                        for trigger in t.get("event_triggers", []):
                            if trigger.get("webhook", None) == service_url:
                                trigger_name = trigger.get("name", None)
                                event_triggers.append({
                                    "location": f"{source_name}.{table_name}.{trigger_name}",
                                    **trigger
                                })
        new_hasura_metadata["event_triggers"] = event_triggers

        event_trigger_template = """# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request, Body, Response
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider
from pysura.faster_api.models import Event

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

ROUTE = "/SNAKE/"
SNAKE_router = APIRouter(
    tags=["SNAKE"]
)


@SNAKE_router.post(ROUTE, dependencies=[Depends(PysuraSecurity(require_jwt=False, require_event_secret=True))])
async def SNAKE(_: Request,
                provider: Provider | None = Depends(
                    PysuraProvider(
                        # (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!
                        provide_identity=False,
                        provide_firebase=True,
                        provide_graphql=True,
                        provide_storage=True
                        # (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!
                    )
                ),
                data: Event = Body(...)):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    logging.log(logging.INFO, f"Event {data.id} is authorized to access {ROUTE}")
    logging.log(logging.INFO, data)
    logging.log(logging.INFO, provider)
    return Response(status_code=200)
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
"""
        event_init = ""
        event_routers = []
        for event_trigger in event_triggers:
            event_init += f"from events.{event_trigger['name']} import {event_trigger['name']}_router\n"
            event_routers.append(f"    {event_trigger['name']}_router")
            snake_replace = event_trigger["name"]
            new_event_template = event_trigger_template.replace("SNAKE", snake_replace)
            rewrite = False
            original_data = None
            if os.path.isfile(f"events/{snake_replace}.py"):
                rewrite = True
                with open(f"events/{snake_replace}.py", "r") as f:
                    original_data = f.readlines()
            if rewrite:
                dependency_injection = []
                business_logic = []
                import_lines = []
                in_dependency_injection = False
                in_business_logic = False
                in_import_lines = False
                for line in original_data:
                    if "# (IMPORTS-END) - DO NOT DELETE THIS LINE!" in line:
                        in_import_lines = False
                    if "# (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!" in line:
                        in_business_logic = False
                    if "# (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!" in line:
                        in_dependency_injection = False
                    if in_business_logic:
                        business_logic.append(line)
                    if in_dependency_injection:
                        dependency_injection.append(line)
                    if in_import_lines:
                        import_lines.append(line)
                    if "# (IMPORTS-START) - DO NOT DELETE THIS LINE!" in line:
                        in_import_lines = True
                    if "# (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!" in line:
                        in_business_logic = True
                    if "# (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!" in line:
                        in_dependency_injection = True

                new_lines = []
                in_business_logic = False
                in_dependency_injection = False
                in_import_lines = False
                for line in new_event_template.splitlines():
                    if "# (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!" in line:
                        in_business_logic = True
                        new_lines.append(line + "\n")
                        for business_line in business_logic:
                            new_lines.append(business_line)
                    elif "# (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!" in line:
                        in_dependency_injection = True
                        new_lines.append(line + "\n")
                        for dependency_line in dependency_injection:
                            new_lines.append(dependency_line)
                    elif "# (IMPORTS-START) - DO NOT DELETE THIS LINE!" in line:
                        in_import_lines = True
                        new_lines.append(line + "\n")
                        for import_line in import_lines:
                            new_lines.append(import_line)
                    elif "# (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!" in line:
                        in_business_logic = False
                    elif "# (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!" in line:
                        in_dependency_injection = False
                    elif "# (IMPORTS-END) - DO NOT DELETE THIS LINE!" in line:
                        in_import_lines = False
                    if (not in_business_logic) and (not in_dependency_injection) and (not in_import_lines):
                        new_lines.append(line + "\n")
                new_event_template = "".join(new_lines)
            with open(f"events/{snake_replace}.py", "w") as f:
                f.write(new_event_template)

        event_init += f"\nevent_routers = [\n"
        for event_router in event_routers:
            event_init += f"    {event_router},\n"
        event_init += f"]\n"
        with open(f"events/__init__.py", "w") as f:
            f.write(event_init)

        return new_hasura_metadata

    @staticmethod
    def generate_crons(hasura_metadata, service_url, new_hasura_metadata):
        cron_template = """# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request, Body, Response
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

ROUTE = "/SNAKE/"
SNAKE_router = APIRouter(
    tags=["SNAKE"]
)


@SNAKE_router.post(ROUTE, dependencies=[Depends(PysuraSecurity(require_jwt=False, require_event_secret=True))])
async def SNAKE(_: Request,
                provider: Provider | None = Depends(
                    PysuraProvider(
                        # (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!
                        provide_identity=False,
                        provide_firebase=True,
                        provide_graphql=True,
                        provide_storage=True
                        # (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!
                    )
                ),
                data=Body(...)):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    logging.log(logging.INFO, data)
    logging.log(logging.INFO, provider)
    return Response(status_code=200)
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
"""

        if isinstance(hasura_metadata.get("cron_triggers", None), list):
            cron_triggers = hasura_metadata.get("cron_triggers", [])
            cron_triggers_init = ""
            cron_names = []
            for cron_trigger in cron_triggers:
                if cron_trigger.get("webhook", None) == service_url:
                    new_hasura_metadata["cron_triggers"].append(cron_trigger)
                    snake_replace = cron_trigger["name"]
                    cron_names.append(snake_replace)
                    cron_triggers_init += f"from crons.{snake_replace} import {snake_replace}_router\n"
                    new_cron_template = cron_template.replace("SNAKE", snake_replace)
                    rewrite = False
                    original_data = None
                    if os.path.isfile(f"crons/{snake_replace}.py"):
                        rewrite = True
                        with open(f"crons/{snake_replace}.py", "r") as f:
                            original_data = f.readlines()
                    if rewrite:
                        dependency_injection = []
                        business_logic = []
                        import_lines = []
                        in_dependency_injection = False
                        in_business_logic = False
                        in_import_lines = False
                        for line in original_data:
                            if "# (IMPORTS-END) - DO NOT DELETE THIS LINE!" in line:
                                in_import_lines = False
                            if "# (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!" in line:
                                in_business_logic = False
                            if "# (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!" in line:
                                in_dependency_injection = False
                            if in_business_logic:
                                business_logic.append(line)
                            if in_dependency_injection:
                                dependency_injection.append(line)
                            if in_import_lines:
                                import_lines.append(line)
                            if "# (IMPORTS-START) - DO NOT DELETE THIS LINE!" in line:
                                in_import_lines = True
                            if "# (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!" in line:
                                in_business_logic = True
                            if "# (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!" in line:
                                in_dependency_injection = True

                        new_lines = []
                        in_business_logic = False
                        in_dependency_injection = False
                        in_import_lines = False
                        for line in new_cron_template.splitlines():
                            if "# (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!" in line:
                                in_business_logic = True
                                new_lines.append(line + "\n")
                                for business_line in business_logic:
                                    new_lines.append(business_line)
                            elif "# (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!" in line:
                                in_dependency_injection = True
                                new_lines.append(line + "\n")
                                for dependency_line in dependency_injection:
                                    new_lines.append(dependency_line)
                            elif "# (IMPORTS-START) - DO NOT DELETE THIS LINE!" in line:
                                in_import_lines = True
                                new_lines.append(line + "\n")
                                for import_line in import_lines:
                                    new_lines.append(import_line)
                            elif "# (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!" in line:
                                in_business_logic = False
                            elif "# (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!" in line:
                                in_dependency_injection = False
                            elif "# (IMPORTS-END) - DO NOT DELETE THIS LINE!" in line:
                                in_import_lines = False
                            if (not in_business_logic) and (not in_dependency_injection) and (not in_import_lines):
                                new_lines.append(line + "\n")
                        new_cron_template = "".join(new_lines)
                    with open(f"crons/{snake_replace}.py", "w") as f:
                        f.write(new_cron_template)
            cron_triggers_init += f"\ncron_routers = [\n"
            for cron_name in cron_names:
                cron_triggers_init += f"    {cron_name}_router,\n"
            cron_triggers_init += f"]\n"
            with open(f"crons/__init__.py", "w") as f:
                f.write(cron_triggers_init)
        return new_hasura_metadata

    @staticmethod
    def router_generator(hasura_metadata, service_url="{{HASURA_MICROSERVICE_URL}}"):
        """Generates a router for the current microservice"""

        def collect_types(object_data, custom_object_type="object"):
            root_type = {}
            custom_name = object_data.get("name")
            root_type[custom_name] = {
                "name": custom_name,
                "fields": {},
                "required_objects": set(),
                "custom_type": custom_object_type
            }
            default_types = ["String", "Int", "Float", "Boolean", "ID"]
            for field in object_data.get("fields", []):
                is_list = False
                is_object = False
                is_optional = True
                field_collect_type = field.get("type", {})
                if field_collect_type[0] == "[" and field_collect_type[-1] == "]":
                    field_collect_type = field_collect_type[1:-1]
                    is_list = True
                if field_collect_type[-1] == "!":
                    field_collect_type = field_collect_type[:-1]
                    is_optional = False
                if field_collect_type not in default_types:
                    is_object = True

                root_type[custom_name]["fields"][field.get("name")] = {
                    "type": field_collect_type,
                    "is_list": is_list,
                    "is_object": is_object,
                    "is_optional": is_optional,
                }
                if is_object:
                    root_type[custom_name]["required_objects"].add(field_collect_type)
            return root_type

        included_types = []
        excluded_types = []
        actions = {}
        included_actions = set()
        for action in hasura_metadata.get("actions", []):
            action_name = action.get("name")
            action_handler = action.get("definition", {}).get("handler", None)
            output_type = action.get("definition", {}).get("output_type", None)
            input_type = action.get("definition", {}).get("arguments", [{'type': None}])[0].get("type", None)
            if action_handler == service_url:
                included_types.append(output_type)
                included_types.append(input_type)
                included_actions.add(action_name)
            else:
                excluded_types.append(output_type)
                excluded_types.append(input_type)
            actions[action_name] = {
                "name": action_name,
                "handler": action_handler,
                "output_type": output_type,
                "input_type": input_type
            }

        unordered_custom_objects = []
        for custom_object in hasura_metadata.get("custom_types", {}).get("objects", []):
            types = collect_types(custom_object)
            unordered_custom_objects.append(types)

        unordered_custom_input_objects = []
        for custom_input_object in hasura_metadata.get("custom_types", {}).get("input_objects", []):
            types = collect_types(custom_input_object)
            unordered_custom_input_objects.append(types)

        excluded = []
        included = []
        for co in unordered_custom_objects:
            co_key = list(co.keys())[0]
            required_objects = co[co_key]["required_objects"]
            if co_key in excluded_types:
                excluded.extend([co_key, *required_objects])
            elif co_key in included_types:
                included.extend([co_key, *required_objects])

        for co in unordered_custom_input_objects:
            co_key = list(co.keys())[0]
            required_objects = co[co_key]["required_objects"]
            if co_key in excluded_types:
                excluded.extend([co_key, *required_objects])
            elif co_key in included_types:
                included.extend([co_key, *required_objects])

        included_set = set(included)
        new_unordered_custom_objects = []
        for co in unordered_custom_objects:
            co_key = list(co.keys())[0]
            if co_key in included_set:
                new_unordered_custom_objects.append(co)
        unordered_custom_objects = new_unordered_custom_objects

        new_unordered_custom_input_objects = []
        for co in unordered_custom_input_objects:
            co_key = list(co.keys())[0]
            if co_key in included_set:
                new_unordered_custom_input_objects.append(co)
        unordered_custom_input_objects = new_unordered_custom_input_objects

        ordered_objects_handled = set()
        ordered_custom_objects = []
        loop_count = 0
        # At most, we will have to loop through the list of custom objects as many times as there are custom objects
        # This would be worst case if every object was nested in another object
        while len(unordered_custom_objects) != len(ordered_custom_objects) and loop_count < len(
                unordered_custom_objects) + 1:
            loop_count += 1
            for custom_object in unordered_custom_objects:
                assert len(custom_object) == 1
                custom_object_name = list(custom_object.keys())[0]
                if custom_object_name in ordered_objects_handled:
                    continue
                else:
                    required_objects = custom_object[custom_object_name]["required_objects"]
                    if required_objects.issubset(ordered_objects_handled):
                        ordered_custom_objects.append(custom_object)
                        ordered_objects_handled.add(custom_object_name)
                    else:
                        continue

        ordered_input_objects_handled = set()
        ordered_custom_input_objects = []
        loop_count = 0
        # At most, we will have to loop through the list of custom objects as many times as there are custom objects
        # This would be worst case if every object was nested in another object
        while len(unordered_custom_input_objects) != len(ordered_custom_input_objects) and loop_count < len(
                unordered_custom_input_objects) + 1:
            loop_count += 1
            for custom_input_object in unordered_custom_input_objects:
                assert len(custom_input_object) == 1
                custom_input_object_name = list(custom_input_object.keys())[0]
                if custom_input_object_name in ordered_input_objects_handled:
                    continue
                else:
                    required_objects = custom_input_object[custom_input_object_name]["required_objects"]
                    if required_objects.issubset(ordered_input_objects_handled):
                        ordered_custom_input_objects.append(custom_input_object)
                        ordered_input_objects_handled.add(custom_input_object_name)
                    else:
                        continue

        GoogleRoot.generate_types(ordered_custom_objects=ordered_custom_objects,
                                  ordered_custom_input_objects=ordered_custom_input_objects)
        new_hasura_metadata = {
            "actions": [],
            "custom_types": {
                "objects": [],
                "input_objects": []
            },
            "event_triggers": [],
            "cron_triggers": []
        }
        new_hasura_metadata = GoogleRoot.generate_actions(hasura_metadata=hasura_metadata,
                                                          service_url=service_url,
                                                          included_actions=included_actions,
                                                          new_hasura_metadata=new_hasura_metadata)

        new_hasura_metadata = GoogleRoot.generate_event_triggers(hasura_metadata=hasura_metadata,
                                                                 service_url=service_url,
                                                                 new_hasura_metadata=new_hasura_metadata
                                                                 )

        new_hasura_metadata = GoogleRoot.generate_crons(hasura_metadata=hasura_metadata,
                                                        service_url=service_url,
                                                        new_hasura_metadata=new_hasura_metadata)

        for custom_type in hasura_metadata.get("custom_types", {}).get("objects", []):
            if custom_type.get("name") in included_set:
                new_hasura_metadata["custom_types"]["objects"].append(custom_type)

        for custom_type in hasura_metadata.get("custom_types", {}).get("input_objects", []):
            if custom_type.get("name") in included_set:
                new_hasura_metadata["custom_types"]["input_objects"].append(custom_type)

        return new_hasura_metadata

    def do_generate_microservice_template(self,
                                          hasura_metadata_path="hasura_metadata.json",
                                          microservice_name="template",
                                          microservice_url="{{HASURA_MICROSERVICE_URL}}"
                                          ):
        """
        Generate a microservice template
        :param hasura_metadata_path: /path/to/hasura_metadata.json
        :param microservice_name: name_of_service
        :param microservice_url: {{HASURA_MICROSERVICE_URL}} -> Webhook name in schema

        Microservice URL is used to parse the hasura metadata to determine which actions, events, and crons to use.

        Parsed from action
        {
          "name": "action_query_ping",
          "definition": {
            "handler": "{{HASURA_MICROSERVICE_URL}}"
          }
        }

        Parsed from cron
        {
          "name": "cron_update_app_message",
          "webhook": "{{HASURA_MICROSERVICE_URL}}"
        }

        Parsed from event
        {
          "name": "event_update_user_role",
          "webhook": "{{HASURA_MICROSERVICE_URL}}"
        }


        """
        if microservice_name == "" or len(microservice_name.strip()) == 0:
            self.log("Microservice name cannot be empty", level=logging.ERROR)
            return
        env = self.get_env()
        if env.auth_service_account is None or env.auth_service_account.key_file is None:
            self.log("No auth service account specified", level=logging.ERROR)
            return
        if not os.path.isdir("microservices"):
            os.mkdir("microservices")
        os.chdir("microservices")
        if not os.path.isdir(microservice_name):
            os.mkdir(microservice_name)
        os.chdir(microservice_name)
        os.mkdir("actions")
        os.mkdir("crons")
        os.mkdir("events")
        path = self.get_site_packages_path(submodule="pysura_microservice")
        default_actions = []
        default_events = []
        default_crons = []
        for root, dirs, files in os.walk(path):
            for f in files:
                if "__pycache__" in root or ".dart_tool" in root or ".idea" in root or ".git" in root:
                    continue
                if f in ["requirements.txt", "app.py", "Dockerfile", "app_secrets.py", "README.md"]:
                    shutil.copy(os.path.join(root, f), ".")
                elif f == "pysura_metadata.json" and microservice_name == "default":
                    shutil.copy(os.path.join(root, f), ".")
                else:
                    if "actions" in root:
                        if f != "action_template.py":
                            dir_path = os.path.join(os.getcwd(), "actions")
                            if not os.path.isdir(dir_path):
                                os.mkdir(dir_path)
                            if f != "__init__.py" and microservice_name == "default":
                                default_actions.append(f.replace(".py", ""))
                            if microservice_name != "default":
                                continue
                            shutil.copy(os.path.join(root, f), dir_path)
                    elif "crons" in root:
                        if f != "cron_template.py":
                            dir_path = os.path.join(os.getcwd(), "crons")
                            if not os.path.isdir(dir_path):
                                os.mkdir(dir_path)
                            if f != "__init__.py" and microservice_name == "default":
                                default_crons.append(f.replace(".py", ""))
                            if microservice_name != "default":
                                continue
                            shutil.copy(os.path.join(root, f), dir_path)
                    elif "events" in root:
                        if f != "event_template.py":
                            dir_path = os.path.join(os.getcwd(), "events")
                            if not os.path.isdir(dir_path):
                                os.mkdir(dir_path)
                            if f != "__init__.py" and microservice_name == "default":
                                default_events.append(f.replace(".py", ""))
                            if microservice_name != "default":
                                continue
                            shutil.copy(os.path.join(root, f), dir_path)
        with open(hasura_metadata_path, "r") as f:
            metadata = json.load(f)
        with open("app_secrets.py", "r") as f:
            app_secrets_py = f.read()
        app_secrets_py = app_secrets_py.replace("YOUR_PROJECT_ID", env.project.name.split("/")[-1])
        with open("app_secrets.py", "w") as f:
            f.write(app_secrets_py)
        self.router_generator(metadata, microservice_url)
        os.chdir("../..")

    def do_deploy_microservice(self,
                               microservice_name="default",
                               url_wrapper="{{HASURA_MICROSERVICE_URL}}",
                               timeout_default="600s",
                               memory_default="2Gi",
                               max_instances_default="10",
                               default_init: bool | str = ""):
        """
        Deploys, or redeploys a microservice. Will rebuild routers, but as long as you leave the comments alone, it
        won't overwrite your code!

        :param microservice_name: default
        :param url_wrapper: {{HASURA_MICROSERVICE_URL}}
        :param timeout_default: 600s
        :param memory_default: 2Gi
        :param max_instances_default: 10
        :param default_init: Internal! Do not use!
        Example: deploy_microservice default 600s 2Gi 10
        """
        if isinstance(default_init, str) and default_init.strip() == "":
            default_init = False
        if microservice_name == "" or len(microservice_name.strip()) == 0:
            self.log("Microservice name cannot be empty", level=logging.ERROR)
            return
        env = self.get_env()
        if env.auth_service_account is None or env.auth_service_account.key_file is None:
            self.log("No auth service account specified", level=logging.ERROR)
            return
        if not os.path.isdir("microservices"):
            os.mkdir("microservices")
        os.chdir("microservices")
        if not os.path.isdir(microservice_name):
            os.mkdir(microservice_name)
        os.chdir(microservice_name)
        if not os.path.isdir("actions"):
            os.mkdir("actions")
        if not os.path.isdir("crons"):
            os.mkdir("crons")
        if not os.path.isdir("events"):
            os.mkdir("events")
        path = self.get_site_packages_path(submodule="pysura_microservice")
        default_actions = []
        default_events = []
        default_crons = []
        for root, dirs, files in os.walk(path):
            for f in files:
                self.log(f"Copying {f} to {microservice_name} microservice", level=logging.INFO)
                if "__pycache__" in root or ".dart_tool" in root or ".idea" in root or ".git" in root:
                    continue
                if f in ["requirements.txt", "app.py", "Dockerfile", "app_secrets.py", "README.md"]:
                    shutil.copy(os.path.join(root, f), ".")
                elif f == "pysura_metadata.json" and microservice_name == "default":
                    shutil.copy(os.path.join(root, f), ".")
                else:
                    if "actions" in root:
                        self.log(f"Copying {f} to actions directory", level=logging.INFO)
                        if f != "action_template.py":
                            dir_path = os.path.join(os.getcwd(), "actions")
                            if not os.path.isdir(dir_path):
                                os.mkdir(dir_path)
                            if f != "__init__.py" and microservice_name == "default":
                                default_actions.append(f.replace(".py", ""))
                            if f in ["action_upload_file.py"]:
                                shutil.copy(os.path.join(root, f), dir_path)
                            if microservice_name != "default":
                                continue
                            shutil.copy(os.path.join(root, f), dir_path)
                        self.collect("Continue?")
                    elif "crons" in root:
                        if f != "cron_template.py":
                            dir_path = os.path.join(os.getcwd(), "crons")
                            if not os.path.isdir(dir_path):
                                os.mkdir(dir_path)
                            if f != "__init__.py" and microservice_name == "default":
                                default_crons.append(f.replace(".py", ""))
                            if microservice_name != "default":
                                continue
                            shutil.copy(os.path.join(root, f), dir_path)
                    elif "events" in root:
                        if f != "event_template.py":
                            dir_path = os.path.join(os.getcwd(), "events")
                            if not os.path.isdir(dir_path):
                                os.mkdir(dir_path)
                            if f != "__init__.py" and microservice_name == "default":
                                default_events.append(f.replace(".py", ""))
                            if microservice_name != "default":
                                continue
                            shutil.copy(os.path.join(root, f), dir_path)
        if microservice_name == "default" and default_init:
            with open("pysura_metadata.json", "r") as f:
                metadata = json.load(f)
        else:
            os.chdir("../..")
            with open("hasura_metadata.json", "r") as f:
                metadata = json.load(f)
            os.chdir("microservices")
            os.chdir(microservice_name)
        with open("app_secrets.py", "r") as f:
            app_secrets_py = f.read()
        app_secrets_py = app_secrets_py.replace("YOUR_PROJECT_ID", env.project.name.split("/")[-1])
        with open("app_secrets.py", "w") as f:
            f.write(app_secrets_py)
        new_hasura_metadata = self.router_generator(metadata, url_wrapper)
        input_objects_set = set(
            [i.get("name", None) for i in new_hasura_metadata.get("custom_types", {}).get("input_objects", [])]
        )
        objects_set = set(
            [i.get("name", None) for i in new_hasura_metadata.get("custom_types", {}).get("objects", [])]
        )
        if len(timeout_default.strip()) == 0:
            timeout = self.collect("Microservice Timeout (Ex. 600s): ",
                                   ["60s", "300s", "600s", "900s", "1200s", "3600s"])
        else:
            timeout = timeout_default
        if len(memory_default.strip()) == 0:
            memory = self.collect("Microservice Memory (Ex. 2Gi): ",
                                  ["256Mi", "512Mi", "1Gi", "2Gi", "4Gi", "8Gi", "16Gi", "32Gi"])
        else:
            memory = memory_default
        if len(max_instances_default.strip()) == 0:
            max_instances = self.collect("Max instances (Ex. 10): ")
        else:
            max_instances = max_instances_default
        cmd_str = f"gcloud run deploy {microservice_name} --source . " \
                  f"--min-instances=1 " \
                  f"--max-instances={max_instances} " \
                  f"--cpu=1 " \
                  f"--memory={memory} " \
                  f"--timeout={timeout} " \
                  f"--allow-unauthenticated " \
                  f"--no-cpu-throttling " \
                  f"--project={env.project.name.split('/')[-1]}"
        self.log(cmd_str, level=logging.DEBUG)
        os.system(cmd_str)
        services = json.loads(os.popen(f"gcloud run services list "
                                       f"--project={env.project.name.split('/')[-1]} "
                                       f"--format=json").read())
        new_services = []
        if env.hasura.microservice_urls is None:
            env.hasura.microservice_urls = []
        for service in services:
            service_data = GoogleService(**service)
            if service_data.metadata.name == microservice_name:
                if microservice_name == "default":
                    env.default_microservice = service_data
                    env.default_microservice_url = service_data.status.url
                    env.hasura.HASURA_MICROSERVICE_URL = f"{service_data.status.url}"
                else:
                    microservice_url = MicroserviceUrl(
                        url=service_data.status.url,
                        name=microservice_name,
                        url_wrapper=url_wrapper
                    )
                    append_flag = True
                    for url in env.hasura.microservice_urls:
                        if url.name == microservice_name:
                            append_flag = False
                            break
                    if append_flag:
                        env.hasura.microservice_urls.append(microservice_url)
            new_services.append(service_data)
        env.services = new_services
        os.chdir("../..")
        self.set_env(env)
        self.do_gcloud_deploy_hasura()
        with open("hasura_metadata.json", "r") as f:
            metadata = json.load(f)
        new_metadata = {}
        new_actions = []
        new_objects = []
        new_input_objects = []
        if metadata.get("actions", None) is None:
            metadata["actions"] = []
        if metadata.get("custom_types", None) is None:
            metadata["custom_types"] = {
                "objects": [],
                "input_objects": []
            }
        if metadata.get("sources", None) is None:
            metadata["sources"] = []
        if metadata.get("cron_triggers", None) is None:
            metadata["cron_triggers"] = []
        for key, value in metadata.items():
            if key == "actions":
                for action in value:
                    if action.get("definition", None) is None:
                        action["definition"] = {}
                    if action["definition"].get("request_transform", None) is None:
                        action["definition"]["request_transform"] = {}
                    action["definition"]["request_transform"]["body"] = {
                        "action": "transform",
                        "template": "{{" + f"$body?.input?.{action['name']}_input" + "}}"
                    }
                    if action.get("definition", None).get("handler", None) == url_wrapper:
                        continue
                    new_actions.append(action)
            elif key == "custom_types":
                objects = value.get("objects", [])
                for obj in objects:
                    if obj["name"] in objects_set:
                        continue
                    new_objects.append(obj)
                input_objects = value.get("input_objects", [])
                for obj in input_objects:
                    if obj["name"] in input_objects_set:
                        continue
                    new_input_objects.append(obj)
            elif key == "sources":
                for event_trigger in new_hasura_metadata["event_triggers"]:
                    source_name, table_name, trigger_name = event_trigger.pop('location').split(".")
                    for source in value:
                        self.log("source: " + str(source), level=logging.DEBUG)
                        if source["name"] == source_name:
                            for table in source.get("tables", []):
                                table_data = table.get("table", None)
                                tb_name = table_data.get("name", None) if isinstance(table_data, dict) else None
                                if tb_name == table_name:
                                    new_event_triggers = []
                                    if isinstance(table.get("event_triggers", None), list):
                                        trigger_found = False
                                        for trigger in table.get("event_triggers", []):
                                            if trigger.get("name", None) == trigger_name:
                                                new_event_triggers.append(event_trigger)
                                                trigger_found = True
                                            else:
                                                new_event_triggers.append(trigger)
                                        if not trigger_found:
                                            new_event_triggers.append(event_trigger)
                                    else:
                                        new_event_triggers.append(event_trigger)
                                    if len(new_event_triggers) != 0:
                                        table["event_triggers"] = new_event_triggers
                new_metadata[key] = value
            elif key == "cron_triggers":
                new_cron_triggers = []
                crons_added = []
                for new_cron_trigger in new_hasura_metadata["cron_triggers"]:
                    trigger_found = False
                    for cron_trigger in value:
                        if cron_trigger.get("name", None) == new_cron_trigger["name"]:
                            trigger_found = True
                            break
                        if cron_trigger.get("name", None) in crons_added:
                            continue
                        new_cron_triggers.append(cron_trigger)
                        crons_added.append(cron_trigger.get("name", None))
                    if not trigger_found:
                        new_cron_triggers.append(new_cron_trigger)
                new_metadata[key] = new_cron_triggers
            else:
                new_metadata[key] = value

        for action in new_hasura_metadata.get("actions", []):
            if action.get("definition", None) is None:
                action["definition"] = {}
            if action["definition"].get("request_transform", None) is None:
                action["definition"]["request_transform"] = {}
            action["definition"]["request_transform"]["body"] = {
                "action": "transform",
                "template": "{{" + f"$body?.input?.{action['name']}_input" + "}}"
            }
            action["definition"]["request_transform"]["method"] = "POST"
            action["definition"]["request_transform"]["url"] = "{{$base_url}}" + f"/{action['name']}/"
            action["definition"]["request_transform"]["query_params"] = action["definition"]["request_transform"].get(
                "query_params", {})
            action["definition"]["request_transform"]["template_engine"] = "Kriti"
            action["definition"]["request_transform"]["version"] = 2
            new_actions.append(action)

        for obj in new_hasura_metadata.get("custom_types", {}).get("objects", []):
            new_objects.append(obj)

        for obj in new_hasura_metadata.get("custom_types", {}).get("input_objects", []):
            new_input_objects.append(obj)

        new_metadata["actions"] = new_actions
        new_metadata["custom_types"] = {
            "objects": new_objects,
            "input_objects": new_input_objects
        }
        with open("hasura_metadata.json", "w") as f:
            json.dump(new_metadata, f, indent=4)

    def do_deploy_frontend(self, _):
        env = self.get_env()
        if env.flutter_app_name is None:
            self.log("No flutter app name found. Skipping flutter app deployment.", level=logging.WARNING)
            return
        project_name = env.flutter_app_name
        if not os.path.exists("microservices"):
            os.mkdir("microservices")
        if not os.path.exists(f"microservices/{project_name}_web"):
            os.mkdir(f"microservices/{project_name}_web")
        path = self.get_site_packages_path(submodule="pysura_ssr")
        for root, dirs, files in os.walk(path):
            for f in files:
                if "__pycache__" in root or ".dart_tool" in root or ".idea" in root or ".git" in root:
                    continue
                if f in [".firebaserc", "firebase.json"]:
                    shutil.copy(os.path.join(root, f), f"microservices/{project_name}_web")
        if not os.path.isdir(f"microservices/{project_name}_web/build"):
            os.mkdir(f"microservices/{project_name}_web/build")
        else:
            shutil.rmtree(f"microservices/{project_name}_web/build")
            os.mkdir(f"microservices/{project_name}_web/build")

        if os.path.exists(f"{project_name}/web"):
            os.chdir(f"{project_name}")
            cmd_str = "flutter build web --release"
            self.log(f"Running command: {cmd_str}", level=logging.INFO)
            os.system(cmd_str)
            os.chdir("..")

        src_dir = f"{project_name}/build/web"
        dst_dir = f"microservices/{project_name}_web/build/web"
        shutil.copytree(src_dir, dst_dir)
        os.chdir(f"microservices/{project_name}_web")
        with open(".firebaserc") as f:
            data = json.load(f)
        data["projects"]["default"] = env.project.name.split('/')[-1]
        with open(".firebaserc", "w") as f:
            json.dump(data, f, indent=4)
        deploy_command = f"firebase deploy --only hosting"
        self.log(deploy_command, level=logging.DEBUG)
        os.system(deploy_command)
        os.chdir("../..")
        self.set_env(env)

    def do_setup_pysura(self, recurse=0):
        """
        Setups up a Pysura project
        """
        if recurse == "":
            recurse = 0
        else:
            if recurse > 10:
                self.log("Too many attempts. Aborting project setup.", level=logging.WARNING)
                return
        if not self.check_gcloud():
            return
        if not self.check_npm():
            return
        if not self.check_flutter():
            return
        if not self.check_firebase():
            return
        if not self.check_docker():
            return
        env = self.get_env()
        if env.gcloud_logged_in is False:
            self.do_gcloud_login()
            env = self.get_env()
        if not env.gcloud_logged_in:
            return self.do_setup_pysura(recurse=recurse + 1)
        cmd_str = "gcloud auth configure-docker gcr.io"
        self.log(f"Running command: {cmd_str}", level=logging.INFO)
        os.system(cmd_str)
        if env.organization is None:
            self.do_gcloud_choose_organization(None)
            env = self.get_env()
        if env.project is None:
            hasura_project_name = self.collect("Hasura project name: ")
            if not self.confirm_loop(hasura_project_name):
                self.log("Aborting project setup.", level=logging.WARNING)
                return
        else:
            hasura_project_name = env.project.name.split("/")[-1]
        hasura_project_name = hasura_project_name.replace("_", "-").replace(" ", "-")
        if env.project is None:
            self.gcloud_create_project(project_id=hasura_project_name)
            env = self.get_env()
        else:
            cmd_str = f"gcloud config set project {env.project.name.split('/')[-1]}"
            self.log(cmd_str, level=logging.DEBUG)
            os.system(cmd_str)
        if env.project is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.billing_account is None:
            self.do_gcloud_link_billing_account()
            env = self.get_env()
        if env.billing_account is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.api_services is None:
            self.gcloud_enable_api_services()
            env = self.get_env()
        if env.api_services is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.network is None:
            self.gcloud_create_network(network_id=hasura_project_name)
            env = self.get_env()
        if env.network is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.address is None:
            self.gcloud_create_address(address_id=hasura_project_name)
            env = self.get_env()
        if env.address is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.peering is None:
            self.gcloud_create_vpc_peering(peering_id=hasura_project_name)
            env = self.get_env()
        if env.peering is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.firewalls is None:
            self.gcloud_create_firewall(firewall_id=hasura_project_name)
            env = self.get_env()
        if env.firewalls is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.database_credential is None:
            self.do_gcloud_create_database(database_id=hasura_project_name)
            env = self.get_env()
        if env.database_credential is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.connector is None:
            self.gcloud_create_serverless_connector(connector_id=hasura_project_name)
            env = self.get_env()
        if env.connector is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.hasura_service_account is None:
            self.update_default_compute_engine_service_account()
            env = self.get_env()
        if env.hasura_service_account is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.hasura is None:
            self.do_gcloud_deploy_hasura()
            env = self.get_env()
        if env.hasura is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        self.do_import_hasura_metadata(None)
        if env.auth_service_account is None:
            self.gcloud_create_auth_service_account()
        env = self.get_env()
        if env.auth_service_account is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.local_database_enabled is False:
            self.enable_database_local(database_id=env.database.name.split("/")[-1])
            env = self.get_env()
        if env.local_database_enabled is False:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.default_user_table_created is False:
            self.create_default_user_table()
            env = self.get_env()
        if env.default_user_table_created is False:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.firebase_attached is False:
            self.attach_firebase()
            env = self.get_env()
        if env.firebase_attached is False:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.flutter_attached is False:
            self.attach_flutter()
            env = self.get_env()
        if env.flutter_attached is False:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.firebase_auth_activated is False:
            self.activate_firebase_auth()
            env = self.get_env()
        if env.firebase_auth_activated is False:
            return self.do_setup_pysura(recurse=recurse + 1)
        if env.default_microservice is None:
            self.do_deploy_microservice(microservice_name="default", default_init=True)
            env = self.get_env()
        if env.default_microservice is None:
            return self.do_setup_pysura(recurse=recurse + 1)
        self.do_export_hasura_metadata(None)
        self.do_deploy_frontend(None)
        env = self.get_env()
        phone_wizard = self.collect(
            "Would you like to add test phone numbers to your firebase project using the setup wizard? (y/n): "
        )
        if phone_wizard.strip().lower() == "y":
            add_admin = True
            add_user = True
        else:
            add_admin = False
            add_user = False
        test_phone_numbers = env.test_phone_numbers
        if isinstance(test_phone_numbers, list):
            for test_phone_number in test_phone_numbers:
                if test_phone_number.role == "admin":
                    add_admin = False
                elif test_phone_number.role == "user":
                    add_user = False
        else:
            test_phone_numbers = []

        if add_admin:
            self.log("Please add a test phone number to be granted ADMIN access in the firebase console.",
                     level=logging.INFO)
            self.log(f"https://console.firebase.google.com/project/{env.project.name.split('/')[-1]}/authentication"
                     f"/providers",
                     level=logging.INFO
                     )
            admin_phone = self.collect("What phone number did you add? (Ex. +15555215551): ")
            while not self.confirm_loop(admin_phone):
                self.log("Please add a test phone number to be granted ADMIN access in the firebase console.",
                         level=logging.INFO)
                self.log(
                    f"https://console.firebase.google.com/project/{env.project.name.split('/')[-1]}/authentication"
                    f"/providers",
                    level=logging.INFO
                )
                admin_phone = self.collect("What phone number did you add? (Ex. +15555215551): ")
            admin_code = self.collect(f"What is the verification code for {admin_phone} number?: ")
            while not self.confirm_loop(admin_code):
                admin_code = self.collect(f"What is the verification code for {admin_phone} number?: ")
            self.log(f"Please login to your app with the phone number you just added!\n"
                     f"https://{env.project.name.split('/')[-1]}.web.app/", level=logging.INFO)
            ready = self.collect("Are you ready to continue? (y/n): ")
            while ready != "y":
                ready = self.collect("Are you ready to continue? (y/n): ")
            user_data = self.execute_graphql(Gql.GET_USER_ID_BY_PHONE_GQL, {"phone_number": admin_phone})
            if user_data.get("data", None) is None:
                self.log("Could not find user, please try again.", level=logging.ERROR)
                return
            if len(user_data["data"]["user"]) == 0:
                self.log("Could not find user, please try again.", level=logging.ERROR)
                return
            user_id = user_data["data"]["user"][0]["user_id"]
            self.execute_graphql(Gql.UPDATE_USER_ROLE_GQL, {"user_id": user_id, "role": "admin"})
            admin_number = TestPhoneNumber(
                role="admin",
                phone_number=admin_phone,
                code=admin_code,
                uid=user_id
            )
            test_phone_numbers.append(admin_number)

        if add_user:
            self.log("Please add a test phone number to be granted USER access in the firebase console.",
                     level=logging.INFO)
            self.log(f"https://console.firebase.google.com/project/{env.project.name.split('/')[-1]}/authentication"
                     f"/providers",
                     level=logging.INFO
                     )
            user_phone = self.collect("What phone number did you add?: ")
            while not self.confirm_loop(user_phone):
                self.log("Please add a test phone number to be granted USER access in the firebase console.",
                         level=logging.INFO)
                self.log(
                    f"https://console.firebase.google.com/project/{env.project.name.split('/')[-1]}/authentication"
                    f"/providers",
                    level=logging.INFO
                )
                user_phone = self.collect("What phone number did you add? (Ex. +15555215551): ")
            user_code = self.collect(f"What is the verification code for {user_phone} number?: ")
            while not self.confirm_loop(user_code):
                user_code = self.collect(f"What is the verification code for {user_phone} number?: ")
            self.log(f"Please login to your app with the phone number you just added!\n"
                     f"https://{env.project.name.split('/')[-1]}.web.app/", level=logging.INFO)
            ready = self.collect("Are you ready to continue? (y/n): ")
            while ready != "y":
                ready = self.collect("Are you ready to continue? (y/n): ")
            user_data = self.execute_graphql(Gql.GET_USER_ID_BY_PHONE_GQL, {"phone_number": user_phone})
            if user_data.get("data", None) is None:
                self.log("Could not find user, please try again.", level=logging.ERROR)
                return
            if len(user_data["data"]["user"]) == 0:
                self.log("Could not find user, please try again.", level=logging.ERROR)
                return
            user_id = user_data["data"]["user"][0]["user_id"]
            user_number = TestPhoneNumber(
                role="user",
                phone_number=user_phone,
                code=user_code,
                uid=user_id
            )
            test_phone_numbers.append(user_number)
        if isinstance(test_phone_numbers, list) and len(test_phone_numbers) > 0:
            env.test_phone_numbers = test_phone_numbers
            self.set_env(env)
        self.log(f"Pysura App is ready to run!, open the folder named {env.flutter_app_name} in Android Studio!",
                 level=logging.INFO)
        assert env.hasura is not None
        assert env.hasura_metadata is not None
        if env.hasura.microservice_urls is not None:
            num_services = len(env.hasura.microservice_urls)
        else:
            num_services = 0
        log_str = f"""
Pysura Project Setup Complete!

The default microservice can be found at:
{env.default_microservice_url}/docs

"""
        actions = [action for action in env.hasura_metadata.actions if
                   action.definition.handler == "{{HASURA_MICROSERVICE_URL}}"]
        if len(actions) > 0:
            log_str += f"""The default microservice has {len(actions)} actions:\n"""
            for action in actions:
                log_str += f"""\t{action.name}\n"""

        log_str += f"""\nYou have {num_services} additional microservice(s) deployed."""
        if num_services > 0:
            log_str += "\n\tMicroservice URLs:\n"

        for microservice_url in env.hasura.microservice_urls:
            actions = [action for action in env.hasura_metadata.actions if
                       action.definition.handler == microservice_url.url_wrapper]
            log_str += f"""\t{microservice_url.url}\n"""
            if len(actions) > 0:
                log_str += f"""\t\t{len(actions)} action(s):\n"""
                for action in actions:
                    log_str += f"""\t\t\t{action.name}\n"""

        log_str += f"""

Your Hasura instance can be found at:
{env.hasura_service.status.address.url}/console

Your Hasura Admin Secret is:
{env.hasura.HASURA_GRAPHQL_ADMIN_SECRET}

The event secret for the all attached microservices is:
{env.hasura.HASURA_EVENT_SECRET}

You can find authorization tokens for your microservice by running your flutter application and logging in, navigate to
the settings tab, and click the "Copy GraphQL Token" button and a bearer token will be copied to your clipboard.
The bearer token will have the role of the user that is logged in.

You can find your web application here:
https://{env.project.name.split('/')[-1]}.web.app/


"""

        self.log(log_str, level=logging.INFO)
