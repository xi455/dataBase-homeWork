# 發生年度,發生月份,發生日期,發生時間,事故類別名稱,處理單位名稱警局層,發生地點,天候名稱,光線名稱,道路類別-第1當事者-名稱,經度,緯度
import sys
import os 

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import csv
from until import main

# 读取CSV文件示例
def read_csv_file(path, fields):
    data = list()
    with open(path, 'r', newline='', encoding="UTF-8") as csvfile:
        csv_reader = csv.reader(csvfile)
        
        for row in csv_reader:
            data.append([row[0]] + [row[index] for index in fields.values()])

    return data

def write_csv_file(table, data):
    with open(f"{table}.csv", 'w', newline='', encoding="UTF-8") as csvfile:
        csvwrite = csv.writer(csvfile)
        for index, row in enumerate(data, start=0):
            if index == 0:
                index = "id"
                row[0] = "accident_id"

            csvwrite.writerow([index] + row)
        print(f"{table}.csv is aleady write!")

def main_init():
    path = f"/Users/hongchengxi/Documents/dataBaseManage/data_purification/csv/total.csv"
    data_json = main.read_json_file()
    data_json = data_json["table"]

    for table, fields in data_json.items():
        data = read_csv_file(path, fields)
        write_csv_file(table, data)
        
if __name__ == "__main__":
    main_init()