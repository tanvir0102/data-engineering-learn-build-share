-- Understanding JOINS on tables - Use Case 1

SELECT COUNT(*) FROM [dbo].[FactSales]
SELECT COUNT(*) FROM [dbo].[DimCustomer]

DROP TABLE [dbo].[FactSales]

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


DROP TABLE [dbo].[DimCustomer]

CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
    [CompanyName] varchar(200) NOT NULL,
	[SalesPerson] varchar(300) NOT NULL		
)

SELECT COUNT(dtct.[CustomerID]),[SalesPerson]
FROM [dbo].[DimCustomer] AS dtct JOIN [dbo].[FactSales] ftsl
ON dtct.[CustomerID]=ftsl.[CustomerID]
GROUP BY dtct.[SalesPerson]

-- Understanding JOINS on tables - Use Case 2

SELECT COUNT(*) FROM [dbo].[FactSales]
SELECT COUNT(*) FROM [dbo].[DimCustomer]

DROP TABLE [dbo].[FactSales]

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

DROP TABLE [dbo].[DimCustomer]

CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
    [CompanyName] varchar(200) NOT NULL,
	[SalesPerson] varchar(300) NOT NULL
)
    WITH  
(   
    DISTRIBUTION = REPLICATE
)		


SELECT COUNT(dtct.[CustomerID]),[SalesPerson]
FROM [dbo].[DimCustomer] AS dtct JOIN [dbo].[FactSales] ftsl
ON dtct.[CustomerID]=ftsl.[CustomerID]
GROUP BY dtct.[SalesPerson]

