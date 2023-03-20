from cmd import Cmd
import os
import logging
import sys
import json

root = logging.getLogger()
root.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
root.addHandler(handler)


class App(Cmd):
    ENV_JSON = "env.json"

    @staticmethod
    def load_env_dict_from_json():
        try:
            with open(App.ENV_JSON) as f:
                return json.load(f)
        except FileNotFoundError:
            return {}

    @staticmethod
    def save_env_dict_to_json(env_dict):
        with open(App.ENV_JSON, "w") as f:
            json.dump(env_dict, f)

    def preloop(self):
        logging.log(logging.INFO, "Starting pysura cli...")
        env_dict = App.load_env_dict_from_json()
        self.hasura_url = env_dict.get("HASURA_GRAPHQL_METADATA_URL", None)
        self.hasura_admin_secret = env_dict.get("HASURA_GRAPHQL_ADMIN_SECRET", None)
        if self.hasura_url is not None:
            os.environ["HASURA_GRAPHQL_METADATA_URL"] = self.hasura_url
            logging.log(logging.INFO, f"Hasura metadata url set to {self.hasura_url}.")
        if self.hasura_admin_secret is not None:
            os.environ["HASURA_GRAPHQL_ADMIN_SECRET"] = self.hasura_admin_secret
            logging.log(logging.INFO,
                        f"Hasura admin secret set to {self.hasura_admin_secret[0:4]}****"
                        f"{self.hasura_admin_secret[-4:]}. Environment Variable: HASURA_GRAPHQL_ADMIN_SECRET")

    def __init__(self):
        self.hasura_url = None
        self.hasura_admin_secret = None
        super().__init__()
        self.intro = "Welcome to the pysura. Type help or ? to list commands."
        self.prompt = "(pysura_cli) >>> "

    @staticmethod
    def do_exit(_):
        """
        Exits the application.
        Usage: exit
        """
        logging.log(logging.INFO, "Exiting...")
        exit(0)

    @staticmethod
    def do_quit(_):
        """
        Exits the application.
        Usage: quit
        """
        logging.log(logging.INFO, "Exiting...")
        exit(0)

    @staticmethod
    def do_show_env(_):
        """
        Shows the environment variables.
        Usage: show_env
        """
        logging.log(logging.INFO, f"HASURA_GRAPHQL_METADATA_URL: {os.environ.get('HASURA_GRAPHQL_METADATA_URL', None)}")
        logging.log(logging.INFO, f"HASURA_GRAPHQL_ADMIN_SECRET: {os.environ.get('HASURA_GRAPHQL_ADMIN_SECRET', None)}")

    def do_set_hasura_metadata_url(self, arg):
        """
        Sets the hasura metadata url.
        Usage: set_hasura_metadata_url <url>
        Example: set_hasura_metadata_url https://localhost:8080/v1/metadata
        """
        if len(arg) == 0:
            logging.log(logging.WARNING, "Please provide a url")
            return
        self.hasura_url = arg
        os.environ["HASURA_GRAPHQL_METADATA_URL"] = arg
        env_dict = App.load_env_dict_from_json()
        env_dict["HASURA_GRAPHQL_METADATA_URL"] = arg
        App.save_env_dict_to_json(env_dict)
        logging.log(logging.INFO,
                    f"Hasura metadata url set to {arg}. Environment Variable: HASURA_GRAPHQL_METADATA_URL")

    def do_set_hasura_admin_secret(self, arg):
        """
        Sets the hasura admin secret.
        Usage: set_hasura_admin_secret <secret>
        Example: set_hasura_admin_secret ****
        """
        if len(arg) == 0:
            logging.log(logging.WARNING, "Please provide a secret")
            return
        self.hasura_admin_secret = arg
        os.environ["HASURA_GRAPHQL_ADMIN_SECRET"] = arg
        env_dict = App.load_env_dict_from_json()
        env_dict["HASURA_GRAPHQL_ADMIN_SECRET"] = arg
        App.save_env_dict_to_json(env_dict)
        logging.log(logging.INFO,
                    f"Hasura admin secret set to {arg[0:4]}****"
                    f"{arg[-4:]}. Environment Variable: HASURA_GRAPHQL_ADMIN_SECRET")

    def do_import(self, _):
        """
        Imports the metadata from the hasura metadata url.
        Usage: import
        """
        if self.hasura_url is None:
            logging.log(logging.WARNING, "Please set the hasura url first")
            return
        if self.hasura_admin_secret is None:
            logging.log(logging.WARNING, "Please set the hasura admin secret first")
            return
        cmd = f"""curl -d'{{"type": "export_metadata", "args": {{}}}}' {self.hasura_url} -H "X-Hasura-Admin-Secret: {
        self.hasura_admin_secret}" -o hasura_metadata.json"""
        os.system(cmd)

    def do_setup(self, _):
        pass


def cli():
    app = App()
    app.cmdloop()
