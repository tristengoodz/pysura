import logging

from fastapi import APIRouter, Depends, Request
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider
from pysura.faster_api.enums import ApiResponse, ClientRole
from generated_types import *

ROUTE = "/action_upload_file/"
ALLOWED_ROLES = [  # The roles allowed to call this action
    ClientRole.admin.name, ClientRole.user.name
]
action_upload_file_router = APIRouter(
    tags=["action_upload_file"]
)


@action_upload_file_router.post(ROUTE,
                                dependencies=[
                                    Depends(PysuraSecurity(
                                        require_jwt=True,
                                        require_event_secret=True,
                                        allowed_roles=ALLOWED_ROLES
                                    ))
                                ],
                                response_model=ActionUploadFileOutput
                                )
async def action_upload_file(_: Request,
                             action_upload_file_input: ActionUploadFileInput | None = None,
                             provider: Provider | None = Depends(PysuraProvider(
                                 # (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!
                                 provide_identity=True,
                                 provide_firebase=True,
                                 provide_graphql=True,
                                 provide_storage=True
                                 # (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!
                             ))):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    # TODO: Write this
    logging.log(logging.INFO, f"User {provider.user_identity.user_id} is authorized to access {ROUTE}")
    logging.log(logging.INFO, action_upload_file_input)
    logging.log(logging.INFO, provider)
    response = ActionUploadFileOutput(
        data=None,
        nodes=None,
        response_name=ApiResponse.SUCCESS.name,
        response_value=ApiResponse.SUCCESS.value
    ).dict()
    return response
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
