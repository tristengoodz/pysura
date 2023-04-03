import firebase_admin
from firebase_admin import credentials, initialize_app, auth, App
from firebase_admin.auth import InvalidIdTokenError, ExpiredIdTokenError, RevokedIdTokenError, CertificateFetchError, \
    UserDisabledError
from fastapi.security import APIKeyHeader
from fastapi import Request
import json
from google.oauth2 import service_account
from fastapi import Depends, HTTPException, status
import google.cloud.logging
import logging

from pydantic import BaseModel
from starlette.datastructures import Headers
from typing import List, Any
from pysura.faster_api.models import UserIdentity
from python_graphql_client import GraphqlClient
from google.cloud import storage as google_storage

try:
    from app_secrets import HASURA_FIREBASE_SERVICE_ACCOUNT, HASURA_EVENT_SECRET, HASURA_GRAPHQL_URL_ROOT, \
        HASURA_GRAPHQL_ADMIN_SECRET
except ImportError:
    HASURA_FIREBASE_SERVICE_ACCOUNT = ""
    HASURA_EVENT_SECRET = ""
    HASURA_GRAPHQL_URL_ROOT = ""
    HASURA_GRAPHQL_ADMIN_SECRET = ""

cred_dict = json.loads(HASURA_FIREBASE_SERVICE_ACCOUNT, strict=False)
creds = service_account.Credentials.from_service_account_info(cred_dict)
try:
    firebase_app = firebase_admin.get_app()
except ValueError:
    logging_client = google.cloud.logging.Client(credentials=creds)
    logging_client.setup_logging()
    firebase_app = initialize_app(credential=credentials.Certificate(cred_dict))


def get_storage_client():
    return google_storage.Client(project=cred_dict['project_id'], credentials=creds)


async def security_injection_middleware(request: Request, call_next):
    request_event_secret = request.headers.get("hasura_event_secret", None)
    event_secret_valid = request_event_secret == HASURA_EVENT_SECRET
    request_jwt_token = request.headers.get("authorization", None)
    jwt_token_valid = False
    user_identity = None
    if isinstance(request_jwt_token, str) and "Bearer " in request_jwt_token:
        request_jwt_token = request_jwt_token.replace("Bearer ", "")
        try:
            decoded_token = auth.verify_id_token(request_jwt_token, app=firebase_app)
            jwt_token_valid = True
            claims = decoded_token.get("https://hasura.io/jwt/claims", None)
            hasura_allowed_roles = None
            default_role = None
            user_id = None
            if isinstance(claims, dict):
                hasura_allowed_roles = claims.get("x-hasura-allowed-roles", None)
                default_role = claims.get("x-hasura-default-role", None)
                user_id = claims.get("x-hasura-user-id", None)
            user_identity_dict = {
                "token": "Bearer " + request_jwt_token,
                "role": default_role,
                "user_id": user_id,
                "allowed_roles": hasura_allowed_roles,
                "phone_number": decoded_token.get("phone_number", None),
                "email": decoded_token.get("email", None),
                "iss": decoded_token.get("iss", None),
                "aud": decoded_token.get("aud", None),
                "iat": decoded_token.get("iat", None),
                "exp": decoded_token.get("exp", None),
                "auth_time": decoded_token.get("auth_time", None),
                "sub": decoded_token.get("sub", None)
            }
            user_identity = UserIdentity(**user_identity_dict)
        except (ValueError, ExpiredIdTokenError, RevokedIdTokenError, InvalidIdTokenError, CertificateFetchError,
                UserDisabledError):
            pass
        except Exception as e:
            logging.log(logging.ERROR, e)
    append_headers = json.loads(json.dumps({
        "x-event-secret-valid": str(event_secret_valid),
        "x-jwt-token-valid": str(jwt_token_valid),
        "x-user-identity": json.dumps({}) if not user_identity else user_identity.json()
    }))
    modified_headers = Headers({
        **request.headers,
        **append_headers
    })
    request.scope["headers"] = modified_headers.raw
    response = await call_next(request)
    return response


jwt_token_header = APIKeyHeader(name="authorization", scheme_name="jwt_token", auto_error=False)
event_secret_header = APIKeyHeader(name="hasura_event_secret", scheme_name="event_secret", auto_error=False)


