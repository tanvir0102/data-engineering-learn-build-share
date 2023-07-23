-- Lab - Windowing Functions


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
    DISTRIBUTION = HASH ([Operation name])
)

SELECT
ROW_NUMBER() OVER(PARTITION BY [Operation name] ORDER BY [Event category]) AS "Event Category",
[Operation name],[Event category],[Resource type],[Resource]
FROM [dbo].[logdata]
ORDER BY [Operation name]

