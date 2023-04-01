from fastapi import FastAPI, Request, Depends, HTTPException, status
from fastapi.security import APIKeyHeader
from starlette.datastructures import Headers
from firebase_admin import credentials, initialize_app, auth, get_app
from firebase_admin.auth import InvalidIdTokenError, ExpiredIdTokenError, RevokedIdTokenError, CertificateFetchError, \
    UserDisabledError
from pydantic import BaseModel
import json
from typing import List
import logging
from app_secrets import HASURA_EVENT_SECRET, HASURA_FIREBASE_SERVICE_ACCOUNT

try:
    firestore_app = get_app()
except ValueError:
    cred_dict = json.loads(HASURA_FIREBASE_SERVICE_ACCOUNT, strict=False)
    firestore_app = initialize_app(credential=credentials.Certificate(cred_dict))

app = FastAPI()


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


class Provider(BaseModel):
    user_identity: UserIdentity | None = None


@app.middleware("http")
async def security_injection_middleware(request: Request, call_next):
    request_event_secret = request.headers.get("hasura_event_secret", None)
    event_secret_valid = request_event_secret == HASURA_EVENT_SECRET
    request_jwt_token = request.headers.get("authorization", None)
    jwt_token_valid = False
    user_identity = None
    if isinstance(request_jwt_token, str) and "Bearer " in request_jwt_token:
        request_jwt_token = request_jwt_token.replace("Bearer ", "")
        try:
            decoded_token = auth.verify_id_token(request_jwt_token, app=firestore_app)
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


class PysuraProvider:

    def __init__(self, provide_identity: bool = True):
        self.provide_identity = provide_identity

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
        provider = Provider(
            user_identity=user_identity
        )
        return provider


@app.get("/", dependencies=[Depends(PysuraSecurity(
    require_jwt=True,
    require_event_secret=True,
    allowed_roles=["admin", "user"]
))])
async def root(request: Request,
               provider: Provider | None = Depends(PysuraProvider(provide_identity=True))):
    print(request.headers)
    print(provider)
    return "Hello World!"
