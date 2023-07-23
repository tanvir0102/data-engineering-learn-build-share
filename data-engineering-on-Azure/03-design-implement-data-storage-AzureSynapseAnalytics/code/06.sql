-- Lab - SQL Pool - External Tables - CSV

CREATE DATABASE SCOPED CREDENTIAL AzureStorageCredential
WITH
  IDENTITY = 'datalake2000233',
  SECRET = 'ZuTNLYAYPx1gmjZHE2+pIizxi4zwOHBYX395HDVQ/wM47yfhHBEBppzMKVegfROIi99SCwCWD04F+AStQjvUxw==';


CREATE EXTERNAL DATA SOURCE log_data
WITH (    LOCATION   = 'abfss://csv@datalake2000233.dfs.core.windows.net',
          CREDENTIAL = AzureStorageCredential,
          TYPE = HADOOP
)


CREATE EXTERNAL FILE FORMAT TextFileFormat WITH (  
      FORMAT_TYPE = DELIMITEDTEXT,  
    FORMAT_OPTIONS (  
        FIELD_TERMINATOR = ',',
        FIRST_ROW = 2))



CREATE EXTERNAL TABLE [logdata]
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
    [Resource] [varchar](2000) NULL
)
WITH (
 LOCATION = '/Log.csv',
    DATA_SOURCE = log_data,  
    FILE_FORMAT = TextFileFormat
)


SELECT * FROM [logdata]

-- Error
-- HdfsBridge::recordReaderFillBuffer - Unexpected error encountered filling record reader buffer: HadoopSqlException: Error converting data type VARCHAR to DATETIME

DROP EXTERNAL TABLE [logdata]

CREATE EXTERNAL TABLE [logdata]
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
    [Resource] [varchar](2000) NULL
)
WITH (
 LOCATION = '/Log.csv',
    DATA_SOURCE = log_data,  
    FILE_FORMAT = TextFileFormat
)


