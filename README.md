# Pysura

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

What is Pysura?

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

Each action or event is placed inside its own individual file, with auth baked in. Here's an example of a generated
action file.

```python
from fastapi import APIRouter, Depends, Request
from security import backend_auth, UserIdentity, identity, firebase_jwt_auth, IDENTITY_PROVIDER
from generated_types import *
from enums import ApiResponse, ClientRole
import logging

ROUTE = "/base_generator_mutation/"  # Clear and easy to see and understand the route
REQUIRED_ROLE = ClientRole.user.name  # Access management is a piece of cake
action_base_generator_mutation_router = APIRouter(
    tags=["action_base_generator_mutation"]
)


@action_base_generator_mutation_router.post(ROUTE,
                                            # Authenticate before anything touches the business logic
                                            # Authenticate with both a user identity, AND a backend secret.
                                            # Guarantee that the request came from your app.
                                            dependencies=[Depends(firebase_jwt_auth), Depends(backend_auth)])
@identity(required_role=REQUIRED_ROLE,
          identity_provider=IDENTITY_PROVIDER,
          function_input=BaseGeneratorMutationInput)
async def action_base_generator_mutation(_: Request,
                                         base_generator_mutation_input: Optional[BaseGeneratorMutationInput] = None,
                                         injected_user_identity: Optional[UserIdentity] = None
                                         ):
    # (AUTH-LOCK-START) - DO NOT DELETE THIS LINE!
    # Get the user id from the injected user as well as their roles and allowed roles.
    # Authentication fails if they don't have the allowed role for this action.
    if injected_user_identity is None or injected_user_identity.user_id is None:
        return {
            "response_name": ApiResponse.UNAUTHORIZED.name,
            "response_value": ApiResponse.UNAUTHORIZED.value
        }
    logging.log(logging.INFO, f"User {injected_user_identity.user_id} is authorized to access {ROUTE}")
    # (AUTH-LOCK-END) - DO NOT DELETE THIS LINE!

    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    print(base_generator_mutation_input)  # Typed inputs w/Pydantic
    response = BaseGeneratorMutationOutput(
        data=None,
        nodes=None,
        response_name=ApiResponse.SUCCESS.name,
        response_value=ApiResponse.SUCCESS.value
    ).dict()  # Typed outputs w/Pydantic
    return response
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!

```

### Who is Pysura for?

Pysura is for Python developers who want to adopt GraphQL in a way that's pythony.
