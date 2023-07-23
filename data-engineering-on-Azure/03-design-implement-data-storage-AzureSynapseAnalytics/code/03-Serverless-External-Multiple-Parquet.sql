-- Lab - External Tables - Multiple Parquet files

DROP EXTERNAL TABLE [logdata_parquet]

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
 LOCATION = '/',
    DATA_SOURCE = log_data_parquet,  
    FILE_FORMAT = parquetfile
)