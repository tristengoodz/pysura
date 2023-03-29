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


class GQL:
    CREATE_USER = """mutation CreateUser($user_id: String = "", $user_phone: String = "") {
  insert_user_one(object: {user_id: $user_id, user_phone: $user_phone}) {
    user_id
  }
}
"""


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
    try:
        user_uid = data["uid"]
        user_phone = data["phoneNumber"]
        variables = {"user_id": user_uid, "user_phone": user_phone}
        response = execute(GQL.CREATE_USER, variables)
        if response.get("errors", None) is not None:
            print(response)
            return response
    except Exception as e:
        print(e)
        return 500, "ERROR"
    return 200, "OK"


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
