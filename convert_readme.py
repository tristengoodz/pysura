from m2r import convert

with open("README.rst", "w", encoding="utf-8") as f:
    f.write(convert(open("README.md").read()))
