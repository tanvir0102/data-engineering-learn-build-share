-- Lab - Loading data using Polybase

SELECT * FROM sys.database_scoped_credentials

SELECT * FROM sys.external_data_sources 

SELECT * FROM sys.external_file_formats

SELECT * FROM [logdata_parquet] 

DROP TABLE [pool_logdata_parquet]

CREATE TABLE [pool_logdata_parquet]
WITH
(
DISTRIBUTION = ROUND_ROBIN
)
AS
SELECT  *
FROM  [logdata_parquet];