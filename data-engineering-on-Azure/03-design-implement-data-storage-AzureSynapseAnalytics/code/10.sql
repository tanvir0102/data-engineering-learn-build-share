-- Lab - Building a Fact Table
-- Lets first create a view

  CREATE VIEW [Sales_Fact_View]
  AS
  SELECT dt.[ProductID],dt.[SalesOrderID],dt.[OrderQty],dt.[UnitPrice],hd.[OrderDate],hd.[CustomerID],hd.[TaxAmt]
  FROM [SalesLT].[SalesOrderDetail] dt
  LEFT JOIN [SalesLT].[SalesOrderHeader] hd
  ON dt.[SalesOrderID]=hd.[SalesOrderID]

-- Then we will create the Sales Fact table from the view
  
SELECT [ProductID],[SalesOrderID],[CustomerID],[OrderQty],[UnitPrice],[OrderDate],[TaxAmt]
INTO [FactSales]
FROM [Sales_Fact_View]

SELECT * FROM [FactSales]