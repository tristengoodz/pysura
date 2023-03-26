from flask.wrappers import Request
import firebase_admin
import functions_framework

firebase_admin.initialize_app()


@functions_framework.http
def on_user_create(request: Request):
    print(request)
    return "Hello, World!"


@functions_framework.http
def logout_user(request: Request):
    print(request)
    return "Hello, World!"


@functions_framework.http
def refresh_user_claims(request: Request):
    print(request)
    return "Hello, World!"
