import logging

from fastapi import APIRouter, Depends, Request
from pysura.faster_api.security import PysuraSecurity, PysuraProvider
from pysura.faster_api.models import Provider
from pysura.faster_api.enums import ApiResponse, ClientRole
from generated_types import *

ROUTE = "/SNAKE/"
ALLOWED_ROLES = [  # The roles allowed to call this action
    # ALLOWED ROLES HERE
]
SNAKE_router = APIRouter(
    tags=["SNAKE"]
)


# Figure out proper dependency injection
@SNAKE_router.post(ROUTE,
                   dependencies=[
                       Depends(PysuraSecurity(
                           require_jwt=True,
                           require_event_secret=True,
                           allowed_roles=ALLOWED_ROLES
                       ))
                   ],
                   response_model=CAMELOutput
                   )
async def action_base_generator_mutation(_: Request,
                                         SNAKE_input: CAMELInput | None = None,
                                         provider: Provider | None = Depends(PysuraProvider(
                                             provide_identity=True,
                                             provide_firebase=True
                                         ))):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    logging.log(logging.INFO, f"User {provider.user_identity.user_id} is authorized to access {ROUTE}")
    logging.log(logging.INFO, SNAKE_input)
    logging.log(logging.INFO, provider)
    response = CAMELOutput(
        data=None,
        nodes=None,
        response_name=ApiResponse.SUCCESS.name,
        response_value=ApiResponse.SUCCESS.value
    ).dict()
    return response
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
