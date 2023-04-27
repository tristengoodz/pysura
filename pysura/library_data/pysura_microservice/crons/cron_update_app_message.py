# (IMPORTS-START) - DO NOT DELETE THIS LINE!
import logging

from fastapi import APIRouter, Depends, Request, Body, Response
from pysura.faster_api.security import PysuraSecurity, PysuraProvider, Provider

# (IMPORTS-END) - DO NOT DELETE THIS LINE!

ROUTE = "/cron_update_app_message/"
cron_update_app_message_router = APIRouter(
    tags=["cron_update_app_message"]
)


@cron_update_app_message_router.post(ROUTE, dependencies=[Depends(PysuraSecurity(require_jwt=False, require_event_secret=True))])
async def cron_update_app_message(_: Request,
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
                data=Body(...)):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    logging.log(logging.INFO, data)
    logging.log(logging.INFO, provider)
    return Response(status_code=200)
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
