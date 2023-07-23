-- Lab - Creating Hash-distributed Tables

-- Let's drop the existing table

DROP TABLE [dbo].[FactSales]

-- Now we want to create a hash-distributed table and set the hash-based column as the Customer ID

CREATE TABLE [dbo].[FactSales](
	[ProductID] [int] NOT NULL,
	[SalesOrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[OrderDate] [datetime] NULL,
	[TaxAmt] [money] NULL
)
WITH  
(   
    DISTRIBUTION = HASH (CustomerID)
)

-- To see the distribution on the table
DBCC PDW_SHOWSPACEUSED('[dbo].[FactSales]')

-- If you execute the below query
SELECT [CustomerID], COUNT([CustomerID]) as COUNT FROM [dbo].[FactSales]
GROUP BY [CustomerID]
ORDER BY [CustomerID]