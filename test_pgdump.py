import requests

path = "https://hasura-ny5gxlz7tq-uc.a.run.app//v1alpha1/pg_dump"

headers = {
    "Content-Type": "application/json",
    "X-Hasura-Admin-Secret": "JlVvQNGZG5unUa2czU5q2HFrDNIrCK4RoKvILETaHbjs7ZgV43YQZ7C3CCMXkmh6"
}

data = {
    "opts": ["-O", "-x", "--schema-only", "--schema=public"],
    "clean_output": True,
    "source": "default"
}

response = requests.post(path, headers=headers, json=data)

with open("dump.sql", "w") as f:
    f.write(response.text)
