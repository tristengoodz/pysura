# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider
from pysura.faster_api.enums import ApiResponse, ClientRole
from generated_types import *

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

ROUTE = "/action_mutation_pong/"
ALLOWED_ROLES = [  # The roles allowed to call this action
    ClientRole.admin.name, ClientRole.user.name
]
action_mutation_pong_router = APIRouter(
    tags=["action_mutation_pong"]
)


@action_mutation_pong_router.post(ROUTE,
                                  dependencies=[
                                      Depends(PysuraSecurity(
                                          require_jwt=True,
                                          require_event_secret=True,
                                          allowed_roles=ALLOWED_ROLES
                                      ))
                                  ],
                                  response_model=ActionMutationPongOutput
                                  )
async def action_mutation_pong(_: Request,
                               action_mutation_pong_input: ActionMutationPongInput | None = None,
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
    provider.graphql.execute(
        query="""mutation Pong($user_id: String = "", $message: String = "", $number: Int = 10) {
  update_public_user_by_pk(pk_columns: {user_id: $user_id}, _set: {message: $message, number: $number}) {
    user_id
  }
}""",
        variables={
            "user_id": user_id,
            "message": action_mutation_pong_input.message,
            "number": action_mutation_pong_input.number
        }
    )
    response = ActionMutationPongOutput(
        data=ActionMutationPongOutputData(
            message=action_mutation_pong_input.message,
            number=action_mutation_pong_input.number
        ),
        nodes=None,
        response_name=ApiResponse.SUCCESS.name,
        response_value=ApiResponse.SUCCESS.value
    ).dict()
    return response
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
