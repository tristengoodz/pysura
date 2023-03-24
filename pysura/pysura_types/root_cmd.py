from cmd import Cmd
from prompt_toolkit import prompt
from prompt_toolkit.completion import WordCompleter
import inspect


class RootCmd(Cmd):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.prompt = "root> "
        self.completer = WordCompleter([
            *[i[0][3:] for i in inspect.getmembers(self, predicate=inspect.isfunction) if
              i[0].startswith("do_")],
            *[i[0][3:] for i in inspect.getmembers(self, predicate=inspect.ismethod) if
              i[0].startswith("do_")]
        ])

    def cmdloop(self, intro=None):
        """Repeatedly issue a prompt, accept input, parse an initial prefix
        off the received input, and dispatch to action methods, passing them
        the remainder of the line as argument.

        """

        self.preloop()
        if self.use_rawinput and self.completekey:
            try:
                import readline
                self.old_completer = readline.get_completer()
                readline.set_completer(self.complete)
                readline.parse_and_bind(self.completekey + ": complete")
            except ImportError:
                pass
        try:
            if intro is not None:
                self.intro = intro
            if self.intro:
                self.stdout.write(str(self.intro) + "\n")
            stop = None
            while not stop:
                if self.cmdqueue:
                    line = self.cmdqueue.pop(0)
                else:
                    if self.use_rawinput:
                        try:
                            line = prompt(
                                self.prompt,
                                completer=self.completer
                            )
                        except EOFError:
                            line = 'EOF'
                    else:
                        self.stdout.write(self.prompt)
                        self.stdout.flush()
                        line = self.stdin.readline()
                        if not len(line):
                            line = 'EOF'
                        else:
                            line = line.rstrip('\r\n')
                line = self.precmd(line)
                stop = self.onecmd(line)
                stop = self.postcmd(stop, line)
            self.postloop()
        finally:
            if self.use_rawinput and self.completekey:
                try:
                    import readline
                    readline.set_completer(self.old_completer)
                except ImportError:
                    pass
