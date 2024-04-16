# 發生年度,發生月份,發生日期,發生時間,事故類別名稱,處理單位名稱警局層,發生地點,天候名稱,光線名稱,道路類別-第1當事者-名稱,經度,緯度
import sys
import os 

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import csv
from until import main
import separate_main_table

# 读取CSV文件示例
def read_csv_file(path):
    data = list()
    with open(path, 'r', newline='', encoding="UTF-8") as csvfile:
        csv_reader = csv.reader(csvfile)
        
        for row in csv_reader:
            row = row[1:]
            data.append(row)

    return data

def write_csv_file(table, data):
    with open(f"{table}.csv", 'w', newline='', encoding="UTF-8") as csvfile:
        csvwrite = csv.writer(csvfile)

        for index, row in enumerate(data, start=0):
            if index == 0:
                row[0] = "id"

            csvwrite.writerow(row)
        print(f"{table}.csv is aleady write!")

if __name__ == "__main__":
    separate_main_table.main_init()
    path = f"/Users/hongchengxi/Documents/dataBaseManage/table/accident_records.csv"

    data = read_csv_file(path)

    write_csv_file("accident_records", data)