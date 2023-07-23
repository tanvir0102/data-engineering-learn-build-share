-- Lab - Surrogate Keys

DROP TABLE [dbo].[DimProduct]

CREATE TABLE [dbo].[DimProduct](
	[ProductSK] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductModelID] [int] NOT NULL,
	[ProductcategoryID] [int] NOT NULL,
	[ProductName] varchar(50) NOT NULL,	
	[ProductModelName] varchar(50) NULL,
	[ProductCategoryName] varchar(50) NULL
)

SELECT * FROM [dbo].[DimProduct]

SELECT * FROM [dbo].[DimProduct]
ORDER BY [ProductSK]