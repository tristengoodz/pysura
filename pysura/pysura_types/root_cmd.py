# INSTRUCTIONS FOR GPT4

# Rewrite the CMD loop to be more succinct and use prompt_toolkit features for history

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


class RootCmd(Cmd):

    def setup_logging(self):
        root_logger = logging.getLogger()
        root_logger.setLevel(logging.DEBUG)
        root_handler = logging.StreamHandler(sys.stdout)
        root_handler.setLevel(logging.DEBUG)
        root_formatter = logging.Formatter(fmt="%(asctime)s %(levelname)-5s %(message)s",
                                           datefmt="%Y-%m-%d %I:%H:%M")
        root_handler.setFormatter(root_formatter)
        root_logger.addHandler(root_handler)
        self.root = root_logger

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.prompt = "root> "
        self.completer = WordCompleter([
            *[i[0][3:] for i in inspect.getmembers(self, predicate=inspect.isfunction) if
              i[0].startswith("do_")],
            *[i[0][3:] for i in inspect.getmembers(self, predicate=inspect.ismethod) if
              i[0].startswith("do_")]
        ])
        self.root = None
        self.setup_logging()
        self.history = InMemoryHistory()

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
        confirm = self.collect("Retype to confirm: ")
        if confirm.strip() != confirm_str.strip():
            self.log("Cancelled.")
            return False
        return True

    def retry_loop(self, cmd_str, name):
        for i in range(5):
            try:
                self.log(cmd_str, level=logging.DEBUG)
                response = os.popen(cmd_str).read()
                response = json.loads(response)
                if len(response) == 0:
                    raise Exception(f"No {name} found.")
                for r in response:
                    if r["name"].split("/")[-1] == name:
                        return response
                raise Exception(f"No {name} found.")
            except Exception as e:
                try:
                    self.log(cmd_str, level=logging.DEBUG)
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
