import tkinter as tk
import os

class TerminalGUI(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Terminal GUI")
        self.geometry("800x600")

        self.output = tk.Text(self, wrap='word', state='disabled', bg='black', fg='white', font=("Consolas", 12))
        self.output.pack(fill='both', expand=True)

        self.entry = tk.Entry(self, bg='black', fg='white', font=("Consolas", 12), insertbackground='white')
        self.entry.pack(fill='x', side='bottom')
        self.entry.bind('<Return>', self.run_command)
        self.entry.focus()

    def run_command(self, event):
        command = self.entry.get()
        self.entry.delete(0, 'end')

        if command:
            self.update_output(f'$ {command}\n')
            os.system(f'{command} > tmp_output.txt 2>&1')
            with open('tmp_output.txt', 'r') as output_file:
                output = output_file.read()
            self.update_output(f'{output}\n')

    def update_output(self, text):
        self.output.config(state='normal')
        self.output.insert('end', text)
        self.output.see('end')
        self.output.config(state='disabled')

if __name__ == '__main__':
    gui = TerminalGUI()
    gui.mainloop()