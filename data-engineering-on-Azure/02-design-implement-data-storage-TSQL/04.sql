-- Lab - T-SQL - Aggregate Functions

SELECT COUNT(ProductID) FROM SalesLT.Product WHERE Name LIKE '%Road%'
SELECT MAX(ProductID) FROM SalesLT.Product WHERE Name LIKE '%Road%'
SELECT MIN(ProductID) FROM SalesLT.Product WHERE Name LIKE '%Road%'
SELECT SUM(ProductID) FROM SalesLT.Product WHERE Name LIKE '%Road%'
SELECT AVG(ProductID) FROM SalesLT.Product WHERE Name LIKE '%Road%'