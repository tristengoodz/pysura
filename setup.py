from setuptools import setup, find_packages

setup(
    name="pysura",
    version="0.99.73",
    packages=find_packages(),
    entry_points={
        "console_scripts": [
            "pysura=pysura.cli.app:cli"
        ]
    },
    package_dir={"pysura": "pysura"},
    package_data={
        "pysura": [
            "library_data/pysura_auth/.gcloudignore",
            "library_data/pysura_auth/main.py",
            "library_data/pysura_auth/requirements.txt",

            "library_data/pysura_frontend/pubspec.yaml",
            "library_data/pysura_frontend/build.yaml",
            "library_data/pysura_frontend/lib/main.dart",

            "library_data/pysura_frontend/lib/common/app_color.dart",
            "library_data/pysura_frontend/lib/common/app_route.dart",
            "library_data/pysura_frontend/lib/common/app_text_style.dart",
            "library_data/pysura_frontend/lib/common/app_theme.dart",
            "library_data/pysura_frontend/lib/common/constants.dart",
            "library_data/pysura_frontend/lib/common/date_util.dart",
            "library_data/pysura_frontend/lib/common/popups.dart",
            "library_data/pysura_frontend/lib/common/utils.dart",

            "library_data/pysura_frontend/lib/controllers/auth_controller.dart",
            "library_data/pysura_frontend/lib/controllers/graphql_controller.dart",
            "library_data/pysura_frontend/lib/controllers/data_controller.dart",
            "library_data/pysura_frontend/lib/controllers/theme_controller.dart",

            "library_data/pysura_frontend/lib/graphql/actions.graphql",
            "library_data/pysura_frontend/lib/graphql/actions.graphql.dart",
            "library_data/pysura_frontend/lib/graphql/schema.graphql",
            "library_data/pysura_frontend/lib/graphql/schema.graphql.dart",
            "library_data/pysura_frontend/lib/graphql/user.graphql",
            "library_data/pysura_frontend/lib/graphql/user.graphql.dart",

            "library_data/pysura_frontend/lib/pages/auth/login_page.dart",
            "library_data/pysura_frontend/lib/pages/auth/login_page_controller.dart",

            "library_data/pysura_frontend/lib/pages/main/main_page.dart",
            "library_data/pysura_frontend/lib/pages/main/main_page_controller.dart",
            "library_data/pysura_frontend/lib/pages/main/main_page_middleware.dart",

            "library_data/pysura_frontend/lib/pages/main/action/action_page.dart",
            "library_data/pysura_frontend/lib/pages/main/action/action_page_controller.dart",

            "library_data/pysura_frontend/lib/pages/main/home/home_page.dart",
            "library_data/pysura_frontend/lib/pages/main/home/home_page_controller.dart",

            "library_data/pysura_frontend/lib/pages/main/settings/settings_page.dart",
            "library_data/pysura_frontend/lib/pages/main/settings/settings_page_controller.dart",

            "library_data/pysura_frontend/lib/pages/misc/error_page.dart",
            "library_data/pysura_frontend/lib/pages/misc/loading_page.dart",
            "library_data/pysura_frontend/lib/pages/misc/splash/splash_page.dart",
            "library_data/pysura_frontend/lib/pages/misc/splash/splash_page_controller.dart",

            "library_data/pysura_frontend/lib/widgets/graphql_provider_widget.dart",
            "library_data/pysura_frontend/lib/widgets/phone_number_field.dart",
            "library_data/pysura_frontend/lib/widgets/primary_button.dart",
            "library_data/pysura_frontend/lib/widgets/secondary_button.dart",

            "library_data/pysura_microservice/actions/__init__.py",
            "library_data/pysura_microservice/actions/action_template.py",
            "library_data/pysura_microservice/actions/action_upload_file.py",

            "library_data/pysura_microservice/crons/__init__.py",

            "library_data/pysura_microservice/events/__init__.py",
            "library_data/pysura_microservice/events/event_update_user_role.py",

            "library_data/pysura_microservice/Dockerfile",
            "library_data/pysura_microservice/app.py",
            "library_data/pysura_microservice/requirements.txt",
            "library_data/pysura_microservice/README.md",
            "library_data/pysura_microservice/app_secrets.py",
            "library_data/pysura_microservice/pysura_metadata.json",

            "library_data/pysura_ssr/.firebaserc",
            "library_data/pysura_ssr/firebase.json"
        ],
    },
    include_package_data=True,
    author="Tristen Harr",
    author_email="tristen@thegoodzapp.com",
    description="A useful tool that provides commands to help ease the installation process of Hasura, "
                "and manage its actions, events, and scheduled jobs with baked in phone Auth and a Flutter frontend.",
    long_description=open("README.rst", encoding="utf-8").read(),
    url="https://github.com/tristengoodz/pysura",
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Build Tools",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3"
    ],
    keywords="hasura, graphql, postgresql, google-cloud, python, pysura, backend, backend-in-a-box",
    python_requires=">=3.9",
    install_requires=[
        "pydantic",
        "prompt_toolkit",
        "python-graphql-client",
        "requests",
        "asyncpg"
    ]
)
