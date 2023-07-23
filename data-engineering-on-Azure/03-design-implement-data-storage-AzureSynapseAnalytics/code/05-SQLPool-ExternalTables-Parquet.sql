-- Lab - SQL Pool - External Tables - Parquet

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'P@ssw0rd@123';

-- Here we are using the Storage account key for authorization

CREATE DATABASE SCOPED CREDENTIAL SasToken
WITH IDENTITY='SHARED ACCESS SIGNATURE'
, SECRET = 'sv=2021-12-02&ss=b&srt=sco&sp=rwl&se=2023-04-26T21:14:21Z&st=2023-04-26T13:14:21Z&spr=https&sig=rqBhNq4McZlZUMY2QP2mDnzZWgb9eZt1YTviVtVjWIo%3D';

-- When it comes to Dedicated SQL pool
-- https://learn.microsoft.com/en-us/azure/synapse-analytics/sql/create-use-external-tables
-- For CSV files, we need to use the Hadoop driver in the TYPE when mentioning the data source
-- But if we do this, we get the error Hadoop 
-- The native driver is supported for Partquet based files

CREATE EXTERNAL DATA SOURCE log_data_parquet
WITH (    LOCATION   = 'https://datalake2000233.dfs.core.windows.net/parquet',
          CREDENTIAL = SasToken
)

CREATE EXTERNAL FILE FORMAT parquetfile  
WITH (  
    FORMAT_TYPE = PARQUET,  
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'  
);


CREATE EXTERNAL TABLE [logdata_parquet]
(
    [Correlationid] [varchar](200) NULL,
	[Operationname] [varchar](200) NULL,
	[Status] [varchar](100) NULL,
	[Eventcategory] [varchar](100) NULL,
	[Level] [varchar](100) NULL,
	[Time] [varchar](500) NULL,
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


SELECT * FROM logdata_parquet

