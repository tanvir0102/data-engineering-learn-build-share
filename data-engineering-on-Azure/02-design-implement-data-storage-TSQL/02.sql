-- Lab - T-SQL - WHERE clause

-- The WHERE clause is used to extract only those records that fulfill a specified condition.

SELECT ProductID, Name, ProductNumber FROM SalesLT.Product WHERE ProductID=680

SELECT ProductID, Name, ProductNumber FROM SalesLT.Product WHERE ProductID>680

SELECT ProductID, Name, ProductNumber FROM SalesLT.Product WHERE ProductID BETWEEN 680 and 900

SELECT ProductID, Name, ProductNumber FROM SalesLT.Product WHERE Name Like '%Road%'
