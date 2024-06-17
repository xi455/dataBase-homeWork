import sys
import os 

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import csv
from until import main

def clear_table_id():
    table_path = "/Users/hongchengxi/Documents/dataBaseManage/資料庫管理/table"
    table_files = os.listdir(table_path)

    for table in table_files:
        if table == ".DS_Store" or table == "__init__.py" or table == "__pycache__" or table == "main.py" or table == "separate_main_table.py" or table == "main.py":
            continue

        with open(f"{table_path}/{table}", "r") as csv_file:
            reader = csv.reader(csv_file)
            table_data = [row for row in reader]

        with open(f"{table_path}/{table}", "w") as csv_file:
            writer = csv.writer(csv_file)
            for index, row in enumerate(table_data):
                # if index == 0:
                #     row[0] = "id"
                writer.writerow(row[1:])

        print(f"{table} is aleady clear id!")

    table_path = "/Users/hongchengxi/Documents/dataBaseManage/資料庫管理/fk_table"
    table_files = os.listdir(table_path)

    for table in table_files:
        if table == ".DS_Store" or table == "__init__.py" or table == "__pycache__" or table == "main.py" or table == "separate_main_table.py" or table == "main.py":
            continue

        with open(f"{table_path}/{table}", "r") as csv_file:
            reader = csv.reader(csv_file)
            table_data = [row for row in reader]

        with open(f"{table_path}/{table}", "w") as csv_file:
            writer = csv.writer(csv_file)
            for index, row in enumerate(table_data):
                # if index == 0:
                #     row[0] = "id"
                writer.writerow(row[1:])

        print(f"{table} is aleady clear id!")

def get_fk_table_data(fk_table_title):
    with open(f"/Users/hongchengxi/Documents/dataBaseManage/資料庫管理/fk_table/{fk_table_title}.csv", "r") as csv_file:
        reader = csv.reader(csv_file)
        next(reader)
        data = {row[1]: row[0] for row in reader}

    return data

def read_handle_table_data(table_data_dict):
    for table, field_index in table_data_dict.items():
        table_data = list()
        with open(f"/Users/hongchengxi/Documents/dataBaseManage/資料庫管理/table/{table}.csv", "r") as csv_file:
            reader = csv.reader(csv_file)
            table_title = next(reader)

            for i, row in enumerate(reader):

                table_data.append([row[index] for index in range(len(row))])

                for index in field_index.keys():
                    if table_data[i][index]:
                        table_data[i][index] = field_index[index][row[index]]

            table_data.insert(0, table_title)
            edit_table_data(table, table_data)

def edit_table_data(table, table_data):
    with open(f"/Users/hongchengxi/Documents/dataBaseManage/資料庫管理/table/{table}.csv", "w") as csv_file:
        csvwrite = csv.writer(csv_file)
        for row in table_data:
            csvwrite.writerow(row)
        print(f"{table}.csv is aleady edit!")

if __name__ == "__main__":

    data_json = main.read_json_file()["formalization_fields"]

    table_data_dict = {
        table: dict() for table in data_json.keys()
    }

    for tables, fk_tables in data_json.items():
        for fk_table_title, field in fk_tables.items():
            table_data_dict[tables][field] = get_fk_table_data(fk_table_title)

    data_table_dict = main.read_json_file()["table"]

    table_data_dict_2 = dict()
    data_json = main.read_json_file()["data_base"]["data_base_field_index"]

    for table, fk_table in table_data_dict.items():
        table_data_dict_2[table] = dict()
        data_table_dict_title_list = [_ for _ in data_table_dict[table]]
        for key, fields in fk_table.items():
            if table == "accident_records":
                table_data_dict_2[table][data_table_dict_title_list.index(key) + 1] = fields
            else:
                table_data_dict_2[table][data_table_dict_title_list.index(key) + 2] = fields

    read_handle_table_data(table_data_dict_2)

    clear_table_id()