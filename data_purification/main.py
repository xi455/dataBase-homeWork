import os
import csv
import json

class csvPath:
    defult_path = "/Users/hongchengxi/Documents/dataBaseManage/data_purification"
    total_folder_path = f"{defult_path}/csv/total"
    vintages_path = f"{total_folder_path}/vintages"
    

class jsonHandle:
    def __init__(self) -> None:
        self.json_path = "/Users/hongchengxi/Documents/dataBaseManage/dataBase.json"

    def get_json_data(self):
        with open(self.json_path, 'r', encoding="UTF-8") as jsonfile:
            data = json.load(jsonfile)
            return data

class csvPurification:
    def __init__(self) -> None:
        self.existing_time_location = list()
        self.json_data = jsonHandle().get_json_data()

    def ensure_dir(self, directory_path):
        if not os.path.exists(directory_path):
            os.makedirs(directory_path)

    def ensure_csv_folder(self, folder_path):
        assert os.path.exists(folder_path), f"{folder_path} not found."

    def purification(self, row):
        if "資料提供日期" in row[0]:
            return None
        elif "事故類別" in row[0]:
            return None
        elif "無或物(動物、堆置物)" in row[36]:
            return None
        
        time_location = f"{row[2]}{row[3]}{row[4]}{row[6]}"
        if time_location in self.existing_time_location:
            return None
        
        self.existing_time_location.append(time_location)

        row = [row[i - 1] for i in self.json_data["data_base"]["data_base_init_field_index"].values()]
        return row
    
    def init_csv_files_in_folder(self, path):
        with open(path, "w", encoding="utf-8") as csvfile:
            csvwrite = csv.writer(csvfile)
            csvwrite.writerow(["id"] + [title for title in self.json_data["data_base"]["data_base_init_field_index"].keys()])

    def read_csv_files_in_folder(self, year):
        path = f"{csvPath.defult_path}/{year}年傷亡道路交通事故資料"            
        self.ensure_csv_folder(path)

        file_names = os.listdir(path)

        for file_name in file_names:
            csv_data = list()
            if file_name not in ("file.csv", "manifest.csv", "schema-file.csv"):
                with open(f"{path}/{file_name}", 'r', newline='', encoding="UTF-8") as csvfile:
                    csv_reader = csv.reader(csvfile)
                    next(csv_reader)

                    for row in csv_reader:
                        result = self.purification(row)

                        if result:
                            csv_data.append(result)            

                csv_data[-1][-1].strip("\n")
                print(f"{file_name} is read success.")

                self.write_csv_files_in_folder(year, csv_data)
                self.existing_time_location.clear()


    def write_csv_files_in_folder(self, year, data):
        path = f"{csvPath.vintages_path}/new{year}.csv"
        with open(path, 'a', newline='', encoding="UTF-8") as csvfile:
            csvwrite = csv.writer(csvfile)
            
            for row in data:
                csvwrite.writerow(row)
            
            print(f"new{year}.csv Write csv file success.")

    def conform_total_files(self):
        path = f"{csvPath.total_folder_path}/total.csv"
        self.init_csv_files_in_folder(path)

        vintages_path = csvPath.vintages_path
        file_names = os.listdir(vintages_path)

        csv_data = list()
        for file_name in file_names:
            with open(f"{vintages_path}/{file_name}", "r", encoding="utf-8") as csvfile:
                csv_reader = csv.reader(csvfile)
                next(csv_reader)

                for row in csv_reader:
                    csv_data.append(row)
            
            print(f"{file_name} is read success.")

        with open(path, "a", encoding="utf-8") as csvfile:
            csvwrite = csv.writer(csvfile)
            
            for index, row in enumerate(csv_data, start=1):
                csvwrite.writerow([index] + row)
            
            print("total.csv is write success.")


if __name__ == "__main__":
    purification = csvPurification()
    for year in range(109, 112):
        purification.init_csv_files_in_folder(f"{csvPath.vintages_path}/new{year}.csv")
        purification.read_csv_files_in_folder(year)

    purification.init_csv_files_in_folder(f"{csvPath.total_folder_path}/total.csv")
    purification.ensure_dir(csvPath.vintages_path)
    purification.conform_total_files()