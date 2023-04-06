import base64
import PIL.Image

with open("testimage.png", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

print(type(encoded_string))

str_type = encoded_string.decode("utf-8")
print(encoded_string)

bytes_type = bytes(encoded_string)
print(len(bytes_type) / (1024 * 1024))
with open("img2.png", "wb") as f:
    f.write(base64.b64decode(bytes_type))

with open("tmp.txt", "w") as f:
    f.write(str_type)

size_in_bytes = len(encoded_string)
size_in_megabytes = size_in_bytes / (1024 * 1024)
print(size_in_megabytes)

import python_graphql_client

gql = python_graphql_client.GraphqlClient(endpoint="https://hasura-qquydb77xa-uc.a.run.app/v1/graphql")

headers = {
    "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6Ijg3YzFlN2Y4MDAzNGJiYzgxYjhmMmRiODM3OTIxZjRiZDI4N2YxZGYiLCJ0eXAiOiJKV1QifQ.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsiYWRtaW4iXSwieC1oYXN1cmEtZGVmYXVsdC1yb2xlIjoiYWRtaW4iLCJ4LWhhc3VyYS11c2VyLWlkIjoiNWgyNDJMMk9KcGZpTkY2czE5VHA1N0tnSnFIMyJ9LCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHlzdXJhMC05OS02NiIsImF1ZCI6InB5c3VyYTAtOTktNjYiLCJhdXRoX3RpbWUiOjE2ODA3NDc3ODEsInVzZXJfaWQiOiI1aDI0MkwyT0pwZmlORjZzMTlUcDU3S2dKcUgzIiwic3ViIjoiNWgyNDJMMk9KcGZpTkY2czE5VHA1N0tnSnFIMyIsImlhdCI6MTY4MDc0ODU3OSwiZXhwIjoxNjgwNzUyMTc5LCJwaG9uZV9udW1iZXIiOiIrMTU1NTUyMTU1NTEiLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7InBob25lIjpbIisxNTU1NTIxNTU1MSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBob25lIn19.RD6XmB-82je3XvfYY1zKiwAzkz_QHbAAyxUWjcWQBc7S2EVj2goB6OgDXthVPphSe3mc1LWV8OUR4WfEhzFrhwdTdCNdNTBdb_Ns5FPGXzfAc9cw90WUea27dpam0A-IEEMmsdZO14791vldAE8mK9Qx2Ky7N86-wTZQKSze7K5aRAmL2BONVinvVsI9YB6Wn1TQPPcvqb6m_iR0gLUiIukBBKzNr-V-4ohNudDhjRUHZ9SbUKTv6tp5703SDYctI7hB7BSzbaLzGAEvhKyi8dFfoPUBcZQmP4tXfb_OKSIpIx2vRcAh-9YaTci1F68wP0TDf6vZBouXeJA8pjd9SQ",
    "content-type": "application/json"
}

query = """mutation actionUploadFile($file_data: String = "", $file_name: String = "", $file_type: String = "") {
  action_upload_file(action_upload_file_input: {file_data: $file_data, file_name: $file_name, file_type: $file_type, public: true})
}
"""

variables = {
    "file_data": str_type,
    "file_name": "testimage.png",
    "file_type": "image/png"
}

data = gql.execute(query=query, variables=variables, headers=headers)
print(data)
