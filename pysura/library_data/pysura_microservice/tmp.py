import json


def router_generator(hasura_metadata, service_url="{{DEFAULT_SERVICE_URL}}"):
    """Generates a router for the current microservice"""

    def collect_types(object_data, custom_type="object"):
        root_type = {}
        custom_name = object_data.get("name")
        root_type[custom_name] = {
            "name": custom_name,
            "fields": {},
            "required_objects": set(),
            "custom_type": custom_type
        }
        default_types = ["String", "Int", "Float", "Boolean", "ID"]
        for field in object_data.get("fields", []):
            is_list = False
            is_object = False
            is_optional = True
            field_collect_type = field.get("type", {})
            if field_collect_type[0] == "[" and field_collect_type[-1] == "]":
                field_collect_type = field_collect_type[1:-1]
                is_list = True
            if field_collect_type[-1] == "!":
                field_collect_type = field_collect_type[:-1]
                is_optional = False
            if field_collect_type not in default_types:
                is_object = True

            root_type[custom_name]["fields"][field.get("name")] = {
                "type": field_collect_type,
                "is_list": is_list,
                "is_object": is_object,
                "is_optional": is_optional,
            }
            if is_object:
                root_type[custom_name]["required_objects"].add(field_collect_type)
        return root_type

    included_types = []
    excluded_types = []
    actions = {}
    for action in hasura_metadata.get("actions", []):
        action_name = action.get("name")
        action_handler = action.get("definition", {}).get("handler", None)
        output_type = action.get("definition", {}).get("output_type", None)
        input_type = action.get("definition", {}).get("arguments", [{'type': None}])[0].get("type", None)
        if action_handler == service_url:
            included_types.append(output_type)
            included_types.append(input_type)
        else:
            excluded_types.append(output_type)
            excluded_types.append(input_type)
        actions[action_name] = {
            "name": action_name,
            "handler": action_handler,
            "output_type": output_type,
            "input_type": input_type
        }

    unordered_custom_objects = []
    for custom_object in hasura_metadata.get("custom_types", {}).get("objects", []):
        types = collect_types(custom_object)
        unordered_custom_objects.append(types)

    unordered_custom_input_objects = []
    for custom_input_object in hasura_metadata.get("custom_types", {}).get("input_objects", []):
        types = collect_types(custom_input_object)
        unordered_custom_input_objects.append(types)

    excluded = []
    included = []
    for co in unordered_custom_objects:
        co_key = list(co.keys())[0]
        required_objects = co[co_key]["required_objects"]
        if co_key in excluded_types:
            excluded.extend([co_key, *required_objects])
        elif co_key in included_types:
            included.extend([co_key, *required_objects])

    for co in unordered_custom_input_objects:
        co_key = list(co.keys())[0]
        required_objects = co[co_key]["required_objects"]
        if co_key in excluded_types:
            excluded.extend([co_key, *required_objects])
        elif co_key in included_types:
            included.extend([co_key, *required_objects])

    included_set = set(included)
    new_unordered_custom_objects = []
    for co in unordered_custom_objects:
        co_key = list(co.keys())[0]
        if co_key in included_set:
            new_unordered_custom_objects.append(co)
    unordered_custom_objects = new_unordered_custom_objects

    new_unordered_custom_input_objects = []
    for co in unordered_custom_input_objects:
        co_key = list(co.keys())[0]
        if co_key in included_set:
            new_unordered_custom_input_objects.append(co)
    unordered_custom_input_objects = new_unordered_custom_input_objects

    ordered_objects_handled = set()
    ordered_custom_objects = []
    loop_count = 0
    # At most, we will have to loop through the list of custom objects as many times as there are custom objects
    # This would be worst case if every object was nested in another object
    while len(unordered_custom_objects) != len(ordered_custom_objects) and loop_count < len(
            unordered_custom_objects) + 1:
        loop_count += 1
        for custom_object in unordered_custom_objects:
            assert len(custom_object) == 1
            custom_object_name = list(custom_object.keys())[0]
            if custom_object_name in ordered_objects_handled:
                continue
            else:
                required_objects = custom_object[custom_object_name]["required_objects"]
                if required_objects.issubset(ordered_objects_handled):
                    ordered_custom_objects.append(custom_object)
                    ordered_objects_handled.add(custom_object_name)
                else:
                    continue

    ordered_input_objects_handled = set()
    ordered_custom_input_objects = []
    loop_count = 0
    # At most, we will have to loop through the list of custom objects as many times as there are custom objects
    # This would be worst case if every object was nested in another object
    while len(unordered_custom_input_objects) != len(ordered_custom_input_objects) and loop_count < len(
            unordered_custom_input_objects) + 1:
        loop_count += 1
        for custom_input_object in unordered_custom_input_objects:
            assert len(custom_input_object) == 1
            custom_input_object_name = list(custom_input_object.keys())[0]
            if custom_input_object_name in ordered_input_objects_handled:
                continue
            else:
                required_objects = custom_input_object[custom_input_object_name]["required_objects"]
                if required_objects.issubset(ordered_input_objects_handled):
                    ordered_custom_input_objects.append(custom_input_object)
                    ordered_input_objects_handled.add(custom_input_object_name)
                else:
                    continue

    base_models_template = """from typing import List
from pydantic import BaseModel

    """

    object_template = """\nclass {name}(BaseModel):\n    {fields}{config}\n"""
    field_template = "{}: {}"
    config_template = '\n\n    class Config:\n        schema_extra = {extra}'
    config_extra_start = '{"example": {'
    config_extra_middle_piece = '{field_pieces}'
    config_extra_end = "}}"
    config_field_template = '"{field_name}": {field_default}'
    field_type_map = {
        "String": "str",
        "Int": "int",
        "Float": "float",
        "Boolean": "bool",
        "ID": "str"
    }
    default_field_types = {
        "str": '"string"',
        "int": "0",
        "float": "0.0",
        "bool": "True"
    }
    for custom_object in ordered_custom_objects:
        assert len(custom_object) == 1
        custom_object_name = list(custom_object.keys())[0]
        custom_object_data = custom_object[custom_object_name]
        fields = []
        config_fields = []
        for field_name, field_data in custom_object_data["fields"].items():
            field_type = field_data["type"]
            if field_type in field_type_map:
                field_type = field_type_map[field_type]
            if field_data["is_list"]:
                field_type = f"List[{field_type}]"
            if field_data["is_optional"]:
                field_type = f"{field_type} | None = None"
            if field_data["is_optional"]:
                config_fields.append(config_field_template.format(field_name=field_name, field_default="None"))
            elif field_data["is_list"]:
                config_fields.append(config_field_template.format(field_name=field_name, field_default="[]"))
            else:
                config_fields.append(
                    config_field_template.format(field_name=field_name,
                                                 field_default=default_field_types[field_type]))
            fields.append(field_template.format(field_name, field_type))
        if len(config_fields) > 0:
            config_extra = config_extra_start + \
                           config_extra_middle_piece.format(field_pieces=", ".join(config_fields)) + \
                           config_extra_end
            base_models_template += object_template.format(name=custom_object_name,
                                                           fields="\n    ".join(fields),
                                                           config=config_template.format(extra=config_extra) if len(
                                                               config_fields) > 0 else "")
        else:
            base_models_template += object_template.format(name=custom_object_name,
                                                           fields="\n    ".join(fields),
                                                           config="")
        base_models_template += "\n"

    for custom_input_object in ordered_custom_input_objects:
        assert len(custom_input_object) == 1
        custom_input_object_name = list(custom_input_object.keys())[0]
        custom_input_object_data = custom_input_object[custom_input_object_name]
        fields = []
        config_fields = []
        for field_name, field_data in custom_input_object_data["fields"].items():
            field_type = field_data["type"]
            if field_type in field_type_map:
                field_type = field_type_map[field_type]
            if field_data["is_list"]:
                field_type = f"List[{field_type}]"
            if field_data["is_optional"]:
                field_type = f"{field_type} | None = None"
            if field_data["is_optional"]:
                config_fields.append(config_field_template.format(field_name=field_name, field_default="None"))
            elif field_data["is_list"]:
                config_fields.append(config_field_template.format(field_name=field_name, field_default="[]"))
            else:
                config_fields.append(
                    config_field_template.format(field_name=field_name,
                                                 field_default=default_field_types[field_type]))
            fields.append(field_template.format(field_name, field_type))
        if len(config_fields) > 0:
            config_extra = config_extra_start + \
                           config_extra_middle_piece.format(field_pieces=", ".join(config_fields)) + \
                           config_extra_end
            base_models_template += object_template.format(name=custom_input_object_name,
                                                           fields="\n    ".join(fields),
                                                           config=config_template.format(extra=config_extra) if len(
                                                               config_fields) > 0 else "")
        else:
            base_models_template += object_template.format(name=custom_input_object_name,
                                                           fields="\n    ".join(fields),
                                                           config="")
        base_models_template += "\n"

    base_models_template = base_models_template.rstrip("\n")
    base_models_template += "\n"
    with open("generated_types.py", "w") as f:
        f.write(base_models_template)

    action_template = """import logging

from fastapi import APIRouter, Depends, Request
from pysura.faster_api.security import backend_auth, UserIdentity, identity, firebase_jwt_auth, IDENTITY_PROVIDER
from pysura.faster_api.enums import ApiResponse, ClientRole
from generated_types import *

ROUTE = "/SNAKE/"
ALLOWED_ROLES = [
    # ALLOWED ROLES HERE
]
SNAKE_router = APIRouter(
    tags=["SNAKE"]
)


@action_SNAKE_router.post(ROUTE,
                          dependencies=[Depends(backend_auth)])
@identity(allowed_roles=ALLOWED_ROLES,
          identity_provider=IDENTITY_PROVIDER,
          function_input=CAMELInput)
async def action_base_generator_mutation(_: Request,
                                         base_generator_mutation_input: CAMELInput | None = None,
                                         injected_user_identity: UserIdentity | None = None
                                         ):
    # (AUTH-LOCK-START) - DO NOT DELETE THIS LINE!
    if injected_user_identity is None or injected_user_identity.user_id is None:
        return {
            "response_name": ApiResponse.UNAUTHORIZED.name,
            "response_value": ApiResponse.UNAUTHORIZED.value
        }
    logging.log(logging.INFO, f"User {injected_user_identity.user_id} is authorized to access {ROUTE}")
    # (AUTH-LOCK-END) - DO NOT DELETE THIS LINE!

    # (BUSINESS-LOGIC-START) - DO NOT DELETE THIS LINE!
    print(base_generator_mutation_input)
    response = CAMELOutput(
        data=None,
        nodes=None,
        response_name=ApiResponse.SUCCESS.name,
        response_value=ApiResponse.SUCCESS.value
    ).dict()
    return response
    # (BUSINESS-LOGIC-END) - DO NOT DELETE THIS LINE!

"""
    actions_list = []
    action_init = """"""
    action_routers = []
    for action in hasura_metadata.get("actions", []):
        action_handler = action.get("definition", {}).get("handler", None)
        if action_handler == service_url:
            snake_replace = action["name"]
            camel_replace = snake_replace.replace("_", " ").title().replace(" ", "")
            action_template = action_template.replace("SNAKE", snake_replace).replace("CAMEL", camel_replace)
            collect_perms = []
            for permission in action["permissions"]:
                collect_perms.append(permission["role"])
            else:
                collect_perms.append("admin")
            collect_perms = [f"ClientRole.{i}.name" for i in sorted(list(set(collect_perms)))]
            action_template = action_template.replace("# ALLOWED ROLES HERE", ", ".join(collect_perms))
            with open(f"actions/action_{snake_replace}.py", "w") as f:
                f.write(action_template)
            action_init += f"from actions.action_{snake_replace} import {snake_replace}_router\n"
            action_routers.append(f"{snake_replace}_router")

    action_init += f"action_routers = [{', '.join(action_routers)}]"
    with open("actions/__init__.py", "w") as f:
        f.write(action_init)





with open("pysura_metadata.json", "r") as f:
    data = json.load(f)

router_generator(data)
