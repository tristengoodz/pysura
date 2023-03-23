from pydantic import BaseModel
import json


class C(BaseModel):
    x: int


class B(BaseModel):
    str_var: str
    int_var: int
    float_var: float
    bool_var: bool
    optional_str_var: str | None = None
    dict_var: dict = {}
    list_var: list = [1, 2, 3]
    set_var = set()
    bytes_var = b"123"
    obj_var: C


b = json.loads(B.schema_json())
b = B.schema()
print(b)
# print(b)
# for k, v in b["properties"].items():
#     print(k, v)


class PysuraEnv(BaseModel):

    selected_billing_account: str = None
    billing_accounts: list = []