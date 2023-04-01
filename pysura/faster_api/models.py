from pydantic import BaseModel
from typing import List
from firebase_admin import App


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
    firebase_app: App | None = None

    class Config:
        arbitrary_types_allowed = True
        json_encoders = {
            App: lambda v: v if v is None else v.name
        }
