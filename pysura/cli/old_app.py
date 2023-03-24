from cmd import Cmd
import os
import logging
import sys
import json
import random
from string import ascii_letters, digits
import psycopg2


def password(length=16):
    return "".join(random.choice(ascii_letters + digits) for _ in range(length))


root = logging.getLogger()
root.setLevel(logging.DEBUG)

handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
root.addHandler(handler)


class App(Cmd):
    ENV_JSON = "env.json"

    DEPLOY_OPTIONS = ["Google Cloud Platform"]
    AUTH_PROVIDERS = ["Firebase"]

    FIREBASE_INDEX = """// index.js
"use strict";

const admin = require("firebase-admin");
admin.initializeApp();

const functions = require("firebase-functions");
const gqlRequest = require("graphql-request");
const gql = gqlRequest.gql;

// We leave it to the reader to pass these via secret manager
const gqlUrl = "HASURA_ROOT_URL/v1/graphql";
const gqlSecret = "HASURA_GRAPHQL_ADMIN_SECRET";


const RESULT_SUCCESS = 1000;
const RESULT_UNKNOWN_ERROR = -1;
const RESULT_INVALID_PARAM = -1000;

const getUserRoleGQL = gql`query getRole($uid: String = "") {
  user(where: {user_id: {_eq: $uid}}) {
    role
  }
}
`;

const createUserGQL = gql`mutation CreateUser($id: String = "", $phone: String = "") {
  insert_user_one(object: {user_id: $id, user_phone: $phone}) {
    id: user_id
  }
}
`;

exports.onCreateAuthUser = functions.runWith({
    minInstances: 1
}).auth.user().onCreate(async (user) => {
    return await createUserClaims(user);

});

exports.refreshUserClaims = functions.runWith({
    minInstances: 1
}).https.onCall(async (data, context) => {
    const uid = context.auth.uid;
    if (uid) {
        return await refreshUserClaims(uid);
    } else {
        return RESULT_INVALID_PARAM;
    }

});

exports.logoutUserClaims = functions.runWith({
    minInstances: 1
}).https.onCall(async (data, context) => {
    const uid = context.auth.uid;
    if (uid) {
        return await logoutUserClaims(uid);
    } else {
        return RESULT_INVALID_PARAM;
    }

});

async function createUserClaims(user) {
    const uid = user.uid;
    const phone = user.phoneNumber;
    const client = new gqlRequest.GraphQLClient(gqlUrl, {
        headers: {
            "x-hasura-admin-secret": gqlSecret,
        },
    });
    const result = await client.request(getUserRoleGQL, {uid: uid});
    if (result.user.length === 0) {
        await client.request(createUserGQL, {
            id: uid,
            phone: phone,
        });
    }
    const customClaims = {
        "https://hasura.io/jwt/claims": {
            "x-hasura-default-role": "user",
            "x-hasura-allowed-roles": ["user"],
            "x-hasura-user-id": uid,
        },
    };
    return admin.auth().setCustomUserClaims(uid, customClaims)
        .then(() => {
            return RESULT_SUCCESS;
        }).catch(error => {
            console.log(`setCustomUserClaims - error : ${error}`);
            return RESULT_UNKNOWN_ERROR;
        });
}

async function getUserClaims(uid) {
    const client = new gqlRequest.GraphQLClient(gqlUrl, {
        headers: {
            "x-hasura-admin-secret": gqlSecret,
        },
    });
    const result = await client.request(getUserRoleGQL, {uid: uid});
    if (result.user && result.user.length === 1) {
        const role = result.user[0].role;
        return {
            "https://hasura.io/jwt/claims": {
                "x-hasura-default-role": role,
                "x-hasura-allowed-roles": [role],
                "x-hasura-user-id": uid,
            },
        };
    }
}

async function refreshUserClaims(uid) {
    const claims = await getUserClaims(uid);
    return await admin.auth().setCustomUserClaims(uid, claims);
}

async function logoutUserClaims(uid) {
    const claims = await getUserClaims(uid);
    await admin.auth().revokeRefreshTokens(uid);
    return await admin.auth().setCustomUserClaims(uid, claims);
}
"""

    APP_PY = """from fastapi import FastAPI, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse
from actions import action_routers
from events import event_routers

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
    allow_credentials=True
)


@app.get("/",
         response_class=RedirectResponse,
         status_code=status.HTTP_302_FOUND)
async def root():
    return "/docs"


for router in action_routers:
    app.include_router(router)

for router in event_routers:
    app.include_router(router)
"""

    DOCKER_FILE = """# Python image to use.
FROM python:3.10
ENV PYTHONUNBUFFERED 1
# Set the working directory to /app
WORKDIR /app
# copy the requirements file used for dependencies
COPY requirements.txt .
# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the rest of the working directory contents into the container at /app
COPY . .

# Run app.py when the container launches
CMD exec gunicorn --timeout 600 --bind :$PORT --workers 1 """ + \
                  """--worker-class uvicorn.workers.UvicornWorker  --threads 2 app:app"""

    APP_SECRETS = """import os
from google.cloud import secretmanager

PROJECT_ID = "YOUR_PROJECT_ID"


def get_secret_by_id(secret_id, version_id="latest"):
    client = secretmanager.SecretManagerServiceClient()
    name = f"projects/{PROJECT_ID}/secrets/{secret_id}/versions/{version_id}"
    response = client.access_secret_version(name=name)
    return response.payload.data.decode("UTF-8")


print("LOADING SECRETS")
HASURA_GRAPHQL_ADMIN_SECRET = get_secret_by_id("HASURA_GRAPHQL_ADMIN_SECRET")
HASURA_GRAPHQL_URL_ROOT = get_secret_by_id("HASURA_GRAPHQL_URL_ROOT")
FASTAPI_EVENT_SECRET = get_secret_by_id("FASTAPI_EVENT_SECRET")
BACKEND_FIREBASE_SERVICE_ACCOUNT = get_secret_by_id("BACKEND_FIREBASE_SERVICE_ACCOUNT")
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = BACKEND_FIREBASE_SERVICE_ACCOUNT"""

    REQUIREMENTS_TEXT = """aiohttp>=3.8.4
aiosignal>=1.3.1
anyio>=3.6.2
async-timeout>=4.0.2
attrs>=22.2.0
CacheControl>=0.12.11
cachetools>=5.3.0
certifi>=2022.12.7
cffi>=1.15.1
charset-normalizer>=3.1.0
click>=8.1.3
cryptography>=39.0.2
fastapi>=0.95.0
firebase-admin>=6.1.0
frozenlist>=1.3.3
google-api-core>=2.11.0
google-api-python-client>=2.81.0
google-auth>=2.16.2
google-auth-httplib2>=0.1.0
google-cloud-appengine-logging>=1.3.0
google-cloud-audit-log>=0.2.5
google-cloud-core>=2.3.2
google-cloud-firestore>=2.10.0
google-cloud-logging>=3.5.0
google-cloud-secret-manager>=2.16.0
google-cloud-storage>=2.7.0
google-crc32c>=1.5.0
google-resumable-media>=2.4.1
googleapis-common-protos>=1.58.0
grpc-google-iam-v1>=0.12.6
grpcio>=1.51.3
grpcio-status>=1.51.3
gunicorn>=20.1.0
h11>=0.14.0
httplib2>=0.21.0
idna>=3.4
msgpack>=1.0.5
multidict>=6.0.4
proto-plus>=1.22.2
protobuf>=4.22.1
pyasn1>=0.4.8
pyasn1-modules>=0.2.8
pycparser>=2.21
pydantic>=1.10.6
PyJWT>=2.6.0
pyparsing>=3.0.9
python-graphql-client>=0.4.3
requests>=2.28.2
rsa>=4.9
six>=1.16.0
sniffio>=1.3.0
starlette>=0.26.1
typing_extensions>=4.5.0
uritemplate>=4.1.1
urllib3>=1.26.15
uvicorn>=0.21.1
websockets>=10.4
yarl>=1.8.2
"""

    SECURITY_PY = """import firebase_admin
from firebase_admin import credentials, initialize_app, auth
from firebase_admin.exceptions import FirebaseError
from fastapi.security import APIKeyHeader
from fastapi import Request
from app_secrets import *
import json
from google.oauth2 import service_account
from fastapi import Depends, HTTPException, status
import google.cloud.logging
import logging
from typing import List, Optional, Type
from pydantic import BaseModel
import functools
from enums import IdentityProvider

cred_dict = json.loads(BACKEND_FIREBASE_SERVICE_ACCOUNT)
try:
    firestore_app = firebase_admin.get_app()
except ValueError:
    firestore_app = initialize_app(credential=credentials.Certificate(cred_dict))
creds = service_account.Credentials.from_service_account_info(cred_dict)
user_token = APIKeyHeader(name="Authorization", auto_error=False, scheme_name="user_token")
event_secret = APIKeyHeader(name="FASTAPI_EVENT_SECRET", auto_error=False, scheme_name="backend_secret")
logging_client = google.cloud.logging.Client(credentials=creds)
logging_client.setup_logging()

# TODO: It would be nice if there could be different auth connectors that could be packaged as submodules/subpackages
# TODO: Move firebase auth into a separate module - Priority 0
# TODO: auth0 - Priority 1
# TODO: Custom Auth baked in - Priority 2
# TODO: Twilio Auth? - Low Priority
# TODO: AWS Auth? - Low Priority
# TODO: Google Identity Platform Auth - Low Priority
# Done: Firebase Auth

IDENTITY_PROVIDER = IdentityProvider.firebase.name


def backend_auth(token_value: Optional[str] = Depends(event_secret)) -> None:
    if token_value is None or token_value != FASTAPI_EVENT_SECRET:
        logging.log(logging.WARNING, "FASTAPI_EVENT_SECRET invalid")
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")
    logging.log(logging.DEBUG, "FASTAPI_EVENT_SECRET verified successfully.")


def firebase_jwt_auth(token_value: Optional[str] = Depends(user_token)) -> None:
    if token_value is None:
        logging.log(logging.WARNING, "id_token is a not a string or is empty.")
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="id_token is a not a string or is empty.")
    token_value = token_value.replace("Bearer ", "")
    try:
        auth.verify_id_token(token_value, app=firestore_app)
        logging.log(logging.DEBUG, "Token verified successfully.")
    except Exception as _:
        logging.log(logging.WARNING, "Invalid Token provided!")
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")


class UserIdentity(BaseModel):
    role: str
    user_id: Optional[str]
    allowed_roles: Optional[List[str]]


def role_verify(request: Request, role="admin", identity_provider="firebase") -> UserIdentity:
    user_profile = {
        "role": role,
        "user_id": None,
        "allowed_roles": None
    }
    if identity_provider == "firebase":
        tok = request.headers.get("Authorization", None)
        if tok is None:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,
                                detail="id_token is a not a string or is empty.")
        tok = tok.replace("Bearer ", "")
        try:
            decoded_token = auth.verify_id_token(tok)
            claims = decoded_token["https://hasura.io/jwt/claims"]
            allowed_roles = claims["x-hasura-allowed-roles"]
            user_id = claims["x-hasura-user-id"]
            assert role in allowed_roles
            user_profile["user_id"] = user_id
            user_profile["allowed_roles"] = allowed_roles
        except ValueError as e:
            logging.log(logging.WARNING, e)
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,
                                detail="id_token is a not a string or is empty.")
        except FirebaseError as e:
            logging.log(logging.WARNING, e)
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Tenant ID Mismatch")
        except AssertionError as e:
            logging.log(logging.WARNING, e)
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Role not allowed")
        except Exception as e:
            logging.log(logging.ERROR, e)
        finally:
            return UserIdentity(
                role=role,
                user_id=user_profile.get("user_id", None),
                allowed_roles=user_profile.get("allowed_roles", None)
            )
    else:
        raise NotImplementedError("Identity Provider not implemented yet!")


# Decorator for collecting the user identity
def identity(original_function=None,
             required_role="admin",
             identity_provider="firebase",
             function_input: Type[BaseModel] = None):
    def _decorate(function):
        @functools.wraps(function)
        async def wrapped_function(*args, **kwargs):
            request: Request = kwargs["_"]
            request_data = await request.json()
            user_identity_obj = role_verify(request=kwargs["_"],
                                            role=required_role,
                                            identity_provider=identity_provider)
            if user_identity_obj.user_id is None:
                user_identity_obj = None
            overwrite_kwargs = {
                "injected_user_identity": user_identity_obj
            }
            if function_input:
                request_data_key = function.__name__.lstrip("action_") + "_input"
                logging.log(logging.INFO, f"REQUEST DATA: {request_data}")
                logging.log(logging.INFO, f"REQUEST DATA KEY: {request_data_key}")
                logging.log(logging.INFO, f"REQUEST HEADERS: {request.headers}")
                if request_data.get("input", None) is not None:
                    request_data = request_data["input"]
                overwrite_kwargs[request_data_key] = function_input(**request_data[request_data_key])
            return await function(
                *args,
                **{**kwargs,
                   **overwrite_kwargs
                   }
            )

        return wrapped_function

    if original_function:
        return _decorate(original_function)

    return _decorate
"""

    MICROSERVICE_DEFAULT_TYPES = {
        "custom_types": {
            "input_objects": [
                {
                    "name": "BaseGeneratorMutationInput",
                    "fields": [
                        {
                            "name": "string",
                            "type": "String!"
                        },
                        {
                            "name": "int",
                            "type": "Int!"
                        },
                        {
                            "name": "float",
                            "type": "Float!"
                        },
                        {
                            "name": "boolean",
                            "type": "Boolean!"
                        },
                        {
                            "name": "optional_string",
                            "type": "String"
                        },
                        {
                            "name": "optional_int",
                            "type": "Int"
                        },
                        {
                            "name": "optional_float",
                            "type": "Float"
                        },
                        {
                            "name": "optional_boolean",
                            "type": "Boolean"
                        }
                    ]
                },
                {
                    "name": "BaseGeneratorQueryInput",
                    "fields": [
                        {
                            "name": "input_string",
                            "type": "String"
                        }
                    ]
                }
            ],
            "objects": [
                {
                    "name": "BaseGeneratorMutationOutput",
                    "fields": [
                        {
                            "name": "data",
                            "type": "BaseGeneratorMutationData"
                        },
                        {
                            "name": "nodes",
                            "type": "[IdLink]"
                        },
                        {
                            "name": "response_name",
                            "type": "String!"
                        },
                        {
                            "name": "response_value",
                            "type": "Int!"
                        }
                    ]
                },
                {
                    "name": "BaseGeneratorMutationData",
                    "fields": [
                        {
                            "name": "data_string",
                            "type": "String!"
                        },
                        {
                            "name": "data_int",
                            "type": "Int!"
                        }
                    ]
                },
                {
                    "name": "IdLink",
                    "fields": [
                        {
                            "name": "link",
                            "type": "String!"
                        },
                        {
                            "name": "table",
                            "type": "String!"
                        }
                    ]
                },
                {
                    "name": "BaseGeneratorQueryOutput",
                    "fields": [
                        {
                            "name": "data",
                            "type": "BaseGeneratorQueryData"
                        },
                        {
                            "name": "nodes",
                            "type": "[IdLink]"
                        },
                        {
                            "name": "response_name",
                            "type": "String!"
                        },
                        {
                            "name": "response_value",
                            "type": "Int!"
                        }
                    ]
                },
                {
                    "name": "BaseGeneratorQueryData",
                    "fields": [
                        {
                            "name": "data_string",
                            "type": "String"
                        }
                    ]
                }
            ]
        }
    }

    ACTION_DEFAULT_TYPES = """{
  "actions": [
    {
      "name": "action_base_generator_mutation",
      "definition": {
        "handler": "{{FASTAPI_BACKEND_URL}}",
        "output_type": "BaseGeneratorMutationOutput",
        "forward_client_headers": true,
        "headers": [
          {
            "name": "FASTAPI_EVENT_SECRET",
            "value_from_env": "FASTAPI_EVENT_SECRET"
          }
        ],
        "arguments": [
          {
            "name": "base_generator_mutation_input",
            "type": "BaseGeneratorMutationInput"
          }
        ],
        "request_transform": {
          "method": "POST",
          "query_params": {},
          "template_engine": "Kriti",
          "url": "{{$base_url}}/base_generator_mutation/",
          "version": 2
        },
        "type": "mutation",
        "kind": "synchronous"
      },
      "comment": "/base_generator_mutation/",
      "permissions": [
        {
          "role": "user"
        }
      ]
    },
    {
      "name": "action_base_generator_query",
      "definition": {
        "handler": "{{FASTAPI_BACKEND_URL}}",
        "output_type": "BaseGeneratorQueryOutput",
        "forward_client_headers": true,
        "headers": [
          {
            "name": "FASTAPI_EVENT_SECRET",
            "value_from_env": "FASTAPI_EVENT_SECRET"
          }
        ],
        "arguments": [
          {
            "name": "base_generator_query_input",
            "type": "BaseGeneratorQueryInput"
          }
        ],
        "request_transform": {
          "method": "POST",
          "query_params": {},
          "template_engine": "Kriti",
          "url": "{{$base_url}}/base_generator_query/",
          "version": 2
        },
        "type": "query"
      },
      "comment": "/base_generator_query/",
      "permissions": [
        {
          "role": "user"
        }
      ]
    }
  ]
}"""

    ACTION_INIT_PY = """from actions.action_base_generator_mutation import action_base_generator_mutation_router
from actions.action_get_chat_tokens import action_get_chat_tokens_router

action_routers = [action_base_generator_mutation_router, action_get_chat_tokens_router]"""

    ACTION_TEMPLATE = """from fastapi import APIRouter, Depends, Request
from security import backend_auth, UserIdentity, identity, firebase_jwt_auth, IDENTITY_PROVIDER
from generated_types import *
from enums import ApiResponse, ClientRole
import logging

ROUTE = "/base_generator_mutation/"
REQUIRED_ROLE = ClientRole.user.name
action_base_generator_mutation_router = APIRouter(
    tags=["action_base_generator_mutation"]
)


@action_base_generator_mutation_router.post(ROUTE,
                                            dependencies=[Depends(firebase_jwt_auth), Depends(backend_auth)])
@identity(required_role=REQUIRED_ROLE,
          identity_provider=IDENTITY_PROVIDER,
          function_input=BaseGeneratorMutationInput)
async def action_base_generator_mutation(_: Request,
                                         base_generator_mutation_input: Optional[BaseGeneratorMutationInput] = None,
                                         injected_user_identity: Optional[UserIdentity] = None
                                         ):
    # (AUTH-LOCK-START) - DO NOT DELETE THIS LINE!
    if injected_user_identity is None or injected_user_identity.user_id is None:
        return {
            "response_name": ApiResponse.UNAUTHORIZED.name,
            "response_value": ApiResponse.UNAUTHORIZED.value
        }
    logging.log(logging.INFO, f"User {injected_user_identity.user_id} is authorized to access {ROUTE}")
    # (AUTH-LOCK-END) - DO NOT DELETE THIS LINE!

    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    print(base_generator_mutation_input)
    response = BaseGeneratorMutationOutput(
        data=None,
        nodes=None,
        response_name=ApiResponse.SUCCESS.name,
        response_value=ApiResponse.SUCCESS.value
    ).dict()
    return response
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
"""

    ENUMS_TEMPLATE = """from enum import Enum


class ApiResponse(Enum):
    SUCCESS = 1
    FAILURE = 2
    UNAUTHORIZED = 3


class ClientRole(Enum):
    user = 1
    admin = 100


class IdentityProvider(Enum):
    firebase = 1

"""

    FLUTTER_CONFIG = """"""

    @staticmethod
    def load_env_dict_from_json():
        try:
            with open(App.ENV_JSON) as f:
                return json.load(f)
        except FileNotFoundError:
            return {}

    @staticmethod
    def save_env_dict_to_json(env_dict):
        with open(App.ENV_JSON, "w") as f:
            json.dump(env_dict, f)

    @staticmethod
    def get_connection():
        env_dict = App.load_env_dict_from_json()
        conn = psycopg2.connect(
            host=env_dict["GCP_DATABASE_DETAILS"]["primary_address"],
            database="postgres",
            user="postgres",
            password=env_dict["GCP_DATABASE_PASSWORD"],
            port=5432
        )
        return conn

    def preloop(self):
        logging.log(logging.INFO, "Starting pysura cli...")
        env_dict = App.load_env_dict_from_json()
        hasura_url = env_dict.get("HASURA_GRAPHQL_METADATA_URL", None)
        if hasura_url is not None:
            os.environ["HASURA_GRAPHQL_METADATA_URL"] = hasura_url
            logging.log(logging.INFO, f"Hasura metadata url set to {hasura_url}.")
        hasura_admin_secret = env_dict.get("HASURA_GRAPHQL_ADMIN_SECRET", None)
        if hasura_admin_secret is not None:
            os.environ["HASURA_GRAPHQL_ADMIN_SECRET"] = hasura_admin_secret
            logging.log(logging.INFO,
                        f"Hasura admin secret set to {hasura_admin_secret[0:4]}****"
                        f"{hasura_admin_secret[-4:]}. Environment Variable: HASURA_GRAPHQL_ADMIN_SECRET")

    def __init__(self):
        super().__init__()
        self.intro = "Welcome to Pysura! Type help or ? to list commands."
        self.prompt = "(pysura_cli) >>> "
        self.setup_complete = False

    @staticmethod
    def do_exit(_):
        """
        Exits the application.
        Usage: exit
        """
        logging.log(logging.INFO, "Exiting...")
        exit(0)

    @staticmethod
    def do_quit(_):
        """
        Exits the application.
        Usage: quit
        """
        logging.log(logging.INFO, "Exiting...")
        exit(0)

    def create_new_gcloud_project(self, organization_id_choice=None):
        print("Creating a new GCP project...")
        if organization_id_choice is None:
            use_organization = input("Deploy project to an organization? (y/n): ")
            if use_organization.lower().strip() == "exit":
                return
            if use_organization.lower().strip() == "y":
                organizations = os.popen("gcloud organizations list").read().splitlines()
                org_ids = []
                if len(organizations) > 1:
                    for i, organization in enumerate(organizations):
                        if i > 0:
                            print(f"{i - 1} - {organization}")
                            org_id = organization.replace("\t", " ").replace("  ", " ").split(" ")[1].strip()
                            org_ids.append(org_id)
                else:
                    print("No organizations found.")
                    return
                organization_id = input("Please select organization: ")
                if organization_id.lower().strip() == "exit":
                    return
                try:
                    organization_id_choice = org_ids[int(organization_id.strip())]
                except IndexError:
                    print("Invalid organization id.")
                    return
        print(f"Organization Selected: {organization_id_choice}")
        project_name = input("Please enter a project name: ")
        if project_name.lower().strip() == "exit":
            return
        project_name_confirmation = input("Please confirm project name: ")
        if project_name_confirmation.lower().strip() == "exit":
            return
        if project_name != project_name_confirmation:
            print("Project names do not match.")
            return self.create_new_gcloud_project(organization_id_choice=organization_id_choice)

        if organization_id_choice is None:
            create_response = os.popen(f"gcloud projects create {project_name}", )
        else:
            create_response = os.popen(f"gcloud projects create {project_name} --organization={organization_id_choice}")
        print(create_response.read())
        self.deploy_hasura_to_google()

    def configure_gcloud_vpc(self, network_id="default"):
        print("Configuring VPC using Google Cloud...")
        env_dict = App.load_env_dict_from_json()
        project_id = env_dict.get("GCP_PROJECT_ID", None)
        if project_id is None:
            print("Please configure a GCP project first.")
            return

        if network_id == "default":
            env_dict["GCP_NETWORK_ID"] = network_id
            App.save_env_dict_to_json(env_dict)
        else:
            use_existing_network = input("Use an existing network? (y/n): ")
            if use_existing_network.lower().strip() == "exit":
                return
            if use_existing_network.lower().strip() == "y":
                networks = os.popen(f"gcloud compute networks list --project={project_id}").read().splitlines()
                network_ids = []
                if len(networks) > 1:
                    for i, network in enumerate(networks):
                        if i > 0:
                            print(f"{i - 1} - {network}")
                            network_id = network.replace("\t", " ").replace("  ", " ").split(" ")[0].strip()
                            network_ids.append(network_id)
                else:
                    print("No networks found.")
                    return
                network_id = input("Please select network: ")
                if network_id.lower().strip() == "exit":
                    return
                try:
                    network_id_choice = network_ids[int(network_id.strip())]
                except IndexError:
                    print("Invalid network id.")
                    return
                print(f"Network Selected: {network_id_choice}")
                env_dict["GCP_NETWORK_ID"] = network_id_choice
                App.save_env_dict_to_json(env_dict)
                return
            else:
                network_name = input("Please enter a network name: ")
                if network_name.lower().strip() == "exit":
                    return
                network_name_confirmation = input("Please confirm network name: ")
                if network_name_confirmation.lower().strip() == "exit":
                    return
                if network_name != network_name_confirmation:
                    print("Network names do not match.")
                    return self.configure_gcloud_vpc()
                cmd_log_str = f"gcloud compute networks create {network_name} --subnet-mode=auto --project={project_id}"
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                env_dict["GCP_NETWORK_ID"] = network_name
                App.save_env_dict_to_json(env_dict)
                return

    def create_new_gcloud_database_instance(self, secondary_name=None):
        print("Creating a new Google Cloud SQL Postgresql instance... This may take a few minutes.")
        env_dict = App.load_env_dict_from_json()
        project_id = env_dict.get("GCP_PROJECT_ID", None)
        if project_id is None:
            print("Please configure a GCP project first.")
            return
        if secondary_name is None:
            cmd_log_str = f"gcloud services enable servicenetworking.googleapis.com --project={project_id}"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            cmd_log_str = f"gcloud services enable compute.googleapis.com --project={project_id}"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            self.configure_gcloud_vpc()
            cmd_log_str = f"gcloud services enable sqladmin.googleapis.com --project={project_id}"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            cpu_number = input("Please enter the number of CPUs for the database: ")
            if cpu_number.lower().strip() == "exit":
                return
            cpu_number = str(int(cpu_number.strip()))
            memory = input("Please enter the amount of memory for the database (GiB): ")
            if memory.lower().strip() == "exit":
                return
            memory = f"{str(int(memory.strip()))}GiB"
            default_password = password(30)
            print(f"Default password: {default_password}")
            confirm_creation = input(
                f"Create a new database instance with {cpu_number} CPUs and {memory} memory? (y/n): ")
            zone = input("Please enter a zone (default: us-central1-a): ")
            if zone.lower().strip() == "exit":
                return
            if zone.strip() == "":
                zone = "us-central1-a"
            else:
                zone = zone.strip()
            if confirm_creation.lower().strip() == "exit":
                return
            print("Configuring database... please be patient. Grab a coffee, or write a new command for the CLI. ;)")
            if confirm_creation.lower().strip() == "y":
                env_dict = App.load_env_dict_from_json()
                network_id = env_dict.get("GCP_NETWORK_ID", None)
                if network_id is None:
                    print("Please configure a GCP network first.")
                    return
                cmd_log_str = (f"gcloud compute addresses create google-managed-services-{network_id} "
                               f"--global "
                               f"--purpose=VPC_PEERING "
                               f"--prefix-length=16 "
                               f"--network={network_id} "
                               f"--project={project_id}"
                               )
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                cmd_log_str = (f"gcloud services vpc-peerings connect "
                               f"--service=servicenetworking.googleapis.com "
                               f"--ranges=google-managed-services-{network_id} "
                               f"--network={network_id} "
                               f"--project={project_id}"
                               )
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                cmd_log_str = (
                    f"gcloud beta sql instances create {project_id}-db "
                    f"--project={project_id} "
                    f"--network=projects/{project_id}/global/networks/{network_id} "
                    f"--root-password={default_password} "
                    f"--zone={zone} "
                    f"--cpu={cpu_number} "
                    f"--memory={memory} "
                    f"--database-version=POSTGRES_14 "
                    f"--enable-google-private-path"
                )
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                env_dict["GCP_DATABASE_INSTANCE_ID"] = f"{project_id}-db"
                env_dict["GCP_DATABASE_PASSWORD"] = default_password
                App.save_env_dict_to_json(env_dict)
                self.configure_gcloud_database()
            else:
                return
        else:
            network_id = env_dict.get("GCP_NETWORK_ID", None)
            if network_id is None:
                print("Please configure a GCP network first.")
                return
            cpu_number = input("Please enter the number of CPUs: ")
            if cpu_number.lower().strip() == "exit":
                return
            cpu_number = str(int(cpu_number.strip()))
            memory = input("Please enter the amount of memory (GiB): ")
            if memory.lower().strip() == "exit":
                return
            memory = f"{str(int(memory.strip()))}GiB"
            default_password = password(30)
            print(f"Default password: {default_password}")
            confirm_creation = input(
                f"Create a new database instance with {cpu_number} CPUs and {memory} memory? (y/n): ")
            zone = input("Please enter a zone (default: us-central1-a): ")
            if zone.lower().strip() == "exit":
                return
            if zone.strip() == "":
                zone = "us-central1-a"
            else:
                zone = zone.strip()
            if confirm_creation.lower().strip() == "exit":
                return
            if confirm_creation.lower().strip() == "y":
                cmd_log_str = (
                    f"gcloud beta sql instances create {project_id}-{secondary_name}-db "
                    f"--project={project_id} "
                    f"--network=projects/{project_id}/global/networks/{network_id} "
                    f"--root-password={default_password} "
                    f"--zone={zone} "
                    f"--cpu={cpu_number} "
                    f"--memory={memory} "
                    f"--database-version=POSTGRES_14 "
                    f"--enable-google-private-path"
                )
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                current_databases = env_dict.get("secondary_databases", [])
                secondary_data = {
                    "name": secondary_name,
                    "instance_id": f"{project_id}-{secondary_name}-db",
                    "password": default_password
                }
                current_databases.append(secondary_data)
                App.save_env_dict_to_json(env_dict)
                self.configure_gcloud_database(secondary_data=secondary_data)
            else:
                return

    def configure_gcloud_database(self, secondary_data=None):
        if secondary_data is None:
            print("Configuring database using Google Cloud SQL Postgresql...")
            use_existing_instance = input("Use an existing instance? (y/n): ")
            if use_existing_instance.lower().strip() == "exit":
                return
            if use_existing_instance.lower().strip() == "y":
                instances = os.popen("gcloud sql instances list").read().splitlines()
                instance_ids = []
                instance_datas = {}
                if len(instances) > 1:
                    for i, instance in enumerate(instances):
                        if i > 0:
                            print(f"{i - 1} - {instance}")
                            instance_data = instance.replace("\t", " ").split(" ")
                            instance_data = [x for x in instance_data if x != ""]
                            instance_id = instance_data[0]
                            instance_database_version = instance_data[1]
                            instance_location = instance_data[2]
                            instance_tier = instance_data[3]
                            instance_primary_address = instance_data[4]
                            instance_private_address = instance_data[5]
                            instance_status = instance_data[6]
                            instance_ids.append(instance_id)
                            instance_datas[instance_id] = {
                                "database_version": instance_database_version,
                                "location": instance_location,
                                "tier": instance_tier,
                                "primary_address": instance_primary_address,
                                "private_address": instance_private_address,
                                "status": instance_status
                            }
                    instance_id_choice = input("Please enter the number of the instance you would like to use: ")
                    if instance_id_choice.lower().strip() == "exit":
                        return
                    instance_id_choice = int(instance_id_choice.strip())
                    instance_id = instance_ids[instance_id_choice]
                    env_dict = App.load_env_dict_from_json()
                    env_dict["GCP_DATABASE_INSTANCE_ID"] = instance_id
                    env_dict["GCP_DATABASE_DETAILS"] = instance_datas[instance_id]
                    env_dict["HASURA_GRAPHQL_DATABASE_URL"] = f"postgres://" \
                                                              f"postgres:{env_dict['GCP_DATABASE_PASSWORD']}" \
                                                              f"@/postgres?host=" \
                                                              f"{env_dict['GCP_DATABASE_DETAILS']['private_address']}"
                    admin_secret = password(30)
                    print("Hasura admin secret: " + admin_secret)
                    env_dict["HASURA_GRAPHQL_ADMIN_SECRET"] = admin_secret
                    App.save_env_dict_to_json(env_dict)
            else:
                self.create_new_gcloud_database_instance()
        else:
            instance_name = secondary_data["name"]
            instance_id_passthrough = secondary_data["instance_id"]
            instances = os.popen("gcloud sql instances list").read().splitlines()
            instance_ids = []
            instance_datas = {}
            if len(instances) > 1:
                for i, instance in enumerate(instances):
                    if i > 0:
                        instance_data = instance.replace("\t", " ").split(" ")
                        instance_data = [x for x in instance_data if x != ""]
                        instance_id = instance_data[0]
                        if instance_id == instance_id_passthrough:
                            instance_database_version = instance_data[1]
                            instance_location = instance_data[2]
                            instance_tier = instance_data[3]
                            instance_primary_address = instance_data[4]
                            instance_private_address = instance_data[5]
                            instance_status = instance_data[6]
                            instance_ids.append(instance_id)
                            instance_datas[instance_id] = {
                                "database_version": instance_database_version,
                                "location": instance_location,
                                "tier": instance_tier,
                                "primary_address": instance_primary_address,
                                "private_address": instance_private_address,
                                "status": instance_status
                            }
                env_dict = App.load_env_dict_from_json()
                instance_data = instance_datas[instance_id_passthrough]
                hasura_database_url = f"postgres://postgres:{secondary_data['password']}" \
                                      f"@/postgres?host=" \
                                      f"{instance_data['private_address']}"
                current_databases = env_dict.get("secondary_databases", [])
                new_databases = []
                for database in current_databases:
                    if database["name"] == instance_name:
                        database["HASURA_GRAPHQL_DATABASE_URL"] = hasura_database_url
                        database["instance_data"] = instance_data
                    new_databases.append(database)
                env_dict["secondary_databases"] = new_databases
                App.save_env_dict_to_json(env_dict)
                with open("hasura_metadata.json", "r") as f:
                    metadata = json.load(f)
                metadata["sources"].append(
                    {
                        "name": secondary_data["name"],
                        "kind": "postgres",
                        "tables": [],
                        "configuration": {
                            "connection_info": {
                                "database_url": {
                                    "from_env": f"HASURA_GRAPHQL_DATABASE_URL_{secondary_data['name']}"
                                }
                            }
                        },
                        "isolation_level": "read-committed",
                        "pool_settings": {
                            "connection_lifetime": 600,
                            "idle_timeout": 180,
                            "max_connections": 100,
                            "retries": 1
                        },
                        "use_prepared_statements": True
                    }
                )
                with open("hasura_metadata.json", "w") as f:
                    json.dump(metadata, f)
                self.do_export_hasura_metadata(None)

    @staticmethod
    def configure_gcloud_project():
        env_dict = App.load_env_dict_from_json()
        project_id = env_dict.get("GCP_PROJECT_ID", None)
        if project_id is None:
            print("Please configure a GCP project first.")
            return
        gcp_billing_account = env_dict.get("GCP_BILLING_ACCOUNT", None)
        if gcp_billing_account is None:
            billing_accounts = os.popen("gcloud beta billing accounts list").read().splitlines()
            billing_account_ids = []
            if len(billing_accounts) > 1:
                for i, billing_account in enumerate(billing_accounts):
                    if i > 0:
                        print(f"{i - 1} - {billing_account}")
                        billing_account_id = billing_account.replace("\t", " ").replace("  ", " ").split(" ")[0].strip()
                        billing_account_ids.append(billing_account_id)
            else:
                print("No billing accounts found.")
                return
            billing_account_id = input("Please select billing account: ")
            if billing_account_id.lower().strip() == "exit":
                return
            try:
                billing_account_id_choice = billing_account_ids[int(billing_account_id.strip())]
                env_dict["GCP_BILLING_ACCOUNT"] = billing_account_id_choice
                App.save_env_dict_to_json(env_dict)
            except IndexError:
                print("Invalid billing account id.")
                return
        else:
            billing_account_id_choice = gcp_billing_account
        print(f"Billing Account Selected: {billing_account_id_choice}")
        cmd_log_str = f"gcloud beta billing projects link {project_id} --billing-account={billing_account_id_choice}"
        logging.log(logging.INFO, cmd_log_str)
        os.system(cmd_log_str)

    @staticmethod
    def create_serverless_vpc_connectors():
        cmd_log_str = "gcloud services enable vpcaccess.googleapis.com"
        logging.log(logging.INFO, cmd_log_str)
        os.system(cmd_log_str)
        env_dict = App.load_env_dict_from_json()
        project_id = env_dict.get("GCP_PROJECT_ID", None)
        if project_id is None:
            print("Please configure a GCP project first.")
            return
        vpc_connector = env_dict.get("GCP_VCP_CONNECTOR", None)
        if vpc_connector is None:
            region = env_dict.get("GCP_DATABASE_DETAILS", None)
            if region is None:
                print("Please configure a GCP database instance first.")
                return
            region = "-".join(region["location"].split("-")[:-1])
            cmd_log_str = (f"gcloud compute networks vpc-access connectors create default "
                           f"--network default "
                           f"--region {region} "
                           f"--range 10.8.0.0/28"
                           )
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            env_dict["GCP_VCP_CONNECTOR"] = "default"
            vpc_connector = "default"
            App.save_env_dict_to_json(env_dict)
        print(f"Using VPC connector: {vpc_connector}")

    def deploy_hasura_to_google(self):
        print("Hasura will be deployed to GCP...")
        env_dict = App.load_env_dict_from_json()
        if env_dict.get("gcloud_logged_in", None) is None:
            cmd_log_str = "gcloud auth login"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            env_dict["gcloud_logged_in"] = True
            App.save_env_dict_to_json(env_dict)

        use_existing_project = input("Use an existing project? (y/n): ")
        if use_existing_project.lower().strip() == "exit":
            return
        if use_existing_project.lower().strip() == "y":
            self.do_gcloud_set_project()
            self.configure_gcloud_project()
            self.configure_gcloud_database()
            self.create_serverless_vpc_connectors()
            self.do_deploy_hasura(None)
            self.do_setup(None)
        else:
            self.create_new_gcloud_project()

    def setup_hasura_not_deployed(self):
        for deploy_option in App.DEPLOY_OPTIONS:
            print(f"0 - {deploy_option}")
        deploy_option = input("Please select a deploy option: ")
        if deploy_option.lower().strip() == "exit":
            return
        try:
            option = App.DEPLOY_OPTIONS[int(deploy_option.strip())]
            if option == "Google Cloud Platform":
                self.deploy_hasura_to_google()
        except (ValueError, IndexError):
            logging.log(logging.WARNING, "Invalid option")
            self.setup_hasura_not_deployed()

    @staticmethod
    def setup_firebase():
        print("Setting up Firebase...")
        env_dict = App.load_env_dict_from_json()
        cmd_log_str = f"gcloud services enable identitytoolkit.googleapis.com " \
                      f"--project={env_dict['GCP_PROJECT_ID']}"
        logging.log(logging.INFO, cmd_log_str)
        os.system(cmd_log_str)
        cmd_log_str = f"firebase projects:addfirebase {env_dict['GCP_PROJECT_ID']}"
        logging.log(logging.INFO, cmd_log_str)
        os.system(cmd_log_str)
        cmd_log_str = "firebase login --interactive"
        logging.log(logging.INFO, cmd_log_str)
        os.system(cmd_log_str)
        env_updates = {}
        if os.path.isdir("firebase"):
            os.chdir("firebase")
        else:
            os.mkdir("firebase")
            os.chdir("firebase")

            print("Use JavaScript, NOT TypeScript. You can change this later.")
            print("Do not enable linting!!")
            print("Do not npm install!!")
            input("Press enter when ready to continue.")
            cmd_log_str = f"firebase init functions --project={env_dict['GCP_PROJECT_ID']}"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            with open("functions/index.js", "w") as f:
                f.write(App.FIREBASE_INDEX.replace("HASURA_ROOT_URL", env_dict["HASURA_ROOT_URL"]).replace(
                    "HASURA_GRAPHQL_ADMIN_SECRET", env_dict["HASURA_GRAPHQL_ADMIN_SECRET"]))

            with open("functions/package.json", "r") as f:
                package_lines = f.readlines()
            new_package_lines = []
            ready_flag = False
            for line in package_lines:
                if ready_flag and not line.endswith(",\n"):
                    new_package_lines.append('    "graphql-request": "^5.0.0",\n')
                    ready_flag = False
                if '"dependencies"' in line:
                    ready_flag = True
                new_package_lines.append(line)
            with open("functions/package.json", "w") as f:
                f.writelines(new_package_lines)

            if env_dict.get("GCP_ADMIN_SERVICE_ACCOUNT", None) is None:
                service_account_name = f"{env_dict['GCP_PROJECT_ID']}admin"
                cmd_log_str = f"gcloud iam service-accounts create {service_account_name} " \
                              f"--project={env_dict['GCP_PROJECT_ID']} " \
                              f"--display-name=admin"
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                service_account_email = f"{env_dict['GCP_PROJECT_ID']}admin@{env_dict['GCP_PROJECT_ID']}" \
                                        f".iam.gserviceaccount.com"
                # Add cloud run invoker and firebase admin roles
                cmd_log_str = f"gcloud projects add-iam-policy-binding {env_dict['GCP_PROJECT_ID']} " \
                              f"--member=serviceAccount:{service_account_email} " \
                              f"--role=roles/run.admin"
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                cmd_log_str = f"gcloud projects add-iam-policy-binding {env_dict['GCP_PROJECT_ID']} " \
                              f"--member=serviceAccount:{service_account_email} " \
                              f"--role=roles/firebase.admin"
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                # Add the cloudbuild.builds.builder
                cmd_log_str = f"gcloud projects add-iam-policy-binding {env_dict['GCP_PROJECT_ID']} " \
                              f"--member=serviceAccount:{service_account_email} " \
                              f"--role=roles/cloudbuild.builds.builder"
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                # Add the firebaseauth.admin role
                cmd_log_str = f"gcloud projects add-iam-policy-binding {env_dict['GCP_PROJECT_ID']} " \
                              f"--member=serviceAccount:{service_account_email} " \
                              f"--role=roles/firebaseauth.admin"
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                cmd_str = f"gcloud iam service-accounts keys create admin.json " \
                          f"--iam-account={service_account_email}"
                logging.log(logging.INFO, cmd_str)
                os.system(cmd_str)
                env_updates["GCP_ADMIN_SERVICE_ACCOUNT"] = service_account_email
                env_updates["GCP_ADMIN_SERVICE_ACCOUNT_NAME"] = service_account_name
            else:
                service_account_email = env_dict["GCP_ADMIN_SERVICE_ACCOUNT"]
                service_account_name = env_dict["GCP_ADMIN_SERVICE_ACCOUNT_NAME"]

            print(f"Activating service account: {service_account_email} -> {service_account_name}")
            cmd_str = f"gcloud auth activate-service-account --key-file=admin.json {service_account_email}"
            print(cmd_str)
            os.system(cmd_str)
            auth_token = os.popen("gcloud auth print-access-token").read().strip()
            curl_command = f"curl -X POST -H 'Authorization:Bearer {auth_token}' -H 'Content-Type:application/json' " \
                           f"'https://identitytoolkit.googleapis.com/v2/projects" \
                           f"/{env_dict['GCP_PROJECT_ID']}/identityPlatform:initializeAuth'"
            response = os.popen(curl_command).read()
            print(response)
            curl_command = f"curl -H 'Authorization:Bearer {auth_token}' -H 'Content-Type:application/json' " \
                           f"'https://identitytoolkit.googleapis.com/admin/v2/projects" \
                           f"/{env_dict['GCP_PROJECT_ID']}/config'"
            curl_response = os.popen(curl_command).read()
            response = json.loads(curl_response)
            print(response)
            body_data = {
                "authorizedDomains": [
                    "localhost",
                    f"{env_dict['GCP_PROJECT_ID']}.firebaseapp.com",
                    f"{env_dict['GCP_PROJECT_ID']}.web.app"
                ],
                "signIn": {
                    "phoneNumber": {
                        "enabled": True,
                        "testPhoneNumbers": {
                            "+15555215551": "000001",
                            "+15555215552": "000002"
                        }
                    },
                    "email": {
                        "enabled": False,
                        "passwordRequired": False
                    },
                    "anonymous": {
                        "enabled": False
                    },
                    "allowDuplicateEmails": False
                }
            }
            curl_command = f"curl -X PATCH " \
                           f"-H 'Authorization:Bearer {auth_token}' " \
                           f"-H 'Content-Type:application/json' " \
                           f"'https://identitytoolkit.googleapis.com/admin/v2/projects" \
                           f"/{env_dict['GCP_PROJECT_ID']}/config?updateMask=Config.authorizedDomains," \
                           f"Config.signIn.email,Config.signIn.phoneNumber,Config.signIn.anonymous," \
                           f"Config.signIn.allowDuplicateEmails' " \
                           f"-d '{json.dumps(body_data)}'"
            response = os.popen(curl_command).read()
            print(response)
            print(f"Please enable phone sign in for the firebase project: "
                  f"https://console.firebase.google.com/project/{env_dict['GCP_PROJECT_ID']}/authentication/providers")
            done = input("Press enter when done.")
            if done.lower().strip() == "exit":
                return
            cmd_log_str = "gcloud auth login"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            cmd_log_str = "firebase deploy --only functions --force"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
        os.chdir("../../..")
        current_env = App.load_env_dict_from_json()
        App.save_env_dict_to_json({
            **current_env,
            **env_updates
        })

    def setup_hasura_deployed(self):
        services = os.popen("gcloud run services list").read()
        service_ids = []
        service_datas = {}
        for i, service in enumerate(services.splitlines()):
            if i == 0:
                continue
            service_data = service.split()
            service_data = [x for x in service_data if x != ""]
            service_id = service_data[1]
            service_url = service_data[3]
            print(f"{i - 1} - {service_id} ({service_url})")
            service_ids.append(service_id)
            service_datas[service_id] = {
                "service_id": service_id,
                "service_url": service_url
            }
        service_id = input("Please select a service: ")
        if service_id.lower().strip() == "exit":
            return
        env_dict = App.load_env_dict_from_json()
        try:
            service_id = service_ids[int(service_id.strip())]
            print(service_id)
            env_dict["HASURA_SERVICE_NAME"] = service_id
            env_dict["HASURA_ROOT_URL"] = service_datas[service_id]["service_url"]
            hasura_metadata_url = f"{env_dict['HASURA_ROOT_URL']}/v1/metadata"
            env_dict["HASURA_GRAPHQL_METADATA_URL"] = hasura_metadata_url
            App.save_env_dict_to_json(env_dict)
        except IndexError:
            print("Invalid service id.")
            return
        print(f"Service Selected: {service_id}")

        selected_auth = None
        for auth_option in App.AUTH_PROVIDERS:
            print(f"0 - {auth_option}")
        auth_option = input("Please select an auth option: ")
        if auth_option.lower().strip() == "exit":
            return
        try:
            selected_auth = App.AUTH_PROVIDERS[int(auth_option.strip())]
        except (ValueError, IndexError):
            logging.log(logging.WARNING, "Invalid option")
            self.setup_hasura_deployed()

        if selected_auth == "Firebase":
            self.setup_firebase()

        jwt_config = """{
  "type": "RS256",
  "jwk_url": "https://www.googleapis.com/service_accounts/v1/jwk/securetoken@system.gserviceaccount.com",
  "audience": "PROJECT_ID",
  "issuer": "https://securetoken.google.com/PROJECT_ID"
}""".replace("PROJECT_ID", env_dict["GCP_PROJECT_ID"])
        env_dict["HASURA_GRAPHQL_JWT_SECRET"] = jwt_config
        App.save_env_dict_to_json(env_dict)
        print("Finishing Autodeployer...")
        self.do_deploy_hasura(None)
        ip_address = os.popen("curl ifconfig.me").read().strip()
        cmd_log_str = (f"gcloud sql instances patch {env_dict['GCP_DATABASE_INSTANCE_ID']} "
                       f"--authorized-networks={ip_address}")
        logging.log(logging.INFO, cmd_log_str)
        os.system(cmd_log_str)
        db_string = """create table if not exists "user"
(
    user_id    text                     default gen_random_uuid() not null,
    user_phone text                                               not null,
    role       text                     default 'user'::text      not null,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
    primary key (user_id),
    unique (user_phone)
);"""
        conn = self.get_connection()
        cursor = conn.cursor()
        cursor.execute(db_string)
        conn.commit()
        conn.close()
        self.do_import_hasura_metadata(None)
        with open("hasura_metadata.json", "r") as f:
            metadata = json.load(f)
        metadata["sources"][0]["tables"] = [
            {
                "table": {
                    "name": "user",
                    "schema": "public"
                }
            }
        ]
        with open("hasura_metadata.json", "w") as f:
            json.dump(metadata, f)
        self.do_export_hasura_metadata(None)
        print("Autodeployer Finished.")

    @staticmethod
    def do_gcloud_set_project(project_id=""):
        """Change the active project for the current session."""
        if project_id == "":
            project_id_choice = None
        else:
            project_id_choice = project_id

        projects = os.popen("gcloud projects list").read().splitlines()
        project_ids = []
        if len(projects) > 1:
            for i, project in enumerate(projects):
                if i > 0:
                    if project_id_choice is None:
                        print(f"{i - 1} - {project}")
                    proj_id = project.replace("\t", " ").replace("  ", " ").split(" ")[0].strip()
                    project_ids.append(proj_id)
        else:
            print("No projects found.")
            return
        if project_id_choice is None:
            project_id = input("Please select project: ")
            if project_id.lower().strip() == "exit":
                return
            try:
                project_id_choice = project_ids[int(project_id.strip())]
            except IndexError:
                print("Invalid project id.")
                return
        print(f"Project Selected: {project_id_choice}")
        cmd_log_str = f"gcloud config set project {project_id_choice}"
        logging.log(logging.INFO, cmd_log_str)
        os.system(cmd_log_str)
        env_dict = App.load_env_dict_from_json()
        if env_dict.get("GCP_PROJECT_ID", None) != project_id_choice:
            env_dict["GCP_PROJECT_ID"] = project_id_choice
            App.save_env_dict_to_json(env_dict)

    # TODO: FIX AUTODEPLOYER AND SPLIT OFF
    @staticmethod
    def do_deploy_hasura(_):
        """Redeploys the hasura instance to gcloud. Updates environment variables."""
        print("Deploying Hasura")
        env_dict = App.load_env_dict_from_json()
        cmd_log_str = f"gcloud config set project {env_dict['GCP_PROJECT_ID']}"
        logging.log(logging.INFO, cmd_log_str)
        os.system(cmd_log_str)
        if os.path.isdir("hasura"):
            os.chdir("hasura")
        else:
            os.mkdir("hasura")
            os.chdir("hasura")
            cmd_log_str = f"gcloud services enable run.googleapis.com --project={env_dict['GCP_PROJECT_ID']}"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            account_id = None
            if env_dict.get("GCLOUD_SERVICE_ACCOUNT", None) is None:
                account_choices = os.popen("gcloud iam service-accounts list").read().splitlines()
                for i, account in enumerate(account_choices):
                    if "Compute Engine default service account" in account:
                        account_id = account.replace("Compute Engine default service account",
                                                     "").strip().split(" ")[0].strip()
                        break
                cmd_log_str = (f"gcloud projects add-iam-policy-binding {env_dict['GCP_PROJECT_ID']} "
                               f"--member=serviceAccount:{account_id} "
                               f"--role=roles/cloudbuild.builds.builder"
                               )
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                env_dict["GCLOUD_SERVICE_ACCOUNT"] = account_id
                App.save_env_dict_to_json(env_dict)
            cmd_log_str = "docker pull --platform=linux/amd64 hasura/graphql-engine:latest"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            cmd_log_str = f"docker tag hasura/graphql-engine:latest gcr.io/{env_dict['GCP_PROJECT_ID']}/hasura:latest"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
            cmd_log_str = f"docker push gcr.io/{env_dict['GCP_PROJECT_ID']}/hasura:latest"
            logging.log(logging.INFO, cmd_log_str)
            os.system(cmd_log_str)
        template_env = f"""HASURA_GRAPHQL_CORS_DOMAIN: '*'
HASURA_GRAPHQL_ENABLED_CORS: 'true'
HASURA_GRAPHQL_ENABLE_CONSOLE: 'true'"""
        secondaries = env_dict.get("secondary_databases", [])
        for i, secondary in enumerate(secondaries):
            template_env += f"\nHASURA_GRAPHQL_DATABASE_URL_{secondary['name']}: " \
                            f"{secondary['HASURA_GRAPHQL_DATABASE_URL']}"
        env_vars = env_dict.get("env_vars", [])
        for i, env_var in enumerate(env_vars):
            template_env += f"\n{env_var['key']}: '{env_var['value']}'"
        if env_dict.get("HASURA_GRAPHQL_ADMIN_SECRET", None) is not None:
            template_env += f"\nHASURA_GRAPHQL_ADMIN_SECRET: '{env_dict['HASURA_GRAPHQL_ADMIN_SECRET']}'"
        if env_dict.get("HASURA_GRAPHQL_DATABASE_URL", None) is not None:
            template_env += f"\nHASURA_GRAPHQL_DATABASE_URL: '{env_dict['HASURA_GRAPHQL_DATABASE_URL']}'"
        if env_dict.get("HASURA_GRAPHQL_JWT_SECRET", None) is not None:
            template_env += f"\nHASURA_GRAPHQL_JWT_SECRET: '{env_dict['HASURA_GRAPHQL_JWT_SECRET']}'"
        with open("env.yaml", "w") as f:
            f.write(template_env)
        deploy_command = (f"gcloud run deploy hasura "
                          f"--image=gcr.io/{env_dict['GCP_PROJECT_ID']}/hasura:latest "
                          f"--env-vars-file=env.yaml "
                          f"--min-instances=1 "
                          f"--max-instances=10 "
                          f"--cpu=1 "
                          f"--memory=2048Mi "
                          f"--vpc-connector={env_dict['GCP_VCP_CONNECTOR']} "
                          f"--port=8080 "
                          f"--command='graphql-engine' "
                          f"--args='serve' "
                          f"--timeout=600s "
                          f"--platform=managed "
                          f"--allow-unauthenticated "
                          f"--no-cpu-throttling")
        print(deploy_command)
        os.system(deploy_command)
        os.chdir("../../..")

    @staticmethod
    def do_set_hasura_admin_secret(arg):
        """
        Sets the hasura admin secret.
        Usage: set_hasura_admin_secret <secret>
        Example: set_hasura_admin_secret ****
        """
        if len(arg) == 0:
            logging.log(logging.WARNING, "Please provide a secret")
            return
        env_dict = App.load_env_dict_from_json()
        env_dict["HASURA_GRAPHQL_ADMIN_SECRET"] = arg
        App.save_env_dict_to_json(env_dict)
        logging.log(logging.INFO,
                    f"Hasura admin secret set to {arg[0:4]}****"
                    f"{arg[-4:]}. Environment Variable: HASURA_GRAPHQL_ADMIN_SECRET")

    @staticmethod
    def do_set_hasura_metadata_url(arg):
        """
        Sets the hasura metadata url.
        Usage: set_hasura_metadata_url <url>
        Example: set_hasura_metadata_url https://localhost:8080/v1/metadata
        """
        if len(arg) == 0:
            logging.log(logging.WARNING, "Please provide a url")
            return
        env_dict = App.load_env_dict_from_json()
        env_dict["HASURA_GRAPHQL_METADATA_URL"] = arg
        os.environ["HASURA_GRAPHQL_METADATA_URL"] = arg
        App.save_env_dict_to_json(env_dict)
        logging.log(logging.INFO,
                    f"Hasura metadata url set to {arg}. Environment Variable: HASURA_GRAPHQL_METADATA_URL")

    @staticmethod
    def do_import_hasura_metadata(_):
        """
        Imports the metadata from the hasura metadata url.
        Usage: import
        """
        env_dict = App.load_env_dict_from_json()
        hasura_url = env_dict.get("HASURA_GRAPHQL_METADATA_URL")
        if hasura_url is None:
            logging.log(logging.WARNING, "Please set the hasura url first")
            return
        hasura_admin_secret = env_dict.get("HASURA_GRAPHQL_ADMIN_SECRET")
        if hasura_admin_secret is None:
            logging.log(logging.WARNING, "Please set the hasura admin secret first")
            return
        cmd = f"""curl -d'{{"type": "export_metadata", "args": {{}}}}' {hasura_url} -H "X-Hasura-Admin-Secret: {
        hasura_admin_secret}" -o hasura_metadata.json"""
        print(cmd)
        os.system(cmd)

    @staticmethod
    def do_export_hasura_metadata(_):
        """
        Exports the metadata to the hasura metadata url.
        """
        env_dict = App.load_env_dict_from_json()
        hasura_url = env_dict.get("HASURA_GRAPHQL_METADATA_URL")
        if hasura_url is None:
            logging.log(logging.WARNING, "Please set the hasura url first")
            return
        hasura_admin_secret = env_dict.get("HASURA_GRAPHQL_ADMIN_SECRET")
        if hasura_admin_secret is None:
            logging.log(logging.WARNING, "Please set the hasura admin secret first")
            return
        with open("hasura_metadata.json", "r") as f:
            json_data = json.load(f)
        json_data = json.dumps(json_data)
        cmd = f"""curl -d'{{"type": "replace_metadata", "args": {json_data}}}' {hasura_url} -H """ + \
              f'''"X-Hasura-Admin-Secret: {hasura_admin_secret}"'''
        response = os.popen(cmd).read()
        print(response)

    @staticmethod
    def do_show_env(_):
        """
        Shows the environment variables.
        Usage: show_env
        """
        env_dict = App.load_env_dict_from_json()
        print(env_dict)

    def do_setup(self, _):
        """Automagically build and deploy Hasura with no rate limits and baked in phone Auth."""
        is_hasura_deployed = input("Is Hasura already deployed? (y/n): ")
        if is_hasura_deployed.lower().strip() in ["y", "yes"]:
            self.setup_hasura_deployed()
        else:
            print("Hasura AutoDeployer Started... (exit to cancel)")
            self.setup_hasura_not_deployed()

    def do_add_database(self, secondary_name="secondary"):
        """Adds a database to the project"""
        if len(secondary_name) < 3:
            print("The database name must be at least 3 characters long")
            return
        self.create_new_gcloud_database_instance(secondary_name)

    @staticmethod
    def router_generator(data):
        """Generates a router for the current microservice"""

        def collect_types(object_data, custom_type="object"):
            root_type = {}
            custom_name = object_data.get("name")
            root_type[custom_name] = {
                "name": custom_name,
                "fields": {},
                "required_objects": set(),
                "custom_type": custom_type
            }
            default_types = ["String", "Int", "Float", "Boolean", "ID"]
            for field in object_data.get("fields", []):
                is_list = False
                is_object = False
                is_optional = True
                field_collect_type = field.get("type", {})
                if field_collect_type[0] == "[" and field_collect_type[-1] == "]":
                    field_collect_type = field_collect_type[1:-1]
                    is_list = True
                if field_collect_type[-1] == "!":
                    field_collect_type = field_collect_type[:-1]
                    is_optional = False
                if field_collect_type not in default_types:
                    is_object = True

                root_type[custom_name]["fields"][field.get("name")] = {
                    "type": field_collect_type,
                    "is_list": is_list,
                    "is_object": is_object,
                    "is_optional": is_optional,
                }
                if is_object:
                    root_type[custom_name]["required_objects"].add(field_collect_type)
            return root_type

        unordered_custom_objects = []
        for custom_object in data.get("custom_types", {}).get("objects", []):
            types = collect_types(custom_object)
            unordered_custom_objects.append(types)

        unordered_custom_input_objects = []
        for custom_input_object in data.get("custom_types", {}).get("input_objects", []):
            types = collect_types(custom_input_object)
            unordered_custom_input_objects.append(types)

        ordered_objects_handled = set()
        ordered_custom_objects = []
        loop_count = 0
        # At most, we will have to loop through the list of custom objects as many times as there are custom objects
        # This would be worst case if every object was nested in another object
        while len(unordered_custom_objects) != len(ordered_custom_objects) and loop_count < len(
                unordered_custom_objects) + 1:
            loop_count += 1
            for custom_object in unordered_custom_objects:
                assert len(custom_object) == 1
                custom_object_name = list(custom_object.keys())[0]
                if custom_object_name in ordered_objects_handled:
                    continue
                else:
                    required_objects = custom_object[custom_object_name]["required_objects"]
                    if required_objects.issubset(ordered_objects_handled):
                        ordered_custom_objects.append(custom_object)
                        ordered_objects_handled.add(custom_object_name)
                    else:
                        continue

        ordered_input_objects_handled = set()
        ordered_custom_input_objects = []
        loop_count = 0
        # At most, we will have to loop through the list of custom objects as many times as there are custom objects
        # This would be worst case if every object was nested in another object
        while len(unordered_custom_input_objects) != len(ordered_custom_input_objects) and loop_count < len(
                unordered_custom_input_objects) + 1:
            loop_count += 1
            for custom_input_object in unordered_custom_input_objects:
                assert len(custom_input_object) == 1
                custom_input_object_name = list(custom_input_object.keys())[0]
                if custom_input_object_name in ordered_input_objects_handled:
                    continue
                else:
                    required_objects = custom_input_object[custom_input_object_name]["required_objects"]
                    if required_objects.issubset(ordered_input_objects_handled):
                        ordered_custom_input_objects.append(custom_input_object)
                        ordered_input_objects_handled.add(custom_input_object_name)
                    else:
                        continue
        base_models_template = """from typing import List, Optional
from pydantic import BaseModel

        """

        object_template = """\nclass {name}(BaseModel):\n    {fields}{config}\n"""
        field_template = "{}: {}"
        config_template = '\n\n    class Config:\n        schema_extra = {extra}'
        config_extra_start = '{"example": {'
        config_extra_middle_piece = '{field_pieces}'
        config_extra_end = "}}"
        config_field_template = '"{field_name}": {field_default}'
        field_type_map = {
            "String": "str",
            "Int": "int",
            "Float": "float",
            "Boolean": "bool",
            "ID": "str"
        }
        default_field_types = {
            "str": '"string"',
            "int": "0",
            "float": "0.0",
            "bool": "True"
        }
        for custom_object in ordered_custom_objects:
            assert len(custom_object) == 1
            custom_object_name = list(custom_object.keys())[0]
            custom_object_data = custom_object[custom_object_name]
            fields = []
            config_fields = []
            for field_name, field_data in custom_object_data["fields"].items():
                field_type = field_data["type"]
                if field_type in field_type_map:
                    field_type = field_type_map[field_type]
                if field_data["is_list"]:
                    field_type = f"List[{field_type}]"
                if field_data["is_optional"]:
                    field_type = f"{field_type} | None = None"
                if field_data["is_optional"]:
                    config_fields.append(config_field_template.format(field_name=field_name, field_default="None"))
                elif field_data["is_list"]:
                    config_fields.append(config_field_template.format(field_name=field_name, field_default="[]"))
                else:
                    config_fields.append(
                        config_field_template.format(field_name=field_name,
                                                     field_default=default_field_types[field_type]))
                fields.append(field_template.format(field_name, field_type))
            if len(config_fields) > 0:
                config_extra = config_extra_start + \
                               config_extra_middle_piece.format(field_pieces=", ".join(config_fields)) + \
                               config_extra_end
                base_models_template += object_template.format(name=custom_object_name,
                                                               fields="\n    ".join(fields),
                                                               config=config_template.format(extra=config_extra) if len(
                                                                   config_fields) > 0 else "")
            else:
                base_models_template += object_template.format(name=custom_object_name,
                                                               fields="\n    ".join(fields),
                                                               config="")
            base_models_template += "\n"

        for custom_input_object in ordered_custom_input_objects:
            assert len(custom_input_object) == 1
            custom_input_object_name = list(custom_input_object.keys())[0]
            custom_input_object_data = custom_input_object[custom_input_object_name]
            fields = []
            config_fields = []
            for field_name, field_data in custom_input_object_data["fields"].items():
                field_type = field_data["type"]
                if field_type in field_type_map:
                    field_type = field_type_map[field_type]
                if field_data["is_list"]:
                    field_type = f"List[{field_type}]"
                if field_data["is_optional"]:
                    field_type = f"{field_type} | None = None"
                if field_data["is_optional"]:
                    config_fields.append(config_field_template.format(field_name=field_name, field_default="None"))
                elif field_data["is_list"]:
                    config_fields.append(config_field_template.format(field_name=field_name, field_default="[]"))
                else:
                    config_fields.append(
                        config_field_template.format(field_name=field_name,
                                                     field_default=default_field_types[field_type]))
                fields.append(field_template.format(field_name, field_type))
            if len(config_fields) > 0:
                config_extra = config_extra_start + \
                               config_extra_middle_piece.format(field_pieces=", ".join(config_fields)) + \
                               config_extra_end
                base_models_template += object_template.format(name=custom_input_object_name,
                                                               fields="\n    ".join(fields),
                                                               config=config_template.format(extra=config_extra) if len(
                                                                   config_fields) > 0 else "")
            else:
                base_models_template += object_template.format(name=custom_input_object_name,
                                                               fields="\n    ".join(fields),
                                                               config="")
            base_models_template += "\n"

        base_models_template = base_models_template.rstrip("\n")
        base_models_template += "\n"
        with open("generated_types.py", "w") as f:
            f.write(base_models_template)

    def do_router_generator(self, _):
        """Regenerates the routers"""
        with open("hasura_metadata.json", "r") as f:
            metadata = json.load(f)
        self.router_generator(metadata)

    def do_add_microservice(self, microservice_name):
        """Adds a microservice to the project that can attach actions and events to Hasura."""
        if len(microservice_name) < 3:
            print("The microservice name must be at least 3 characters long")
            return
        # If the directory exists
        if os.path.isdir("microservices"):
            print("The microservices directory already exists. Skipping creation.")
        else:
            os.mkdir("microservices")
        if os.path.isdir(f"microservices/{microservice_name}"):
            print(f"The microservice {microservice_name} already exists. Skipping creation.")
            return
        else:
            os.mkdir(f"microservices/{microservice_name}")
            os.chdir(f"microservices/{microservice_name}")
            with open("app.py", "w") as f:
                f.write(App.APP_PY)
            env_dict = App.load_env_dict_from_json()
            project_id = env_dict['GCP_PROJECT_ID']
            hasura_graphql_admin_secret = env_dict['HASURA_GRAPHQL_ADMIN_SECRET']
            hasura_graphql_url_root = f"{env_dict['HASURA_ROOT_URL']}/v1/graphql"
            fastapi_event_secret = env_dict.get('FASTAPI_EVENT_SECRET', None)
            if fastapi_event_secret is None:
                fastapi_event_secret = password(30)
                # Enable secret manager
                cmd_log_str = f"gcloud services enable secretmanager.googleapis.com --project {project_id}"
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                # Create the secret
                with open('secret', 'w') as f:
                    f.write(hasura_graphql_admin_secret)
                cmd_log_str = (
                    f"gcloud secrets create HASURA_GRAPHQL_ADMIN_SECRET --project {project_id} --data-file=secret")
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                with open('secret', 'w') as f:
                    f.write(hasura_graphql_url_root)
                cmd_log_str = (
                    f"gcloud secrets create HASURA_GRAPHQL_URL_ROOT --project {project_id} --data-file=secret")
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                with open('secret', 'w') as f:
                    f.write(fastapi_event_secret)
                cmd_log_str = f"gcloud secrets create FASTAPI_EVENT_SECRET --project {project_id} --data-file=secret"
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                os.chdir("../../../..")
                with open('firebase/firebase-adminsdk.json', 'r') as f:
                    firebase_adminsdk_json = json.load(f)
                os.chdir(f"microservices/{microservice_name}")
                with open('secret', 'w') as f:
                    f.write(json.dumps(firebase_adminsdk_json))
                cmd_log_str = (
                    f"gcloud secrets create BACKEND_FIREBASE_SERVICE_ACCOUNT --project {project_id} --data-file=secret")
                logging.log(logging.INFO, cmd_log_str)
                os.system(cmd_log_str)
                env_dict = App.load_env_dict_from_json()
                env_dict["FASTAPI_EVENT_SECRET"] = fastapi_event_secret
                os.chdir("../../../..")
                App.save_env_dict_to_json(env_dict)
                os.chdir(f"microservices/{microservice_name}")
                os.remove("secret")

            # Create the docker file
            with open('Dockerfile', 'w') as f:
                f.write(App.DOCKER_FILE)

            with open("app_secrets.py", "w") as f:
                f.write(App.APP_SECRETS.replace("YOUR_PROJECT_ID", project_id))

            # Create the requirements file
            with open('requirements.txt', 'w') as f:
                f.write(App.REQUIREMENTS_TEXT)

            with open("security.py", "w") as f:
                f.write(App.SECURITY_PY)

            os.chdir("../../../..")
            with open("hasura_metadata.json", "r") as f:
                hasura_metadata = json.load(f)
            hasura_metadata["custom_types"] = App.MICROSERVICE_DEFAULT_TYPES.get("custom_types", {})
            backend_url_key = f"{microservice_name}_BACKEND_URL"
            action_data = App.ACTION_DEFAULT_TYPES.replace("FASTAPI_BACKEND_URL", backend_url_key)
            action_data = json.loads(action_data)
            hasura_metadata["actions"] = action_data.get("actions", {})
            with open("hasura_metadata.json", "w") as f:
                json.dump(hasura_metadata, f)
            os.chdir(f"microservices/{microservice_name}")
            App.router_generator(hasura_metadata)
            if not os.path.isdir("enums"):
                os.mkdir("enums")

            if not os.path.isfile("enums/__init__.py"):
                with open("enums/__init__.py", "w") as f:
                    f.write(App.ENUMS_TEMPLATE)
            if not os.path.isdir("actions"):
                os.mkdir("actions")
            init_text = ""
            routers = []
            for action in hasura_metadata["actions"]:
                init_text += f"from actions.{action['name']} import {action['name']}_router\n"
                routers.append(f"{action['name']}_router")
                print(action)
                url_route = action["definition"]["request_transform"]["url"].replace("{{$base_url}}", "")
                action_template = App.ACTION_TEMPLATE
                action_template = action_template.replace("/base_generator_mutation/", url_route)
                action_template = action_template.replace("base_generator_mutation", action["name"])
                camel_case = "".join([x.capitalize() for x in action["name"].split("_")])
                action_template = action_template.replace("BaseGeneratorMutation", camel_case)
                with open(f"actions/{action['name']}.py", "w") as f:
                    f.write(action_template)
            init_text += "\n"

            init_text += f"action_routers = {routers}\n"
            if not os.path.isfile("actions/__init__.py"):
                with open("actions/__init__.py", "w") as f:
                    f.write(init_text)

            if not os.path.isdir("events"):
                os.mkdir("events")
                with open("events/__init__.py", "w") as f:
                    f.write("event_routers = []\n")
        cmd_log_str = f"gcloud run deploy {microservice_name} --source ."
        logging.log(logging.INFO, cmd_log_str)
        os.system(cmd_log_str)
        services = os.popen("gcloud run services list").read()
        service_url = None
        for i, service in enumerate(services.splitlines()):
            if i == 0:
                continue
            service_data = service.split()
            service_data = [x for x in service_data if x != ""]
            service_id = service_data[1]
            if service_id == microservice_name:
                service_url = service_data[3]
        os.chdir("../../../..")
        env_dict = App.load_env_dict_from_json()
        env_vars = env_dict.get("env_vars", [])
        env_vars.append({"key": backend_url_key, "value": service_url})
        env_dict["env_vars"] = env_vars
        App.save_env_dict_to_json(env_dict)
        self.do_deploy_hasura(None)
        self.do_export_hasura_metadata(None)

    def do_add_flutter(self, _):
        """Adds a flutter app to the project"""
        pass


def cli():
    app = App()
    app.cmdloop()
