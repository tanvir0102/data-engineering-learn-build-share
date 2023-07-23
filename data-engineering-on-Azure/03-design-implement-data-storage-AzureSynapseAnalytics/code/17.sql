-- Hash distribution for multiple columns
-- Can we create a hash distribution for multiple columns

DROP TABLE [dbo].[FactSales]

ALTER DATABASE SCOPED CONFIGURATION SET DW_COMPATIBILITY_LEVEL = 50

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
    DISTRIBUTION = HASH ([CustomerID],[ProductID])
)