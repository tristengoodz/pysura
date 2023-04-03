# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request, Body, Response
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider
from pysura.faster_api.models import Event
from firebase_admin import auth

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

ROUTE = "/event_update_user_role/"
event_update_user_role_router = APIRouter(
    tags=["event_update_user_role"]
)


@event_update_user_role_router.post(ROUTE, dependencies=[
    Depends(PysuraSecurity(require_jwt=False, require_event_secret=True))])
async def event_update_user_role(_: Request,
                                 provider: Provider | None = Depends(
                                     PysuraProvider(
                                         # (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!
                                         provide_identity=False,
                                         provide_firebase=True,
                                         provide_graphql=False,
                                         provide_storage=False
                                         # (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!
                                     )
                                 ),
                                 data: Event = Body(...)):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    logging.log(logging.INFO, f"Event {data.id} is authorized to access {ROUTE}")
    logging.log(logging.INFO, data)
    role = data.event.data.new.get("role", None)
    user_id = data.event.data.new.get("user_id", None)
    auth.set_custom_user_claims(
        user_id,
        {
            "https://hasura.io/jwt/claims": {
                "x-hasura-allowed-roles": [role],
                "x-hasura-default-role": role,
                "x-hasura-user-id": user_id,
            }
        },
        app=provider.firebase_app
    )
    return Response(status_code=200)
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
