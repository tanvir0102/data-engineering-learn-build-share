-- Lab - Switching Partitions

CREATE TABLE [logdata_new]
WITH
(
DISTRIBUTION = HASH ([Operation name]),
PARTITION ( [Time] RANGE RIGHT FOR VALUES
            ('2023-02-01','2023-03-01','2023-04-01')

   ) ) 
AS
SELECT * 
FROM logdata
WHERE 1=2

ALTER TABLE [logdata] SWITCH PARTITION 2 TO [logdata_new] PARTITION 1;

SELECT count(*) FROM [logdata_new]
SELECT FORMAT(Time,'yyyy-MM-dd') AS dt,COUNT(*) FROM logdata_new
GROUP BY FORMAT(Time,'yyyy-MM-dd')

-- See the data in the original table

SELECT FORMAT(Time,'yyyy-MM-dd') AS dt,COUNT(*) FROM logdata
GROUP BY FORMAT(Time,'yyyy-MM-dd')

