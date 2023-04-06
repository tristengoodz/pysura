# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider
from pysura.faster_api.enums import ApiResponse, ClientRole
from generated_types import *

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

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
    if len(action_upload_file_input.file_data) / (1024 * 1024) > 50:
        return ActionUploadFileOutput(
            data=None,
            nodes=None,
            response_name=ApiResponse.FAILURE.name,
            response_value=ApiResponse.FAILURE.value,
            errors=[
                {
                    "message": "File too large",
                }
            ]
        ).dict()
    if action_upload_file_input.file_type not in ["image/jpeg",
                                                  "image/png",
                                                  "image/gif",
                                                  "image/svg+xml",
                                                  "video/mp4",
                                                  "video/mpeg"]:
        return ActionUploadFileOutput(
            data=None,
            nodes=None,
            response_name=ApiResponse.FAILURE.name,
            response_value=ApiResponse.FAILURE.value,
            errors=[
                {
                    "message": "Invalid file type",
                }
            ]
        ).dict()
    try:
        response = provider.storage.upload_file(file_data=action_upload_file_input.file_data,
                                                file_name=action_upload_file_input.file_name,
                                                file_type=action_upload_file_input.file_type,
                                                user_id=provider.user_identity.user_id)
        provider.graphql.execute(
            query="""mutation UploadFile($name: String = "", $signed_url: String = "", $public: Boolean = true, $type: String = "", $user_id: String = "") {
  insert_file_one(object: {name: $name, public: $public, signed_url: $signed_url, type: $type, user_id: $user_id}) {
    file_id
    name
    public
    signed_url
    type
    user_id
  }
}
""",
            variables={
                "name": action_upload_file_input.file_name,
                "signed_url": response["signed_url"],
                "public": action_upload_file_input.public,
                "type": action_upload_file_input.file_type,
                "user_id": provider.user_identity.user_id
            }
        )
        final_response = ActionUploadFileOutput(
            data=ActionUploadFileOutputData(
                file_id=response["file_id"],
                file_type=action_upload_file_input.file_type,
                file_name=action_upload_file_input.file_name,
                file_url=response["signed_url"],
            ),
            nodes=None,
            response_name=ApiResponse.SUCCESS.name,
            response_value=ApiResponse.SUCCESS.value
        ).dict()
        return final_response
    except Exception as e:
        return ActionUploadFileOutput(
            data=None,
            nodes=None,
            response_name=ApiResponse.FAILURE.name,
            response_value=ApiResponse.FAILURE.value,
            errors=[
                {
                    "message": str(e),
                }
            ]
        ).dict()
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
