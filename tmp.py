import tkinter as tk
from tkinter import ttk


def main():
    root = tk.Tk()
    root.title('Tkinter GUI')

    # Create the top left read/select-only text field
    top_left_text = tk.Text(root, wrap=tk.WORD, height=20, width=80, state='disabled')
    top_left_text.grid(row=0, column=0, padx=10, pady=10, sticky='nw')

    # Create the choice box (Combobox) underneath the top left text field
    top_right_var = tk.StringVar()
    top_right_choicebox = ttk.Combobox(root, textvariable=top_right_var, state='readonly', width=78)
    top_right_choicebox['values'] = ('Option 1', 'Option 2', 'Option 3')
    top_right_choicebox.grid(row=1, column=0, padx=10, pady=10, sticky='sw')

    # Create the right read/select-only text field
    right_text = tk.Text(root, wrap=tk.WORD, height=40, width=80, state='disabled')
    right_text.grid(row=0, column=1, rowspan=2, padx=10, pady=10, sticky='ne')

    # Create the bottom right progress bar
    progress_bar = ttk.Progressbar(root, orient='horizontal', length=650, mode='determinate')
    progress_bar.grid(row=2, column=0, columnspan=2, padx=10, pady=10, sticky='se')

    root.mainloop()


if __name__ == '__main__':
    main()
