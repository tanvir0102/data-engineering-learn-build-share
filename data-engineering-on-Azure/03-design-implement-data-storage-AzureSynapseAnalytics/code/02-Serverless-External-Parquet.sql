-- Lab - External Tables - Parquet file

-- If we need to drop the existing artefacts

DROP EXTERNAL TABLE [logdata]

DROP EXTERNAL DATA SOURCE log_data

DROP DATABASE SCOPED CREDENTIAL SasToken

-- Then we can recreate the required credentials

CREATE DATABASE SCOPED CREDENTIAL SasToken
WITH IDENTITY='SHARED ACCESS SIGNATURE'
, SECRET = 'sv=2021-12-02&ss=b&srt=sco&sp=rwla&se=2023-05-30T21:37:55Z&st=2023-05-02T13:37:55Z&spr=https&sig=tYzY6clu1rElTvnw700MLApKzF3F1b3ChXd49vYa5z0%3D'


CREATE EXTERNAL DATA SOURCE log_data_parquet
WITH (    LOCATION   = 'https://datalake2000233.dfs.core.windows.net/parquet',
          CREDENTIAL = SasToken
)

CREATE EXTERNAL FILE FORMAT parquetfile  
WITH (  
    FORMAT_TYPE = PARQUET,  
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'  
);

-- Here we define the external table


CREATE EXTERNAL TABLE [logdata_parquet]
(
    [Correlation id] [varchar](200) NULL,
	[Operation name] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Event category] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [datetime] NULL,
	[Subscription] [varchar](200) NULL,
	[Event initiated by] [varchar](1000) NULL,
	[Resource type] [varchar](1000) NULL,
	[Resource group] [varchar](1000) NULL,
    [Resource] [varchar](2000) NULL)
WITH (
 LOCATION = '/log.parquet',
    DATA_SOURCE = log_data_parquet,  
    FILE_FORMAT = parquetfile
)

SELECT * FROM [logdata_parquet]

-- Then we will get the error

-- Column 'Time' of type 'DATETIME' is not compatible with external data type 'Parquet physical type: BYTE_ARRAY, logical type: UTF8', please try with 'VARCHAR(8000)'. File/External table name: 'logdata_parquet'.

-- This is because when I converted the CSV file where everything is a string
-- Its also put it as a string in parquet based file.

CREATE EXTERNAL TABLE [logdata_parquet]
(
    [Correlation id] [varchar](200) NULL,
	[Operation name] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Event category] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [varchar](500) NULL,
	[Subscription] [varchar](200) NULL,
	[Event initiated by] [varchar](1000) NULL,
	[Resource type] [varchar](1000) NULL,
	[Resource group] [varchar](1000) NULL,
    [Resource] [varchar](2000) NULL)
WITH (
 LOCATION = '/log.parquet',
    DATA_SOURCE = log_data_parquet,  
    FILE_FORMAT = parquetfile
)


-- Then we cannot see the data in the columns which have a space in the column name

DROP EXTERNAL TABLE [logdata_parquet]

CREATE EXTERNAL TABLE [logdata_parquet]
(
    [Correlationid] [varchar](200) NULL,
	[Operationname] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Eventcategory] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [datetime] NULL,
	[Subscription] [varchar](200) NULL,
	[Eventinitiatedby] [varchar](1000) NULL,
	[Resourcetype] [varchar](1000) NULL,
	[Resourcegroup] [varchar](1000) NULL,
    [Resource] [varchar](2000) NULL)
WITH (
 LOCATION = '/log.parquet',
    DATA_SOURCE = log_data_parquet,  
    FILE_FORMAT = parquetfile
)