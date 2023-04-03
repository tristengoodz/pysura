from pysura.pysura_types.root_cmd import RootCmd
from pysura.cli.google_root import GoogleRoot


class App(RootCmd):

    def __init__(self, *arg, **kwargs):
        super().__init__(*arg, **kwargs)
        self.intro = "Welcome to Pysura! Type help or ? to list commands."
        self.prompt = "(pysura_cli) >>> "
        self.do_choose_provider(provider="google")

    def do_choose_provider(self, provider="google"):
        """
        Launches the chosen provider's CLI
        """
        if provider.strip() == "":
            provider = self.collect("Please choose a provider: [google,]: ", ["google"])
        if provider == "google":
            GoogleRoot(logger=self.root).cmdloop()
        else:
            print("Invalid provider")


def cli():
    App()
