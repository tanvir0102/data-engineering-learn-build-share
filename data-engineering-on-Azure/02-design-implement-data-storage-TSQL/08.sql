-- Lab - T-SQL - Table Joins

SELECT SalesLT.Product.ProductID,ListPrice,OrderQty,LineTotal
FROM SalesLT.Product JOIN SalesLT.SalesOrderDetail
ON SalesLT.Product.ProductID=SalesLT.SalesOrderDetail.ProductID


SELECT SalesLT.Product.ProductID,ListPrice,OrderQty,LineTotal,((ListPrice*OrderQty)-LineTotal) AS ' Discount Amount'
FROM SalesLT.Product JOIN SalesLT.SalesOrderDetail
ON SalesLT.Product.ProductID=SalesLT.SalesOrderDetail.ProductID


SELECT SalesLT.Product.ProductID,ListPrice,OrderQty,LineTotal,((ListPrice*OrderQty)-LineTotal) AS ' Discount Amount'
FROM SalesLT.Product JOIN SalesLT.SalesOrderDetail
ON SalesLT.Product.ProductID=SalesLT.SalesOrderDetail.ProductID
WHERE OrderQty>10