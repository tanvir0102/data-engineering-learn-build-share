-- Lab - OPENROWSET

SELECT *
FROM OPENROWSET(BULK 'https://datalake2000233.dfs.core.windows.net/parquet/*.parquet',
                FORMAT = 'PARQUET') AS [logdata_temp]