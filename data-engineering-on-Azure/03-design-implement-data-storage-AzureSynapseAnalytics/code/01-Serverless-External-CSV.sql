-- Lab - External Tables - CSV file

-- First we need to create a database in the serverless pool
CREATE DATABASE [appdb]

-- Here we are creating a database master key. This key will be used to protect the Shared Access Signature which is specified in the next step
-- Ensure to switch the context to the new database first

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'P@ssw0rd@123';

-- Here we are using the Shared Access Signature to authorize the use of the Azure Data Lake Storage account

CREATE DATABASE SCOPED CREDENTIAL SasToken
WITH IDENTITY='SHARED ACCESS SIGNATURE'
, SECRET = 'sv=2021-12-02&ss=b&srt=sco&sp=rwl&se=2023-04-26T21:14:21Z&st=2023-04-26T13:14:21Z&spr=https&sig=rqBhNq4McZlZUMY2QP2mDnzZWgb9eZt1YTviVtVjWIo%3D';

-- This defines the source of the data. 

CREATE EXTERNAL DATA SOURCE log_data
WITH (    LOCATION   = 'https://datalake2000233.dfs.core.windows.net/csv',
          CREDENTIAL = SasToken
)

/* This creates an External File Format object that defines the external data that can be 
present in Hadoop, Azure Blob storage or Azure Data Lake Store

Here with FIRST_ROW, we are saying please skip the first row because this contains header information
*/

CREATE EXTERNAL FILE FORMAT TextFileFormat WITH (  
      FORMAT_TYPE = DELIMITEDTEXT,  
    FORMAT_OPTIONS (  
        FIELD_TERMINATOR = ',',
        FIRST_ROW = 2))

-- Here we define the external table

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
    [Resource] [varchar](2000) NULL)
WITH (
 LOCATION = '/Log.csv',
    DATA_SOURCE = log_data,  
    FILE_FORMAT = TextFileFormat
)

-- If you made a mistake with the table, you can drop the table and recreate it again
DROP EXTERNAL TABLE [logdata]

/*
Common errors

1. External table 'logdata' is not accessible because location does not exist or it is used by another process. 
Here your Shared Access Siganture is an issue. Ensure to create the right Shared Access Siganture

2. Msg 16544, Level 16, State 3, Line 34
The maximum reject threshold is reached.
This happens when you try to select the rows of data from the table. This can happen if the rows are not matching the schema defined for the table


*/

SELECT * FROM [logdata]


SELECT [Operation name] , COUNT([Operation name]) as [Operation Count]
FROM [logdata]
GROUP BY [Operation name]
ORDER BY [Operation Count]