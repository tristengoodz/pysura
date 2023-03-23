from setuptools import setup

setup(
    name="pysura",
    version="0.9.19",
    packages=["cli.faster_api"],
    entry_points={
        "console_scripts": [
            "pysura=cli.app:cli"
        ]
    },
    author="Tristen Harr",
    author_email="tristen@thegoodzapp.com",
    description="A Python library used to generate a backend for custom logic using Hasura as a Data-layer",
    long_description=open("README.md").read(),
    url="https://github.com/tristengoodz/pysura",
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Build Tools",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3"
    ],
    keywords="hasura, graphql, postgresql, google-cloud, python, pysura, backend, backend-in-a-box",
    python_requires=">=3.10",
    install_requires=[
        "psycopg2"
    ],
    extras_require={
    },

)
