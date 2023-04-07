import base64

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

gql = python_graphql_client.GraphqlClient(endpoint="https://hasura-ny5gxlz7tq-uc.a.run.app/v1/graphql")

headers = {
    "Authorization": "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6Ijg3YzFlN2Y4MDAzNGJiYzgxYjhmMmRiODM3OTIxZjRiZDI4N2YxZGYiLCJ0eXAiOiJKV1QifQ.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsiYWRtaW4iXSwieC1oYXN1cmEtZGVmYXVsdC1yb2xlIjoiYWRtaW4iLCJ4LWhhc3VyYS11c2VyLWlkIjoiUUFDUkhvNWdSV2M0aDBqTWtuY3c0ZTZwR0l6MiJ9LCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHlzdXJhMC05OS05NiIsImF1ZCI6InB5c3VyYTAtOTktOTYiLCJhdXRoX3RpbWUiOjE2ODA4NDIwNDUsInVzZXJfaWQiOiJRQUNSSG81Z1JXYzRoMGpNa25jdzRlNnBHSXoyIiwic3ViIjoiUUFDUkhvNWdSV2M0aDBqTWtuY3c0ZTZwR0l6MiIsImlhdCI6MTY4MDg0MjA0OCwiZXhwIjoxNjgwODQ1NjQ4LCJwaG9uZV9udW1iZXIiOiIrMTU1NTUyMTU1NTEiLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7InBob25lIjpbIisxNTU1NTIxNTU1MSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBob25lIn19.lIr52GkPkMISjZBDGo9p7IVnSD3AeQD4awLJyNRjWP2VCodRKUvqQ6Xoc_Uo6MYsyosnaSaNrJeYSpPidLZ_h2XLgwMSFD1TdYpvbIRRU_po1qccOWMj5UL3DsB-uQN9h3DvCHyaCaI1bZR0GxGgdz68o92RpTNwhTLsqRcg6m9vlnPksRPDi4MqMtMqsaWITmspUmgR3cRNZKq7cffivaZB3373ZmHSJtgA2vlfoXJNVkKG2sbyg2g2pjW1EFtKQ53RTOLvOvYwXzv3V2-PaYjlwOH1XEX1kHTVQHXKpVetGdG-ieeSK0q2cojalZbuEe9UZTPzHSBnWQTkOAP9ug",
    "content-type": "application/json"
}

query = """mutation ActionUploadFile($file_data: String = "", $file_name: String = "", $file_type: String = "", $public: Boolean = false) {
  action_upload_file(action_upload_file_input: {file_data: $file_data, file_name: $file_name, file_type: $file_type, public: $public})
}
"""

variables = {
    "file_data": str_type,
    "file_name": "testimage.png",
    "file_type": "image/png",
    "public": True
}

data = gql.execute(query=query, variables=variables, headers=headers)
print(data)
response = data["data"]["action_upload_file"]
print(response)
