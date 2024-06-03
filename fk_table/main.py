import sys
import os 

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import csv
from until import main

def get_table_title_index(table_title, fields):
    table_title_name = fields.values()
    table_title_index = []
    for title in table_title_name:
        table_title_index.append(table_title.index(title))
    return table_title_index

def get_table_values(table, fields):
    with open(f"../table/{table}.csv", "r", newline="", encoding="UTF-8") as csvfile:
        csv_reader = csv.reader(csvfile)
        table_title = next(csv_reader)
        table_title_index = get_table_title_index(table_title, fields)
        
        table_data_dict = {
            str(index): set() for index in table_title_index
        }

        for row in csv_reader:
            for index in table_title_index:
                if row[index]:
                    table_data_dict[str(index)].add(row[index])

        table_data = [list(data) for data in table_data_dict.values()]
        
        if locals().get("table_data"):
            return table_data
        
        return None
    
def create_fk_table(fields, table_data):
    for fk_table_name, data in zip(fields.keys(), table_data):
        with open(f"{fk_table_name}.csv", "w", newline="", encoding="UTF-8") as csvfile:
            csv_writer = csv.writer(csvfile)

            data.insert(0, fields[fk_table_name])
            for index, row in enumerate(data, start=0):
                if index == 0:
                    csv_writer.writerow(["id"] + [row])
                    continue

                csv_writer.writerow([index] + [row])

        print(f"{fk_table_name}.csv is aleady write!")

def handle_fk_table():

    data_json = main.read_json_file()
    fk_table_data = data_json["formalization_fields"]
    
    for table, fields in fk_table_data.items():
        table_data = get_table_values(table, fields)
        if table_data:
            create_fk_table(fields, table_data)

if __name__ == "__main__":
    handle_fk_table()