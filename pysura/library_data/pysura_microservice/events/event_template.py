import logging

from fastapi import APIRouter, Depends, Request, Body, Response
from pysura.faster_api.security import PysuraSecurity, PysuraProvider
from pysura.faster_api.models import Event, Provider

ROUTE = "/SNAKE/"
SNAKE_router = APIRouter(
    tags=["SNAKE"]
)


# Figure out proper dependency injection
@SNAKE_router.post(ROUTE, dependencies=[Depends(PysuraSecurity(require_jwt=False, require_event_secret=True))])
async def SNAKE(_: Request,
                provider: Provider | None = Depends(
                    PysuraProvider(
                        provide_identity=False,
                        provide_firebase=True,
                        provide_graphql=True
                    )
                ),
                data: Event = Body(...)):
    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    logging.log(logging.INFO, f"Event {data.id} is authorized to access {ROUTE}")
    logging.log(logging.INFO, data)
    logging.log(logging.INFO, provider)
    return Response(status_code=200)
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!
