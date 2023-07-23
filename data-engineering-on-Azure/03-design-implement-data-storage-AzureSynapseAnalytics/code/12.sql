-- Lab - Transfer data to our SQL Pool

-- In our video we let the pipeline create the table for us
-- But for learning purposes, this would be the table structure for the tables

CREATE TABLE [dbo].[FactSales](
	[ProductID] [int] NOT NULL,
	[SalesOrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[OrderDate] [datetime] NULL,
	[TaxAmt] [money] NULL
)


CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
    [CompanyName] varchar(200) NOT NULL,
	[SalesPerson] varchar(300) NOT NULL		
)


CREATE TABLE [dbo].[DimProduct](
	[ProductID] [int] NOT NULL,
	[ProductModelID] [int] NOT NULL,
	[ProductcategoryID] [int] NOT NULL,
	[ProductName] varchar(50) NOT NULL,	
	[ProductModelName] varchar(50) NULL,
	[ProductCategoryName] varchar(50) NULL
)

SELECT * FROM [dbo].[FactSales]
SELECT COUNT(*) FROM [dbo].[FactSales]

SELECT * FROM [dbo].[DimCustomer]
SELECT COUNT(*) FROM [dbo].[DimCustomer]

SELECT * FROM [dbo].[DimProduct]
SELECT COUNT(*) FROM [dbo].[DimProduct]

-- If we need to drop the tables

DROP TABLE [dbo].[FactSales]

DROP TABLE [dbo].[DimCustomer]

DROP TABLE [dbo].[DimProduct]


