-- Lab - Loading data - COPY command - CSV
CREATE TABLE [pool_logdata]
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

COPY INTO [pool_logdata] FROM 'https://datalake244434.blob.core.windows.net/csv/Log.csv'
WITH(
    FILE_TYPE='CSV',
    CREDENTIAL=(IDENTITY='Storage Account Key',SECRET='vDV2bSKSR44lbE6x05HtFz57DvlK3O2WNkb11te+H+GrBjeXCojnHjiTw3KdYBWXJRSAnOAZNdgB+AStAasz8w=='),
    FIRSTROW=2)

SELECT * FROM [pool_logdata]
