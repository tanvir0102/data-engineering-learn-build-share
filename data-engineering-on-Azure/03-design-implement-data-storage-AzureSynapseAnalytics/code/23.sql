-- Lab - Reading JSON Data

SELECT TOP 100
    jsonContent
FROM
    OPENROWSET(
        BULK 'https://datalake2000233.dfs.core.windows.net/json/Log.json',
        FORMAT = 'CSV',
        FIELDQUOTE = '0x0b',
        FIELDTERMINATOR ='0x0b',
        ROWTERMINATOR = '0x0a'
    )
    WITH (
        jsonContent varchar(MAX)
    ) AS [rows]


SELECT    
   JSON_VALUE(jsonContent,'$.Correlationid') As Correlationid,
   JSON_VALUE(jsonContent,'$.Operationname') AS Operationname,
   JSON_VALUE(jsonContent,'$.Status') AS Status,
   JSON_VALUE(jsonContent,'$.Eventcategory') AS Eventcategory,
   JSON_VALUE(jsonContent,'$.Level') AS Level,
   CAST(JSON_VALUE(jsonContent,'$.Time') AS datetimeoffset) AS Time,
   JSON_VALUE(jsonContent,'$.Subscription') AS Subscription,
   JSON_VALUE(jsonContent,'$.Eventinitiatedby') AS Eventinitiatedby,
   JSON_VALUE(jsonContent,'$.Resourcetype') AS Resourcetype,
   JSON_VALUE(jsonContent,'$.Resourcegroup') AS Resourcegroup,
   JSON_VALUE(jsonContent,'$.Resource') AS Resource
FROM
    OPENROWSET(
        BULK 'https://datalake2000233.dfs.core.windows.net/json/Log.json',
        FORMAT = 'CSV',
        FIELDQUOTE = '0x0b',
        FIELDTERMINATOR ='0x0b',
        ROWTERMINATOR = '0x0a'
    )
    WITH (
        jsonContent varchar(MAX)
    ) AS [rows]