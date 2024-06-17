CREATE VIEW view_2020_TO_2022_ACCIDENT AS
SELECT 發生年度, COUNT(*) AS 發生次數
FROM accident_records
GROUP BY 發生年度
ORDER BY 發生次數 DESC;

SELECT
    發生年度 AS Year,
    SUM(CASE WHEN 事故類別名稱 = 'A1’
    THEN 1 ELSE 0 END) AS A1_Count,
    SUM(CASE WHEN 事故類別名稱 = 'A2‘
    THEN 1 ELSE 0 END) AS A2_Count
FROM
    accident_records
GROUP BY
    Year;

SELECT 
    al.acc_loc,
    COUNT(CASE WHEN ar.事故類別名稱 = 'A1' THEN 1 END) AS A1_count,
    COUNT(CASE WHEN ar.事故類別名稱 = 'A2' THEN 1 END) AS A2_count
FROM 
    accident_location al
JOIN 
    road_conditions rc ON al.loc_id = rc.事故位置大類別名稱
JOIN 
    accident_records ar ON rc.accident_id = ar.id
GROUP BY 
    al.acc_loc;

SELECT 
    sr.small_road_type,
    SUM(CASE WHEN ar.事故類別名稱 = 'A1' THEN 1 ELSE 0 END) AS A1_count,
    SUM(CASE WHEN ar.事故類別名稱 = 'A2' THEN 1 ELSE 0 END) AS A2_count
FROM 
    road_conditions rc 
JOIN 
    small_road_type sr ON sr.smallroad_id = rc.道路型態子類別名稱
JOIN 
    accident_records ar ON rc.accident_id = ar.id
GROUP BY 
    sr.small_road_type
ORDER BY 
    A1_count DESC;

SELECT LEFT(發生地點, 3) AS city,
       COUNT(*) AS occurrence_count
FROM accident_records
WHERE 發生年度 = 2022
GROUP BY LEFT(發生地點, 3)
ORDER BY occurrence_count DESC;

SELECT c.肇因研判子類別名稱_主要 AS cause_category, COUNT(*) AS occurrence_count
FROM accident_records a
INNER JOIN cause_analysis c ON a.id = c.id
WHERE LEFT(a.發生地點, 3) = '桃園市'
AND a.發生年度  = 2022
GROUP BY c.肇因研判子類別名稱_主要
ORDER BY occurrence_count DESC;

SELECT c.肇因研判子類別名稱_主要 AS cause_category, COUNT(*) AS occurrence_count
FROM accident_records a
INNER JOIN cause_analysis c ON a.id = c.id
WHERE LEFT(a.發生地點, 3) = '臺南市'
AND a.發生年度  = 2022
GROUP BY c.肇因研判子類別名稱_主要
ORDER BY occurrence_count DESC;

SELECT c.肇因研判子類別名稱_主要 AS cause_category, COUNT(*) AS occurrence_count
FROM accident_records a
INNER JOIN cause_analysis c ON a.id = c.id
WHERE LEFT(a.發生地點, 3) = '新北市'
AND a.發生年度 = 2022
GROUP BY c.肇因研判子類別名稱_主要
ORDER BY occurrence_count DESC;

SELECT c.肇因研判子類別名稱_主要 AS cause_category, COUNT(*) AS occurrence_count
FROM accident_records a
INNER JOIN cause_analysis c ON a.id = c.id
WHERE LEFT(a.發生地點, 3) = '臺中市'
AND a.發生年度  = 2022
GROUP BY c.肇因研判子類別名稱_主要
ORDER BY occurrence_count DESC;

SELECT c.肇因研判子類別名稱_主要 AS cause_category, COUNT(*) AS occurrence_count
FROM accident_records a
INNER JOIN cause_analysis c ON a.id = c.id
WHERE LEFT(a.發生地點, 3) = '高雄市'
AND a.發生年度 = 2022
GROUP BY c.肇因研判子類別名稱_主要
ORDER BY occurrence_count DESC;

CREATE VIEW view_肇逃總數 AS
SELECT COUNT(*)
FROM cause_analysis
WHERE 肇事逃逸類別名稱_是否肇逃 = '是';

CREATE VIEW view_近三年肇逃比率 AS
SELECT 
    accident_records.發生年度 AS 年份,
    SUM(CASE WHEN cause_analysis.肇事逃逸類別名稱_是否肇逃 = '是' THEN 1 ELSE 0 END) AS 肇逃事件數,
    (SUM(CASE WHEN cause_analysis.肇事逃逸類別名稱_是否肇逃 = '是' THEN 1 ELSE 0 END) / (SELECT COUNT(*) FROM  cause_analysis)) * 100 AS 肇逃百分比率
FROM 
    accident_records
JOIN 
   cause_analysis ON accident_records.id = cause_analysis.accident_id
GROUP BY 
    accident_records.發生年度;

SELECT party_info.當事者區分_類別_大類別名稱_車種, COUNT(*) AS amount , vehicle_type.vehicle_type, accident_records.發生年度
FROM party_info
JOIN vehicle_type ON party_info.當事者區分_類別_大類別名稱_車種 = vehicle_type.veh_id
JOIN accident_records ON party_info.accident_id = accident_records.id
WHERE accident_records.發生年度 = 2020
GROUP BY party_info.當事者區分_類別_大類別名稱_車種
ORDER BY amount DESC;
