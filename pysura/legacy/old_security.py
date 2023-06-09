import firebase_admin
from firebase_admin import credentials, initialize_app, auth
from firebase_admin.exceptions import FirebaseError
from firebase_admin.auth import InvalidIdTokenError, ExpiredIdTokenError, RevokedIdTokenError, CertificateFetchError, \
    UserDisabledError
from fastapi.security import APIKeyHeader
from fastapi import Request
import json
from google.oauth2 import service_account
from fastapi import Depends, HTTPException, status
import google.cloud.logging
import logging
from typing import List, Type
from pydantic import BaseModel
import functools
import os

from pysura.faster_api.enums import IdentityProvider

HASURA_FIREBASE_SERVICE_ACCOUNT = os.environ.get("HASURA_FIREBASE_SERVICE_ACCOUNT", None)
HASURA_EVENT_SECRET = os.environ.get("HASURA_EVENT_SECRET", None)

cred_dict = json.loads(HASURA_FIREBASE_SERVICE_ACCOUNT)
try:
    firestore_app = firebase_admin.get_app()
except ValueError:
    firestore_app = initialize_app(credential=credentials.Certificate(cred_dict))
creds = service_account.Credentials.from_service_account_info(cred_dict)
user_token = APIKeyHeader(name="Authorization", auto_error=False, scheme_name="user_token")
event_secret = APIKeyHeader(name="HASURA_EVENT_SECRET", auto_error=False, scheme_name="backend_secret")
logging_client = google.cloud.logging.Client(credentials=creds)
logging_client.setup_logging()

IDENTITY_PROVIDER = IdentityProvider.firebase.name


class UserIdentity(BaseModel):
    role: str | None = None
    user_id: str | None = None
    allowed_roles: List[str] | None = None
    phone_number: str | None = None
    email: str | None = None
    iss: str | None = None
    aud: str | None = None
    iat: int | None = None
    exp: int | None = None
    auth_time: int | None = None
    sub: str | None = None

    class Config:
        schema_extra = {"example": {}}


def token_auth(token_value: str | None = Depends(user_token)) -> UserIdentity:
    if IDENTITY_PROVIDER == IdentityProvider.firebase.name:
        if token_value is None:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")
        token_value = token_value.replace("Bearer ", "")
        try:
            decoded_token = auth.verify_id_token(token_value, app=firestore_app)
            claims = decoded_token["https://hasura.io/jwt/claims"]
            hasura_allowed_roles = claims["x-hasura-allowed-roles"]
            default_role = claims["x-hasura-default-role"]
            user_id = claims["x-hasura-user-id"]
            user_identity_dict = {
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
            return user_identity
        except ValueError as _:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")
        except ExpiredIdTokenError as _:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Expired token")
        except RevokedIdTokenError as _:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Revoked token")
        except InvalidIdTokenError as _:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")
        except CertificateFetchError as _:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid Certificate")
        except UserDisabledError as _:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="User Disabled")
        except Exception as e:
            logging.log(logging.ERROR, e)
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")
    else:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid Identity Provider")


def backend_auth(token_value: str | None = Depends(event_secret)) -> None:
    if token_value is None or token_value != HASURA_EVENT_SECRET:
        logging.log(logging.WARNING, "HASURA_EVENT_SECRET invalid")
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid Backend Event Secret")
    logging.log(logging.DEBUG, "HASURA_EVENT_SECRET verified successfully.")


def role_verify(request: Request, allowed_roles: List[str] | None = None, identity_provider="firebase") -> UserIdentity:
    if allowed_roles is None:
        allowed_roles = ["admin"]
    user_profile = {
        "role": None,
        "user_id": None,
        "allowed_roles": None
    }
    if identity_provider == "firebase":
        tok = request.headers.get("Authorization", None)
        if tok is None:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,
                                detail="id_token is a not a string or is empty.")
        tok = tok.replace("Bearer ", "")
        user_role = None
        try:
            decoded_token = auth.verify_id_token(tok)
            claims = decoded_token["https://hasura.io/jwt/claims"]
            hasura_allowed_roles = claims["x-hasura-allowed-roles"]
            user_id = claims["x-hasura-user-id"]
            verified = False
            for role in hasura_allowed_roles:
                if role in allowed_roles:
                    verified = True
                    user_role = role
                    break
            if not verified:
                raise AssertionError("Role not allowed")
            user_profile["role"] = user_role
            user_profile["user_id"] = user_id
            user_profile["allowed_roles"] = hasura_allowed_roles
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
            assert user_role is not None
            return UserIdentity(
                role=user_role,
                user_id=user_profile.get("user_id", None),
                allowed_roles=user_profile.get("allowed_roles", None)
            )
    else:
        raise NotImplementedError("Identity Provider not implemented yet!")


# Decorator for collecting the user identity
def identity(original_function=None,
             allowed_roles: List[str] | None = None,
             identity_provider="firebase",
             function_input: Type[BaseModel] = None):
    if allowed_roles is None:
        allowed_roles = ["admin"]

    def _decorate(function):
        @functools.wraps(function)
        async def wrapped_function(*args, **kwargs):
            request: Request = kwargs["_"]
            request_data = await request.json()
            user_identity_obj = role_verify(request=kwargs["_"],
                                            allowed_roles=allowed_roles,
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
