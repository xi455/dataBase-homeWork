import os
import csv

def read_csv_file(file_path, accident_path):
    data = list()

    with open(file_path, 'r', newline='', encoding="UTF-8") as csvfile:
        csv_reader = csv.reader(csvfile)
        delete_index = [46, 42, 40, 39, 35, 33, 27, 26, 25, 24, 23, 14]
        for row in csv_reader:
            for d_index in delete_index:
                row.pop(d_index)
            data.append(row)

    write_csv_file(accident_path, data)

def write_csv_file(accident_path, data):
    with open(accident_path, 'a', newline='', encoding="UTF-8") as csvfile:
        csv_writer = csv.writer(csvfile)

        for row in data:
            csv_writer.writerow(row)

def read_csv_files_in_folder(folder_path):
    file_names = os.listdir(folder_path)
    for file_name in file_names:
        if file_name not in ("new109.csv", "new110.csv", "new111.csv", "handle_total.py", "organising_materials.py"):
            read_csv_file(file_name, "new109.csv")


if __name__ == "__main__":
    with open("new109.csv", 'w', newline='', encoding="UTF-8") as csvfile:
        csvwrite = csv.writer(csvfile)
        csvwrite.writerow("")

    title_bool = False
    read_csv_files_in_folder("D:/DataBaseManageSystem/tmp/csv")