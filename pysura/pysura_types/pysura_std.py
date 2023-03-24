from prompt_toolkit import prompt
from prompt_toolkit.completion import WordCompleter
import logging


class PysuraStd:

    @staticmethod
    def log(log_str: str, level=logging.INFO):
        logging.log(level, log_str.strip("\n"))

    @staticmethod
    def collect(collect_str: str, completer=None):
        if isinstance(completer, list):
            completer = WordCompleter(completer)
        else:
            completer = None
        try:
            input_str = prompt(
                f"\n{collect_str}: ",
                completer=completer
            )
            if len(input_str.strip()) == 0:
                return PysuraStd.collect(collect_str, completer)
            elif input_str.strip() in ["exit", "quit"]:
                PysuraStd.log("\nExiting...")
                exit(0)
            else:
                return input_str
        except KeyboardInterrupt:
            PysuraStd.log("\nKeyboardInterrupt. Exiting...")
            exit(1)
