import os
import csv

# 读取CSV文件示例
def read_csv_file(file_path):
    data = list()

    with open(file_path, 'r', newline='', encoding="UTF-8") as csvfile:
        csv_reader = csv.reader(csvfile)
        
        next(csv_reader)
        for row in csv_reader:
            data.append(row)

    return data

def write_csv_file(data):
    with open("total.csv", 'w', newline='', encoding="UTF-8") as csvfile:
        csvwrite = csv.writer(csvfile)

        for index, row in enumerate(data, start=1):
            csvwrite.writerow([index] + row)

if __name__ == "__main__":
    data = list()
    for year in ("109", "110", "111"):
        path = f"/Users/hongchengxi/Documents/dataBaseManage/new{year}.csv"
        print(path)
        result = read_csv_file(path)
        print(len(result))
        data += result

    write_csv_file(data)