import json


def convert_to_json(jsonfilepath):
    print(jsonfilepath)
    with open(jsonfilepath, 'r', encoding='utf-8') as f:
            my_data = json.load(f)  # 👈️ parse the JSON with load()
            print("json Data")
            print(my_data)
    return my_data
