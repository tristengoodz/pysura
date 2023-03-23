# Pysura

### Hasura + Python = Pysura

## Limitations:

Currently, this only supports a Google-based deployment/stack. I think this would be fixable, but due to the amount of
time I've spent learning gcloud it would probably be better suited to a AWS/Azure/Etc. architect to write the commands.

## Requirements:

- gcloud CLI
- gcloud beta CLI
- A billing account with Google Cloud
- Docker
- Firebase CLI
- Python 3.6+

```commandline
pip install pysura
pysura
(pysura_cli) >>> setup
```

# What is Pysura?

Pysura is a CLI tool that's designed to make building and deploying actions, events, and chron-jobs as easy as it is to
do everything else in Hasura.

Pysura does *not* use the Hasura CLI, and instead manages the metadata directly via retrieving it and overwriting it.

Pysura is built to bring Python to Hasura because it's a really great language for things like actions, events, and
chron-jobs.

How can Pysura help me setup my project?

Run the setup command and follow the installer instructions and you are done.

### What the setup command does?

1. Create or select an existing project in Google Cloud
2. Select an existing billing account in Google Cloud
3. Configure a Virtual Private cloud with subnets and firewall rules
4. Create a Cloud SQL Postgresql instance with specified memory and storage in specified region
5. Deploys Hasura to Cloud Run with all database connections routed through serverless VPC connectors
6. Attaches a Firebase project to the google cloud project
7. Enables Firebase Authentication (Requires user to enable phone authentication in the Firebase console)
8. Builds and Deploys template firebase functions to handle authentication and authorization
9. Attaches Firebase Authentication JWT to Hasura for RBAC

### What is a Pysura microservice?

A pysura microservice is a FastAPI application that is deployed to Cloud Run that handles actions, events, and
chron-jobs.

All action inputs and outputs are converted into Pydantic models.

Each action or event is placed inside its own individual file, with auth baked in.

### Who is Pysura for?

Pysura is for Python developers who want to adopt GraphQL in a way that's pythony.

# Pysura commands

## Start pysura

```commandline
pysura
```

## Setup

Automagic project setup.

```commandline
setup
```

## Quit pysura

```commandline
quit
exit
^Z
```

## Set a Google Cloud Project

```commandline
gcloud_set_project <project_id>
```

## Configure Hasura Instance

Set Admin Secret

```commandline
set_hasura_admin_secret <admin_secret>
```

Set Hasura Metadata URL:

```commandline
set_hasura_metadata_url <metadata_url>
```

## Import the Hasura Metadata

```commandline
import_hasura_metadata
```

## Export the Hasura Metadata

```commandline
export_hasura_metadata
```

## Add a new database to hasura. (Create new Postgresql or use existing)

```commandline
add_database
```



## Add a new action to hasura
TODO


TODOS:

Flutterfire
Microservice templates


