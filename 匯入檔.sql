CREATE DATABASE midterm
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE midterm;

/*事故位置大類別名稱*/

CREATE TABLE accident_location(
	loc_id INT(1) PRIMARY KEY,
	acc_loc VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/fk_table/accident_location.csv' 
INTO TABLE accident_location
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*當事者行動狀態子類別名稱*/

CREATE TABLE action_status(
	act_id INT(2) PRIMARY KEY,
	act_status VARCHAR(15)
);
LOAD DATA INFILE 'C:/tmp/fk_table/action_status.csv' 
INTO TABLE action_status
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


/*道路型態大類別名稱*/

CREATE TABLE big_road_type(
	bigroad_id INT(1) PRIMARY KEY,
	big_road_type VARCHAR(5)
);
LOAD DATA INFILE 'C:/tmp/fk_table/big_road_type.csv' 
INTO TABLE big_road_type
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*當事者性別名稱*/

CREATE TABLE gender(
	gender_id INT(1) PRIMARY KEY,
	gender VARCHAR(15)
);
LOAD DATA INFILE 'C:/tmp/fk_table/gender.csv' 
INTO TABLE gender
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*光線名稱*/

CREATE TABLE light(
	light_id INT(1) PRIMARY KEY,
	light VARCHAR(20)
);
LOAD DATA INFILE 'C:/tmp/fk_table/light.csv' 
INTO TABLE light
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*號誌-號誌動作名稱*/

CREATE TABLE log_action(
	log_id INT(1) PRIMARY KEY,
	log_act VARCHAR(15)
);
LOAD DATA INFILE 'C:/tmp/fk_table/log_action.csv' 
INTO TABLE log_action
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


/*號誌-號誌種類名稱*/

CREATE TABLE log_type(
	log_type_id INT(1) PRIMARY KEY,
	log_type VARCHAR(20)
);
LOAD DATA INFILE 'C:/tmp/fk_table/log_type.csv' 
INTO TABLE log_type
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*保護裝備名稱*/

CREATE TABLE protective_equipment(
	equipment_id INT(1) PRIMARY KEY,
	protect_equip VARCHAR(30)
);
LOAD DATA INFILE 'C:/tmp/fk_table/protective_equipment.csv' 
INTO TABLE protective_equipment
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*道路障礙-視距名稱*/

CREATE TABLE roadblocks_visibility(
	id INT(11) PRIMARY KEY,
	roadblocks_visibility VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/fk_table/roadblocks_visibility.csv' 
INTO TABLE roadblocks_visibility
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*道路障礙-視距品質名稱*/

CREATE TABLE roadblocks_visibility_quality(
	id INT(1) PRIMARY KEY,
	roadblocks_visibility_quality VARCHAR(5)
);
LOAD DATA INFILE 'C:/tmp/fk_table/roadblocks_visibility_quality.csv' 
INTO TABLE roadblocks_visibility_quality
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*道路障礙-障礙物名稱*/

CREATE TABLE road_obstacle(
	obstacle_id INT(1) PRIMARY KEY,
	road_obs VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/fk_table/road_obstacle.csv' 
INTO TABLE road_obstacle
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*路面狀況-路面狀態名稱*/

CREATE TABLE road_surface_condition(
	r_condition_id INT(1) PRIMARY KEY,
	r_surface_condition VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/fk_table/road_surface_condition.csv' 
INTO TABLE road_surface_condition
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*路面狀況-路面缺陷名稱*/

CREATE TABLE road_surface_defect(
	r_defect_id INT(1) PRIMARY KEY,
	r_surface_defect VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/fk_table/road_surface_defect.csv' 
INTO TABLE road_surface_defect
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*路面狀況-路面鋪裝名稱*/

CREATE TABLE road_surface_paving(
	r_paving_id INT(1) PRIMARY KEY,
	r_surface_paving VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/fk_table/road_surface_paving.csv' 
INTO TABLE road_surface_paving
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*道路型態子類別名稱*/

CREATE TABLE small_road_type(
	smallroad_id INT(2) PRIMARY KEY,
	small_road_type VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/fk_table/small_road_type.csv' 
INTO TABLE small_road_type
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


/* 處理單位名稱警局層*/

CREATE TABLE unit_name(
	unit_id INT(2) PRIMARY KEY,
	unit_name VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/fk_table/unit_name.csv' 
INTO TABLE unit_name
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*車輛撞擊部位大類別名稱-其他*/

CREATE TABLE vehicle_categories(
	vehicle_id INT(2) PRIMARY KEY,
	vehicle_categories VARCHAR(5)
);
LOAD DATA INFILE 'C:/tmp/fk_table/vehicle_categories.csv' 
INTO TABLE vehicle_categories
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*當事者區分-類別-大類別名稱-車種*/

CREATE TABLE vehicle_type(
	veh_id INT(2) PRIMARY KEY,
	vehicle_typpe VARCHAR(15)
);
LOAD DATA INFILE 'C:/tmp/fk_table/vehicle_type.csv' 
INTO TABLE vehicle_type
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*天候名稱*/
CREATE TABLE weather(
	id INT(2) PRIMARY KEY,
	weather VARCHAR(5)
);
LOAD DATA INFILE 'C:/tmp/fk_table/weather.csv' 
INTO TABLE weather
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

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
    肇因研判大類別名稱_主要 VARCHAR (15),
    肇因研判子類別名稱_主要 VARCHAR (25),
    肇因研判子類別名稱_個別 VARCHAR (25),
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