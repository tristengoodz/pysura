from pydantic import BaseModel
from typing import List, Dict, Any


class UserIdentity(BaseModel):
    token: str | None = None
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


class Event(BaseModel):
    event: EventBody
    created_at: str
    id: str
    delivery_info: EventDeliveryInfo
    trigger: EventTrigger
    table: Dict[str, str] | None = None
