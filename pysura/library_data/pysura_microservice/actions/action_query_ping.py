# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider
from pysura.faster_api.enums import ApiResponse, ClientRole
from generated_types import *

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

ROUTE = "/action_query_ping/"
ALLOWED_ROLES = [  # The roles allowed to call this action
    ClientRole.admin.name, ClientRole.user.name
]
action_query_ping_router = APIRouter(
    tags=["action_query_ping"]
)


@action_query_ping_router.post(ROUTE,
                               dependencies=[
                                   Depends(PysuraSecurity(
                                       require_jwt=True,
                                       require_event_secret=True,
                                       allowed_roles=ALLOWED_ROLES
                                   ))
                               ],
                               response_model=ActionQueryPingOutput
                               )
async def action_query_ping(_: Request,
                            action_query_ping_input: ActionQueryPingInput | None = None,
                            provider: Provider | None = Depends(PysuraProvider(
                                # (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!
                                provide_identity=True,
                                provide_firebase=True,
                                provide_graphql=True,
                                provide_storage=True,
                                provide_sql=True
                                # (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!
                            ))):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    user_id = provider.user_identity.user_id
    response = provider.graphql.execute(
        query="""query Ping($user_id: String = "") {
  public_user_by_pk(user_id: $user_id) {
    message
    number
  }
}""",
        variables={
            "user_id": user_id
        }
    )
    data = response["data"]["public_user_by_pk"]

    response = ActionQueryPingOutput(
        data=ActionQueryPingOutputData(
            **data
        ),
        nodes=None,
        response_name=ApiResponse.SUCCESS.name,
        response_value=ApiResponse.SUCCESS.value
    ).dict()
    return response
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
