from prompt_toolkit import Application
from prompt_toolkit.application import get_app
from prompt_toolkit.buffer import Buffer
from prompt_toolkit.key_binding import KeyBindings
from prompt_toolkit.layout import HSplit, VSplit, FormattedTextControl, Window, ScrollablePane, Layout, WindowAlign
from prompt_toolkit.layout.controls import BufferControl

# Create the buffers
left_buffer = Buffer()
right_buffer = Buffer()

# Key bindings
kb = KeyBindings()


@kb.add("c-c", eager=True)
@kb.add("c-q", eager=True)
def _(event):
    event.app.exit()


# Create the layout
left_window = Window(BufferControl(buffer=left_buffer))
right_window = Window(BufferControl(buffer=right_buffer))


def default_buffer_changed(_):
    right_buffer.text = left_buffer.text[::-1]


left_buffer.on_text_changed += default_buffer_changed

left_scrollable = ScrollablePane(content=left_window)
right_scrollable = ScrollablePane(content=right_window)


body = VSplit(
    [
        left_scrollable,
        # A vertical line in the middle.
        Window(width=1, char="|", style="class:line"),
        # Display the Result buffer on the right.
        right_scrollable,
    ]
)


def get_titlebar_text():
    return [
        ("class:title", " Pysura "),
    ]


root_container = HSplit(
    [
        # The titlebar.
        Window(
            height=1,
            content=FormattedTextControl(get_titlebar_text),
            align=WindowAlign.CENTER,
        ),
        # Horizontal separator.
        Window(height=1, char="-", style="class:line"),
        # The 'body', like defined above.
        body,
    ]
)

app = Application(mouse_support=True,
                  layout=Layout(root_container, focused_element=left_window),
                  full_screen=True,
                  key_bindings=kb)

app.run()
