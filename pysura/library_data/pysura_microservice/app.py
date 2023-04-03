from fastapi import FastAPI, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse
from actions import action_routers
from events import event_routers
from crons import cron_routers

from pysura.faster_api.security import security_injection_middleware, Request

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
    allow_credentials=True
)


@app.middleware("http")
async def inject_security(request: Request, call_next):
    return await security_injection_middleware(request, call_next)


# TODO: Add middleware background task logging/tagging -> BigQuery

# TODO: Add caching middleware

# TODO: Add Deeplink routers

# TODO: ~~Add Celery distributed task queue~~ Add an event queue to Hasura using database that offloads to Bigquery
# Could add easy eventing as action with enum of event types and a jsonb payload, with locking
# Grab first event from table that has lock INT == 0
# Increment the lock INT to 1
# Get the event and check its lock..
#   if lock == 1, process event
#   if lock > 1,

@app.get("/",
         response_class=RedirectResponse,
         status_code=status.HTTP_302_FOUND)
async def root():
    return "/docs"


for router in action_routers:
    app.include_router(router)

for router in event_routers:
    app.include_router(router)

for cron in cron_routers:
    app.include_router(cron)
