import os
from google.cloud import secretmanager

PROJECT_ID = "YOUR_PROJECT_ID"


def get_secret_by_id(secret_id, version_id="latest"):
    client = secretmanager.SecretManagerServiceClient()
    name = f"projects/{PROJECT_ID}/secrets/{secret_id}/versions/{version_id}"
    response = client.access_secret_version(name=name)
    return response.payload.data.decode("UTF-8")


print("LOADING SECRETS")
HASURA_GRAPHQL_ADMIN_SECRET = get_secret_by_id("HASURA_GRAPHQL_ADMIN_SECRET")
HASURA_GRAPHQL_URL_ROOT = get_secret_by_id("HASURA_GRAPHQL_URL_ROOT")
HASURA_EVENT_SECRET = get_secret_by_id("HASURA_EVENT_SECRET")
BACKEND_FIREBASE_SERVICE_ACCOUNT = get_secret_by_id("BACKEND_FIREBASE_SERVICE_ACCOUNT")
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = BACKEND_FIREBASE_SERVICE_ACCOUNT
os.environ["BACKEND_FIREBASE_SERVICE_ACCOUNT"] = BACKEND_FIREBASE_SERVICE_ACCOUNT
os.environ["HASURA_EVENT_SECRET"] = HASURA_EVENT_SECRET