CREATE TABLE accident_records (
    id INT PRIMARY key,
    發生年度 VARCHAR (4),
    發生月份 VARCHAR (2),
    發生日期 VARCHAR (8),
    發生時間 VARCHAR (6),
    事故類別名稱 VARCHAR (2),
    處理單位名稱警局層 int (2),
    發生地點 VARCHAR (80),
    天候名稱 int (2),
    光線名稱 int (1),
    經度 DECIMAL(9,6),
    緯度 DECIMAL(9,6),
    FOREIGN KEY (處理單位名稱警局層) REFERENCES unit_name(unit_id),
    FOREIGN KEY (天候名稱) REFERENCES weather(id),
    FOREIGN KEY (光線名稱) REFERENCES light(light_id)
);
LOAD DATA INFILE 'C:/tmp/table/accident_records.csv' 
INTO TABLE accident_records
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE party_info (
    id INT PRIMARY key,
    accident_id int ,
    當事者區分_類別_大類別名稱_車種 INT (2),
    當事者性別名稱 INT (1),
    當事者事故發生時年齡 INT (3),
    保護裝備名稱 INT (1),
    當事者行動狀態子類別名稱 INT (2),
    車輛撞擊部位子類別名稱_最初 VARCHAR (10),
    車輛撞擊部位大類別名稱_其他 INT (1),
    車輛撞擊部位子類別名稱_其他 VARCHAR (10),
	 FOREIGN KEY (accident_id) REFERENCES accident_records(id),
	 FOREIGN KEY (當事者區分_類別_大類別名稱_車種) REFERENCES vehicle_type(veh_id),
	 FOREIGN KEY (當事者性別名稱) REFERENCES gender(gender_id),
	 FOREIGN KEY (保護裝備名稱) REFERENCES protective_equipment(equipment_id),
	 FOREIGN KEY (當事者行動狀態子類別名稱) REFERENCES action_status(act_id),
	 FOREIGN KEY (車輛撞擊部位大類別名稱_其他) REFERENCES vehicle_categories(vehicle_id)
);
LOAD DATA INFILE 'C:/tmp/table/party_info.csv' 
INTO TABLE party_info
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE cause_analysis (
    id INT PRIMARY key,
    accident_id int ,
    肇因研判大類別名稱_主要 VARCHAR (5),
    肇因研判子類別名稱_主要 VARCHAR (10),
    肇因研判子類別名稱_個別 VARCHAR (20),
    肇事逃逸類別名稱_是否肇逃 VARCHAR (2),
	 FOREIGN KEY (accident_id) REFERENCES accident_records(id)
);
LOAD DATA INFILE 'C:/tmp/table/cause_analysis.csv' 
INTO TABLE cause_analysis
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE traffic_facilities (
    id INT PRIMARY key,
    accident_id int ,
    號誌_號誌種類名稱 INT (1),
    號誌_號誌動作名稱 INT (1),
	 FOREIGN KEY (accident_id) REFERENCES accident_records(id),
	 FOREIGN KEY (號誌_號誌種類名稱) REFERENCES log_type(log_type_id),
	 FOREIGN KEY (號誌_號誌動作名稱) REFERENCES log_action(log_id)
);

LOAD DATA INFILE 'C:/tmp/table/traffic_facilities.csv' 
INTO TABLE traffic_facilities
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

CREATE TABLE road_conditions (
    id INT PRIMARY key,
    accident_id int ,
    道路型態大類別名稱 INT (1),
    道路型態子類別名稱 INT (2),
    事故位置大類別名稱 INT (1),
    路面狀況_路面鋪裝名稱 INT (1),
    路面狀況_路面狀態名稱 INT (1),
    路面狀況_路面缺陷名稱 INT (1),
    道路障礙_障礙物名稱 INT (1),
    道路障礙_視距品質名稱 INT (1),
    道路障礙_視距名稱 INT (1),
	 FOREIGN KEY (accident_id) REFERENCES accident_records(id),
	 FOREIGN KEY (道路型態大類別名稱) REFERENCES big_road_type(bigroad_id),
	 FOREIGN KEY (道路型態子類別名稱) REFERENCES small_road_type(smallroad_id),
	 FOREIGN KEY (事故位置大類別名稱) REFERENCES accident_location(loc_id),
	 FOREIGN KEY (路面狀況_路面鋪裝名稱) REFERENCES road_surface_paving(r_paving_id),
	 FOREIGN KEY (路面狀況_路面狀態名稱) REFERENCES road_surface_condition(r_condition_id),
	 FOREIGN KEY (路面狀況_路面缺陷名稱) REFERENCES road_surface_defect(r_defect_id),
	 FOREIGN KEY (道路障礙_障礙物名稱) REFERENCES road_obstacle(obstacle_id),
	 FOREIGN KEY (道路障礙_視距品質名稱) REFERENCES roadblocks_visibility_quality(id),
	 FOREIGN KEY (道路障礙_視距名稱) REFERENCES roadblocks_visibility(id)
);

LOAD DATA INFILE 'C:/tmp/table/road_conditions.csv' 
INTO TABLE road_conditions
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;