from pydantic import BaseModel
from typing import List, Dict, Any
from firebase_admin import App
from python_graphql_client import GraphqlClient


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
    graphql: GraphqlClient | None = None

    class Config:
        arbitrary_types_allowed = True
        json_encoders = {
            App: lambda v: v if v is None else v.name,
            GraphqlClient: lambda v: v if v is None else v.endpoint
        }


class EventBodyTraceContext(BaseModel):
    trace_id: str
    span_id: str


class EventBodyData(BaseModel):
    old: Dict[str, Any]
    new: Dict[str, Any]


class EventBody(BaseModel):
    op: str
    data: EventBodyData
    trace_context: EventBodyTraceContext


class EventDeliveryInfo(BaseModel):
    max_retries: int
    current_retry: int


class EventTrigger(BaseModel):
    name: str


class EventTable(BaseModel):
    schema: str
    name: str


class Event(BaseModel):
    event: EventBody
    created_at: str
    id: str
    delivery_info: EventDeliveryInfo
    trigger: EventTrigger
    table: EventTable
