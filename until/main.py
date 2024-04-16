import json

def read_json_file():
    global datajson

    if datajson is not None:
        return datajson

    with open("/Users/hongchengxi/Documents/dataBaseManage/dataBase.json", 'r') as file:
        datajson = json.load(file)

    return datajson

def print_dict(data):
    for key, value in data.items():
        print(f'"{key}": {value},')

def print_str_to_list(data):
    data_list = data.split(',')
    for value in data_list:
        print(f'"{value}",')

def print_str_to_field_dict(data):
    if isinstance(data, str):
        data = data.split(',')

    data_json = read_json_file()
    total_field = data_json["data_base_init_field_index"]
    result = dict()

    for key, index in total_field.items():
        if key in data:
            result[key] = index

    for key, index in result.items():
        print(f'"{key}": {index},')

datajson = None