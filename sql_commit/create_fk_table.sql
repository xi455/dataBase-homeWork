create database if not exists group_opendata character set UTF8;

use group_opendata;

drop table if exists accidient_location;
drop table if exists action_status;
drop table if exists big_road_type;
drop table if exists gender;
drop table if exists light;
drop table if exists log_action;
drop table if exists log_type;
drop table if exists protective_equipment;
drop table if exists roadblocks_visibility;
drop table if exists roadblocks_visibility_quality;
drop table if exists road_obstacle;
drop table if exists road_surface_condition;
drop table if exists road_surface_defect;
drop table if exists road_surface_paving;
drop table if exists small_road_type;
drop table if exists unit_name;
drop table if exists vehicle_categories;
drop table if exists vehicle_type;
drop table if exists weather;

/*事故位置大類別名稱*/

CREATE TABLE accidient_location(
	loc_id INT(1) PRIMARY KEY,
	acc_loc VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/table/accidient_location.csv' 
INTO TABLE accidient_location
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*當事者行動狀態子類別名稱*/

CREATE TABLE action_status(
	acc_id INT(2) PRIMARY KEY,
	acc_status VARCHAR(15)
);
LOAD DATA INFILE 'C:/tmp/table/action_status.csv' 
INTO TABLE action_status
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


/*道路型態大類別名稱*/

CREATE TABLE big_road_type(
	bigroad_id INT(1) PRIMARY KEY,
	big_road_type VARCHAR(5)
);
LOAD DATA INFILE 'C:/tmp/table/big_road_type.csv' 
INTO TABLE big_road_type
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*當事者性別名稱*/

CREATE TABLE gender(
	gender_id INT(1) PRIMARY KEY,
	gender VARCHAR(15)
);
LOAD DATA INFILE 'C:/tmp/table/gender.csv' 
INTO TABLE gender
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*光線名稱*/

CREATE TABLE light(
	light_id INT(1) PRIMARY KEY,
	light VARCHAR(20)
);
LOAD DATA INFILE 'C:/tmp/table/light.csv' 
INTO TABLE light
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*號誌-號誌動作名稱*/

CREATE TABLE log_action(
	log_id INT(1) PRIMARY KEY,
	log_act VARCHAR(15)
);
LOAD DATA INFILE 'C:/tmp/table/log_action.csv' 
INTO TABLE log_action
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


/*號誌-號誌種類名稱*/

CREATE TABLE log_type(
	log_type_id INT(1) PRIMARY KEY,
	log_type VARCHAR(20)
);
LOAD DATA INFILE 'C:/tmp/table/log_type.csv' 
INTO TABLE log_type
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*保護裝備名稱*/

CREATE TABLE protective_equipment(
	equipment_id INT(1) PRIMARY KEY,
	protect_equip VARCHAR(30)
);
LOAD DATA INFILE 'C:/tmp/table/protective_equipment.csv' 
INTO TABLE protective_equipment
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*道路障礙-視距名稱*/

CREATE TABLE roadblocks_visibility(
	id INT(11) PRIMARY KEY,
	roadblocks_visibility VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/table/roadblocks_visibility.csv' 
INTO TABLE roadblocks_visibility
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*道路障礙-視距品質名稱*/

CREATE TABLE roadblocks_visibility_quality(
	id INT(1) PRIMARY KEY,
	roadblocks_visibility_quality VARCHAR(5)
);
LOAD DATA INFILE 'C:/tmp/table/roadblocks_visibility_quality.csv' 
INTO TABLE roadblocks_visibility_quality
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*道路障礙-障礙物名稱*/

CREATE TABLE road_obstacle(
	obstacle_id INT(1) PRIMARY KEY,
	road_obs VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/table/road_obstacle.csv' 
INTO TABLE road_obstacle
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*路面狀況-路面狀態名稱*/

CREATE TABLE road_surface_condition(
	r_condition_id INT(1) PRIMARY KEY,
	r_surface_condition VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/table/road_surface_condition.csv' 
INTO TABLE road_surface_condition
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*路面狀況-路面缺陷名稱*/

CREATE TABLE road_surface_defect(
	r_defect_id INT(1) PRIMARY KEY,
	r_surface_defect VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/table/road_surface_defect.csv' 
INTO TABLE road_surface_defect
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*路面狀況-路面鋪裝名稱*/

CREATE TABLE road_surface_paving(
	r_paving_id INT(1) PRIMARY KEY,
	r_surface_paving VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/table/road_surface_paving.csv' 
INTO TABLE road_surface_paving
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*道路型態子類別名稱*/

CREATE TABLE small_road_type(
	smallroad_id INT(2) PRIMARY KEY,
	small_road_type VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/table/small_road_type.csv' 
INTO TABLE small_road_type
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


/* 處理單位名稱警局層*/

CREATE TABLE unit_name(
	unit_id INT(2) PRIMARY KEY,
	unit_name VARCHAR(10)
);
LOAD DATA INFILE 'C:/tmp/table/unit_name.csv' 
INTO TABLE unit_name
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*車輛撞擊部位大類別名稱-其他*/

CREATE TABLE vehicle_categories(
	vehicle_id INT(2) PRIMARY KEY,
	vehicle_categories VARCHAR(5)
);
LOAD DATA INFILE 'C:/tmp/table/vehicle_categories.csv' 
INTO TABLE vehicle_categories
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*當事者區分-類別-大類別名稱-車種*/

CREATE TABLE vehicle_type(
	veh_id INT(2) PRIMARY KEY,
	vehicle_typpe VARCHAR(15)
);
LOAD DATA INFILE 'C:/tmp/table/vehicle_type.csv' 
INTO TABLE vehicle_type
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*天候名稱*/
CREATE TABLE weather(
	id INT(2) PRIMARY KEY,
	weather VARCHAR(5)
);
LOAD DATA INFILE 'C:/tmp/table/weather.csv' 
INTO TABLE weather
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
