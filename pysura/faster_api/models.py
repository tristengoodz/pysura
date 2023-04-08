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
    trace_id: str | None = None
    span_id: str | None = None


class EventBodyData(BaseModel):
    old: Dict[str, Any] | None = None
    new: Dict[str, Any] | None = None


class EventBody(BaseModel):
    op: str | None = None
    data: EventBodyData | None = None
    trace_context: EventBodyTraceContext | None = None


class EventDeliveryInfo(BaseModel):
    max_retries: int | None = None
    current_retry: int | None = None


class EventTrigger(BaseModel):
    name: str | None = None


class Event(BaseModel):
    event: EventBody | None = None
    created_at: str | None = None
    id: str | None = None
    delivery_info: EventDeliveryInfo | None = None
    trigger: EventTrigger | None = None
    table: Dict[str, str] | None = None
