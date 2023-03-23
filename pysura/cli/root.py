from cmd import Cmd
import json
import site
import os


class Root(Cmd):
    SITE_PACKAGES_URL = site.getsitepackages()[0]

    @staticmethod
    def find_path(file_name: str = "env.json"):
        return os.path.join(Root.SITE_PACKAGES_URL, "pysura", "library_data", file_name)

    @property
    def env(self) -> dict:
        try:
            with open(Root.find_path(), "r") as f:
                return json.load(f)
        except FileNotFoundError:
            with open(Root.find_path(), "w") as f:
                json.dump({}, f)
                return {}

    @env.setter
    def env(self, value: dict):
        try:
            with open(Root.find_path(), "w") as f:
                json.dump(value, f)
        except FileNotFoundError:
            with open(Root.find_path(), "w") as f:
                json.dump({}, f)
