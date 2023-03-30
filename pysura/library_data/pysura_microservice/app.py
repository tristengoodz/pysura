from app_secrets import *  # noqa: F401, F403
from fastapi import FastAPI, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse
from actions import action_routers
from events import event_routers
from crons import cron_routers

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
    allow_credentials=True
)


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
