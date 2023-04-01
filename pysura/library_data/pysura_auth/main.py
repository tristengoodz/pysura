import firebase_admin
from firebase_admin import auth
from google.cloud import secretmanager
from python_graphql_client import GraphqlClient
from requests.exceptions import ConnectionError
import logging

PROJECT_ID = "PROJECT_ID_HERE"
app = firebase_admin.initialize_app()


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

    DELETE_USER = """mutation DeleteUser($user_id: String = "") {
  delete_user_by_pk(user_id: $user_id) {
    user_id
  }
}"""


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


def on_user_create(data, _):
    try:
        user_uid = data["uid"]
        user_phone = data.get("phoneNumber", None)
        if user_phone is None:
            user_phone = data.get("email", None)
        if user_phone is None:
            print("No phone or email")
            return 400, "ERROR"
        variables = {"user_id": user_uid, "user_phone": user_phone}
        response = execute(GQL.CREATE_USER, variables)
        if response.get("errors", None) is not None:
            print(response)
            return response
        auth.set_custom_user_claims(
            user_uid,
            {
                "https://hasura.io/jwt/claims": {
                    "x-hasura-allowed-roles": ["user"],
                    "x-hasura-default-role": "user",
                    "x-hasura-user-id": user_uid,
                }
            }
        )
    except Exception as e:
        print(e)
        return 500, "ERROR"
    return 200, "OK"


def on_user_delete(data, _):
    try:
        user_uid = data["uid"]
        variables = {"user_id": user_uid}
        response = execute(GQL.DELETE_USER, variables)
        if response.get("errors", None) is not None:
            print(response)
            return response
    except Exception as e:
        print(e)
        return 500, "ERROR"
    return 200, "OK"
