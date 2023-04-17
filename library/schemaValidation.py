import json
import jsonschema


def validate_json_schema(input_json, reference_schema_path):
    reference_schema = None
    print(reference_schema_path)
    with open(reference_schema_path) as json_file:
        reference_schema = json.load(json_file)
        print(reference_schema_path)
        print(reference_schema)
    jsonschema.validate(instance=input_json, schema=reference_schema)
