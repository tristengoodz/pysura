# This is the command line
from cmd import Cmd
from prompt_toolkit import prompt
from prompt_toolkit.history import InMemoryHistory
from prompt_toolkit.completion import WordCompleter
import inspect
import logging
import sys
import time
import os
import json


class LogLevelFilter(logging.Filter):
    """This is a logging filter that filters out all messages that are not of a certain level."""

    def __init__(self, level):
        super().__init__()
        self.level = level

    def filter(self, record):
        return record.levelno == self.level


class RootCmd(Cmd):

    def setup_logging(self):
        """
        This setup_logging function is called to create the log handlers and loggers for each file.
        """
        if not os.path.exists("logs"):
            os.mkdir("logs")
        log_path = os.path.join(os.getcwd(), "logs")
        log_levels = {
            'debug': logging.DEBUG,
            'info': logging.INFO,
            'warning': logging.WARNING,
            'error': logging.ERROR,
            'critical': logging.CRITICAL
        }

        root_logger = logging.getLogger()
        if not root_logger.hasHandlers():
            root_logger.setLevel(logging.DEBUG)

            for level_name, level in log_levels.items():
                log_file_handler = logging.FileHandler(f'{log_path}/{level_name}.log', mode='a')
                log_file_handler.setLevel(level)
                log_file_formatter = logging.Formatter(fmt="%(asctime)s %(levelname)-5s %(message)s",
                                                       datefmt="%Y-%m-%d %I:%H:%M")
                log_file_handler.setFormatter(log_file_formatter)

                level_filter = LogLevelFilter(level)
                log_file_handler.addFilter(level_filter)

                level_logger = logging.getLogger(level_name)
                level_logger.setLevel(level)
                level_logger.addHandler(log_file_handler)
                level_logger.propagate = False

                root_logger.addHandler(log_file_handler)

            root_handler = logging.StreamHandler(sys.stdout)
            root_handler.setLevel(logging.INFO)
            root_formatter = logging.Formatter(fmt="%(asctime)s %(levelname)-5s %(message)s",
                                               datefmt="%Y-%m-%d %I:%H:%M")
            root_handler.setFormatter(root_formatter)
            root_logger.addHandler(root_handler)
        self.root = root_logger

    def __init__(self, *args, logger=None, **kwargs):
        super().__init__(*args, **kwargs)
        self.prompt = "root> "
        # We are overriding Cmd, so all commands with a do_ prefix will be turned into command line commands.
        # Auto build a command completer by inspecting the methods attached to self, and stripping the "do_" prefix
        self.completer = WordCompleter([
            *[i[0][3:] for i in inspect.getmembers(self, predicate=inspect.isfunction) if
              i[0].startswith("do_")],
            *[i[0][3:] for i in inspect.getmembers(self, predicate=inspect.ismethod) if
              i[0].startswith("do_")]
        ])
        self.root = None
        if logger is None:
            self.setup_logging()
        else:
            self.root = logger
        self.history = InMemoryHistory()
        self.setup_step = 0

    def cmdloop(self, intro=None):
        self.preloop()

        try:
            if intro is not None:
                self.intro = intro
            if self.intro:
                self.stdout.write(str(self.intro) + "\n")
            stop = None
            while not stop:
                try:
                    line = prompt(
                        self.prompt,
                        completer=self.completer,
                        history=self.history
                    )
                except EOFError:
                    line = 'EOF'
                line = self.precmd(line)
                stop = self.onecmd(line)
                stop = self.postcmd(stop, line)
            self.postloop()
        finally:
            self.log("Exiting...")

    @staticmethod
    def log(log_str: str, level=logging.INFO):
        logging.log(level, log_str)

    def collect(self, collect_str: str, completer=None):
        if isinstance(completer, list):
            completer = WordCompleter(completer)
        else:
            completer = None
        try:
            input_str = prompt(
                f"{collect_str}",
                completer=completer,
                history=self.history
            )
            if len(input_str.strip()) == 0:
                return self.collect(collect_str,
                                    completer)
            elif input_str.strip() in ["exit", "quit"]:
                self.log("\nExiting...")
                exit(0)
            else:
                return input_str
        except KeyboardInterrupt:
            self.log("\nKeyboardInterrupt. Exiting...")
            exit(1)

    def user_input_no_loop(self, func):
        try_again = self.collect("Try again? (y/n)")
        if try_again.strip().lower() == "y":
            func()

    def confirm_loop(self, confirm_str):
        confirm = self.collect(f"Retype to confirm (Retype this {confirm_str}, Up key = History): ")
        if confirm.strip() != confirm_str.strip():
            self.log("Cancelled.")
            return False
        return True

    def gcloud_retry_loop(self, cmd_str, name):
        for i in range(5):
            try:
                response = os.popen(cmd_str).read()
                response = json.loads(response)
                if len(response) == 0:
                    raise Exception(f"No {name} found.")
                for r in response:
                    if r["name"].split("/")[-1] == name:
                        return response
                raise Exception(f"No {name} found.")
            except Exception as e:
                self.log(f"{e}\nName not found in response, trying network", level=logging.DEBUG)
                try:
                    response = os.popen(cmd_str).read()
                    response = json.loads(response)
                    if len(response) == 0:
                        raise Exception(f"No {name} found.")
                    for r in response:
                        if r["network"].split("/")[-1] == name:
                            return response
                    raise Exception(f"No {name} found.")
                except Exception as e:
                    self.log(f"Error: {e}")
                    self.log(f"Retrying in {3 * i} seconds...")
                    time.sleep(3 * i)
        return None
