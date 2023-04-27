# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request, Body, Response
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider
from pysura.faster_api.models import Event

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

ROUTE = "/event_update_user_cascade/"
event_update_user_cascade_router = APIRouter(
    tags=["event_update_user_cascade"]
)


@event_update_user_cascade_router.post(ROUTE, dependencies=[
    Depends(PysuraSecurity(require_jwt=False, require_event_secret=True))])
async def event_update_user_cascade(_: Request,
                                    provider: Provider | None = Depends(
                                        PysuraProvider(
                                            # (DEPENDENCY-INJECTION-START) - DO NOT DELETE THIS LINE!
                                            provide_identity=False,
                                            provide_firebase=True,
                                            provide_graphql=True,
                                            provide_storage=True,
                                            provide_sql=True
                                            # (DEPENDENCY-INJECTION-END) - DO NOT DELETE THIS LINE!
                                        )
                                    ),
                                    data: Event = Body(...)):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    if data.event.op != "INSERT":
        return Response(status_code=200)
    new_data = data.event.data.new
    user_id = new_data["user_id"]
    provider.graphql.execute(
        query="""mutation PublicUserCascade($user_id: String = "") {
  insert_public_user_one(object: {user_id: $user_id}) {
    user_id
  }
}""",
        variables={
            "user_id": user_id
        }
    )
    return Response(status_code=200)
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
