import base64
import PIL.Image

with open("img.png", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

with open("img2.png", "wb") as f:
    f.write(base64.b64decode(encoded_string))

size_in_bytes = len(encoded_string)
size_in_megabytes = size_in_bytes / (1024 * 1024)
print(size_in_megabytes)