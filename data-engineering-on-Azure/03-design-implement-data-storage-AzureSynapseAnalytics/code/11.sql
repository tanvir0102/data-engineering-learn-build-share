-- Lab - Building a dimension table
-- Lets build a view for the customers

CREATE VIEW Customer_view 
AS
  SELECT ct.[CustomerID],ct.[CompanyName],ct.[SalesPerson]
  FROM [SalesLT].[Customer] as ct  

-- Lets create a customer dimension table

SELECT [CustomerID],[CompanyName],[SalesPerson]
INTO DimCustomer
FROM Customer_view 


-- Lets build a view for the products

CREATE VIEW Product_view 
AS
SELECT prod.[ProductID],prod.[Name] as ProductName,model.[ProductModelID],model.[Name] as ProductModelName,category.[ProductcategoryID],category.[Name] AS ProductCategoryName
FROM [SalesLT].[Product] prod
LEFT JOIN [SalesLT].[ProductModel] model ON prod.[ProductModelID] = model.[ProductModelID]
LEFT JOIN [SalesLT].[ProductCategory] category ON prod.[ProductcategoryID]=category.[ProductcategoryID]

-- Lets create a product dimension table

SELECT [ProductID],[ProductModelID],[ProductcategoryID],[ProductName],[ProductModelName],[ProductCategoryName]
INTO DimProduct
FROM Product_view 

-- If you want to drop the views and the tables

DROP VIEW Customer_view 

DROP TABLE DimCustomer

DROP VIEW Product_view 

DROP TABLE DimProduct

