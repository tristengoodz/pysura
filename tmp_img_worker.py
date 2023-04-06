import base64
import PIL.Image

with open("testimage.png", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

print(type(encoded_string))

str_type = encoded_string.decode("utf-8")
print(encoded_string)

bytes_type = bytes(encoded_string)
print(len(bytes_type) / (1024 * 1024))
with open("img2.png", "wb") as f:
    f.write(base64.b64decode(bytes_type))

with open("tmp.txt", "w") as f:
    f.write(str_type)

size_in_bytes = len(encoded_string)
size_in_megabytes = size_in_bytes / (1024 * 1024)
print(size_in_megabytes)
