-- Lab - Partitioned Tables

SELECT FORMAT(Time,'yyyy-MM-dd') AS dt,COUNT(*) AS 'Number of Operations' FROM [logdata]
GROUP BY FORMAT(Time,'yyyy-MM-dd')

-- Let's drop the existing table if its exists
DROP TABLE logdata


-- Let's create a new table with partitions

CREATE TABLE [logdata]
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
WITH  
(   
    DISTRIBUTION = HASH ([Operation name]),
    PARTITION ( [Time] RANGE RIGHT FOR VALUES
            ('2023-01-01','2023-02-01','2023-03-01','2023-04-01'))
)

-- You will see 5 partitions , one is for those values prior to 2023-01-01

