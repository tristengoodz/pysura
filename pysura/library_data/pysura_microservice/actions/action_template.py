# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider
from pysura.faster_api.enums import ApiResponse, ClientRole
from generated_types import *

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

ROUTE = "/SNAKE/"
ALLOWED_ROLES = [  # The roles allowed to call this action
    # ALLOWED ROLES HERE
]
SNAKE_router = APIRouter(
    tags=["SNAKE"]
)


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
async def SNAKE(_: Request,
                SNAKE_input: CAMELInput | None = None,
                provider: Provider | None = Depends(PysuraProvider(
                    # (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!
                    provide_identity=True,
                    provide_firebase=True,
                    provide_graphql=True,
                    provide_storage=True
                    # (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!
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
