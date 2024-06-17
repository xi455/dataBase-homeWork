create database if not exists car_accident character set UTF8;

use car_accident;

drop table if exists party_info;
drop table if exists cause_analysis;
drop table if exists traffic_facilities;
drop table if exists road_conditions;
drop table if exists accident_records;

drop table if exists unit_name;
drop table if exists vehicle_type;

/* 處理單位名稱警局層*/

CREATE TABLE unit_name(
	id INT(3) AUTO_INCREMENT PRIMARY KEY,
	處理單位名稱警局層 VARCHAR(10)
);

/*當事者區分-類別-大類別名稱-車種*/

CREATE TABLE vehicle_type(
	id INT(3) AUTO_INCREMENT PRIMARY KEY,
	當事者區分_類別_大類別名稱_車種 VARCHAR(15)
);

LOAD DATA INFILE '/home/資料庫管理/fk_table/unit_name.csv' 
INTO TABLE unit_name
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(處理單位名稱警局層);

LOAD DATA INFILE '/home/資料庫管理/fk_table/vehicle_type.csv' 
INTO TABLE vehicle_type
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(當事者區分_類別_大類別名稱_車種);

-- Create the accident_records table
CREATE TABLE accident_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    發生年度 VARCHAR(4),
    發生月份 VARCHAR(2),
    發生日期 VARCHAR(8),
    發生時間 VARCHAR(6),
    事故類別名稱 VARCHAR(2),
    處理單位名稱警局層 INT,
    發生地點 VARCHAR(80),
    天候名稱 VARCHAR(3),
    光線名稱 VARCHAR(20),
    經度 DECIMAL(9, 6),
    緯度 DECIMAL(9, 6),
    FOREIGN KEY (處理單位名稱警局層) REFERENCES unit_name(id)
);

-- Create the party_info table
CREATE TABLE party_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    accident_id INT,
    當事者區分_類別_大類別名稱_車種 INT(2) DEFAULT NULL,
    當事者性別名稱 VARCHAR(15),
    當事者事故發生時年齡 INT(3),
    保護裝備名稱 VARCHAR(25),
    當事者行動狀態子類別名稱 VARCHAR(10),
    車輛撞擊部位子類別名稱_最初 VARCHAR(10),
    車輛撞擊部位大類別名稱_其他 VARCHAR(25),
    車輛撞擊部位子類別名稱_其他 VARCHAR(10),
    FOREIGN KEY (accident_id) REFERENCES accident_records(id),
    FOREIGN KEY (當事者區分_類別_大類別名稱_車種) REFERENCES vehicle_type(id) ON DELETE SET NULL
);

-- Create the cause_analysis table
CREATE TABLE cause_analysis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    accident_id INT,
    肇因研判大類別名稱_主要 VARCHAR(15),
    肇因研判子類別名稱_主要 VARCHAR(25),
    肇因研判子類別名稱_個別 VARCHAR(25),
    肇事逃逸類別名稱_是否肇逃 VARCHAR(2),
    FOREIGN KEY (accident_id) REFERENCES accident_records(id)
);

-- Create the traffic_facilities table
CREATE TABLE traffic_facilities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    accident_id INT,
    號誌_號誌種類名稱 VARCHAR(20),
    號誌_號誌動作名稱 VARCHAR(3),
    FOREIGN KEY (accident_id) REFERENCES accident_records(id)
);

-- Create the road_conditions table
CREATE TABLE road_conditions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    accident_id INT,
    道路型態大類別名稱 VARCHAR(4),
    道路型態子類別名稱 VARCHAR(10),
    事故位置大類別名稱 VARCHAR(4),
    路面狀況_路面鋪裝名稱 VARCHAR(4),
    路面狀況_路面狀態名稱 VARCHAR(2),
    路面狀況_路面缺陷名稱 VARCHAR(10),
    道路障礙_障礙物名稱 VARCHAR(10),
    道路障礙_視距品質名稱 VARCHAR(10),
    道路障礙_視距名稱 VARCHAR(10),
    FOREIGN KEY (accident_id) REFERENCES accident_records(id)
);


LOAD DATA INFILE '/home/資料庫管理/table/accident_records.csv' 
INTO TABLE accident_records
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(發生年度, 發生月份, 發生日期, 發生時間, 事故類別名稱, 處理單位名稱警局層, 發生地點, 天候名稱, 光線名稱, 經度, 緯度);

LOAD DATA INFILE '/home/資料庫管理/table/party_info.csv' 
INTO TABLE party_info
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@col2, @col3, @col4, @col5, @col6, @col7, @col8, @col9, @col10)
SET 
    accident_id = @col2,
    當事者區分_類別_大類別名稱_車種 = NULLIF(@col3, ''),
    當事者性別名稱 = @col4,
    當事者事故發生時年齡 = @col5,
    保護裝備名稱 = @col6,
    當事者行動狀態子類別名稱 = @col7,
    車輛撞擊部位子類別名稱_最初 = @col8,
    車輛撞擊部位大類別名稱_其他 = @col9,
    車輛撞擊部位子類別名稱_其他 = @col10;

LOAD DATA INFILE '/home/資料庫管理/table/cause_analysis.csv' 
INTO TABLE cause_analysis
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(accident_id, 肇因研判大類別名稱_主要, 肇因研判子類別名稱_主要, 肇因研判子類別名稱_個別, 肇事逃逸類別名稱_是否肇逃);

LOAD DATA INFILE '/home/資料庫管理/table/traffic_facilities.csv' 
INTO TABLE traffic_facilities
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(accident_id, 號誌_號誌種類名稱, 號誌_號誌動作名稱);

LOAD DATA INFILE '/home/資料庫管理/table/road_conditions.csv' 
INTO TABLE road_conditions
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(accident_id, 道路型態大類別名稱, 道路型態子類別名稱, 事故位置大類別名稱, 路面狀況_路面鋪裝名稱, 路面狀況_路面狀態名稱, 路面狀況_路面缺陷名稱, 道路障礙_障礙物名稱, 道路障礙_視距品質名稱, 道路障礙_視距名稱);