class PysuraSecurity:

    def __init__(self,
                 require_jwt: bool = False,
                 require_event_secret: bool = False,
                 allowed_roles: List[str] | None = None):
        self.require_jwt = require_jwt
        self.allowed_roles = allowed_roles
        self.require_event_secret = require_event_secret

    async def __call__(self,
                       request: Request,
                       _: str | None = Depends(jwt_token_header),
                       __: str | None = Depends(event_secret_header)):
        if self.require_jwt:
            if self.allowed_roles is None or len(self.allowed_roles) == 0:
                raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Method Restricted")
            jwt_token_valid = request.headers.get("x-jwt-token-valid", None)
            if jwt_token_valid != "True":
                raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid jwt token")
            try:
                user_identity = UserIdentity(**json.loads(request.headers.get("x-user-identity", "{}")))
            except json.decoder.JSONDecodeError:
                raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid user identity")
            except TypeError:
                raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid user identity")
            user_identity_roles = user_identity.allowed_roles
            if not user_identity_roles or len(user_identity_roles) == 0:
                raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid user identity")
            if not any(role in user_identity_roles for role in self.allowed_roles):
                raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Method not allowed")
        if self.require_event_secret:
            event_secret_valid = request.headers.get("x-event-secret-valid", None)
            if event_secret_valid != "True":
                raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid event secret")


class PysuraGraphql(GraphqlClient):

    def __init__(self):
        self.name = "graphql_client"

        super().__init__(endpoint=HASURA_GRAPHQL_URL_ROOT)

    def execute(self,
                query: str,
                variables: dict | None = None,
                operation_name: str | None = None,
                **kwargs: Any):
        response = None
        try:
            kwargs.pop("headers", None)
            response = self.client.execute(
                headers={
                    "Content-Type": "application/json",
                    "X-Hasura-Admin-Secret": HASURA_GRAPHQL_ADMIN_SECRET
                },
                query=query,
                variables=variables,
                operation_name=operation_name,
                **kwargs
            )
        except Exception as e:
            try:
                logging.log(logging.ERROR, e)
                self.client = GraphqlClient(endpoint=HASURA_GRAPHQL_URL_ROOT)
                kwargs.pop("headers", None)
                response = self.client.execute(
                    headers={
                        "Content-Type": "application/json",
                        "X-Hasura-Admin-Secret": HASURA_GRAPHQL_ADMIN_SECRET
                    },
                    query=query,
                    variables=variables,
                    operation_name=operation_name,
                    **kwargs
                )
            except Exception as e:
                logging.log(logging.ERROR, e)
        finally:
            return response

    def execute_as_user(self,
                        token: str,
                        query: str,
                        variables: dict | None = None,
                        operation_name: str | None = None,
                        **kwargs: Any):
        response = None
        try:
            kwargs.pop("Authorization", None)
            response = self.client.execute(
                headers={
                    "Content-Type": "application/json",
                    "Authorization": f"{token}"
                },
                query=query,
                variables=variables,
                operation_name=operation_name,
                **kwargs
            )
        except Exception as e:
            try:
                logging.log(logging.ERROR, e)
                self.client = GraphqlClient(endpoint=HASURA_GRAPHQL_URL_ROOT)
                kwargs.pop("Authorization", None)
                response = self.client.execute(
                    headers={
                        "Content-Type": "application/json",
                        "Authorization": f"{token}"
                    },
                    query=query,
                    variables=variables,
                    operation_name=operation_name,
                    **kwargs
                )
            except Exception as e:
                logging.log(logging.ERROR, e)
        finally:
            return response

    async def execute_async(self):
        pass


class PysuraStorage:

    def __init__(self):
        self.name = "storage_client"
        self.storage = get_storage_client()

    # TODO: Add management methods


class Provider(BaseModel):
    user_identity: UserIdentity | None = None
    firebase_app: App | None = None
    graphql: PysuraGraphql | None = None
    storage: PysuraStorage | None = None

    class Config:
        arbitrary_types_allowed = True
        json_encoders = {
            App: lambda v: v if v is None else v.name,
            PysuraGraphql: lambda v: v if v is None else v.name,
            PysuraStorage: lambda v: v if v is None else v.name,
        }


class PysuraProvider:

    def __init__(self,
                 provide_identity: bool = False,
                 provide_firebase: bool = False,
                 provide_graphql: bool = False,
                 provide_storage: bool = False):
        self.provide_identity = provide_identity
        self.provide_firebase = provide_firebase
        self.provide_graphql = provide_graphql
        self.provide_storage = provide_storage

    async def __call__(self, request: Request) -> Provider:
        user_identity = None
        if self.provide_identity:
            if request.headers.get("x-jwt-token-valid", None) == "True":
                try:
                    user_identity = UserIdentity(**json.loads(request.headers.get("x-user-identity", "{}")))
                except (json.decoder.JSONDecodeError, TypeError):
                    pass
                except Exception as e:
                    logging.log(logging.ERROR, e)
        app_instance = None
        if self.provide_firebase:
            app_instance = firebase_app
        graphql = None
        if self.provide_graphql:
            graphql = PysuraGraphql()
        storage = None
        if self.provide_storage:
            storage = PysuraStorage()
        provider = Provider(
            user_identity=user_identity,
            firebase_app=app_instance,
            graphql=graphql,
            storage=storage
        )
        return provider
