from flask.wrappers import Request
import firebase_admin
import functions_framework
from google.cloud import secretmanager
from python_graphql_client import GraphqlClient
from requests.exceptions import ConnectionError
import logging

PROJECT_ID = "PROJECT_ID_HERE"
firebase_admin.initialize_app()


def get_secret_by_id(secret_id, version_id="latest"):
    client = secretmanager.SecretManagerServiceClient()
    name = f"projects/{PROJECT_ID}/secrets/{secret_id}/versions/{version_id}"
    response = client.access_secret_version(name=name)
    return response.payload.data.decode("UTF-8")


HASURA_GRAPHQL_URL_ROOT = get_secret_by_id("HASURA_GRAPHQL_URL_ROOT")
HASURA_GRAPHQL_ADMIN_SECRET = get_secret_by_id("HASURA_GRAPHQL_ADMIN_SECRET")


def get_client():
    return GraphqlClient(endpoint=HASURA_GRAPHQL_URL_ROOT)


def get_headers():
    return {
        "Content-Type": "application/json",
        "X-Hasura-Admin-Secret": HASURA_GRAPHQL_ADMIN_SECRET,
    }


def execute(gql, variables):
    response = None
    headers = get_headers()
    try:
        client = get_client()
        response = client.execute(headers=headers, query=gql, variables=variables)
    except ConnectionError as e:
        logging.info(e)
        client = get_client()
        response = client.execute(headers=headers, query=gql, variables=variables)
    except Exception as e:
        logging.error(e)
    finally:
        return response


def on_user_create(data, context):
    print(data)
    print(context)
    return "Hello, World!"


def on_user_delete(data, context):
    print(data)
    print(context)
    return


@functions_framework.http
def logout_user(request: Request):
    print(request)
    print(request.headers)
    print(request.method)
    if request.is_json:
        print(request.json)
    return "Hello, World!"


@functions_framework.http
def refresh_user_claims(request: Request):
    print(request)
    print(request.headers)
    print(request.method)
    if request.is_json:
        print(request.json)
    return "Hello, World!"
