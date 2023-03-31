import logging

from fastapi import APIRouter, Depends, Request
from pysura.faster_api.security import backend_auth, token_auth, UserIdentity, identity, IDENTITY_PROVIDER
from pysura.faster_api.enums import ApiResponse, ClientRole
from generated_types import *

ROUTE = "/SNAKE/"
ALLOWED_ROLES = [  # The roles allowed to call this action
    # ALLOWED ROLES HERE
]
SNAKE_router = APIRouter(
    tags=["SNAKE"]
)


@SNAKE_router.post(ROUTE,
                   dependencies=[Depends(backend_auth), Depends(token_auth)])
@identity(allowed_roles=ALLOWED_ROLES,
          identity_provider=IDENTITY_PROVIDER,
          function_input=CAMELInput
          )
async def action_base_generator_mutation(_: Request,
                                         base_generator_mutation_input: CAMELInput | None = None,
                                         injected_user_identity: UserIdentity | None = None
                                         ):
    # (AUTH-LOCK-START) - DO NOT DELETE THIS LINE!
    if injected_user_identity is None or injected_user_identity.user_id is None:
        return {
            "response_name": ApiResponse.UNAUTHORIZED.name,
            "response_value": ApiResponse.UNAUTHORIZED.value
        }
    logging.log(logging.INFO, f"User {injected_user_identity.user_id} is authorized to access {ROUTE}")
    # (AUTH-LOCK-END) - DO NOT DELETE THIS LINE!

    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    print(base_generator_mutation_input)
    response = CAMELOutput(
        data=None,
        nodes=None,
        response_name=ApiResponse.SUCCESS.name,
        response_value=ApiResponse.SUCCESS.value
    ).dict()
    return response
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
