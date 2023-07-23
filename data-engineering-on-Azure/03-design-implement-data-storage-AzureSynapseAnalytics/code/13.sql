-- Round-Robin Tables

-- To see the current table type

SELECT 
       OBJECT_NAME( object_id ) AS table_name,
	   *
FROM sys.pdw_table_distribution_properties;

-- If you execute the below query
SELECT [CustomerID], COUNT([CustomerID]) as COUNT FROM [dbo].[FactSales]
GROUP BY [CustomerID]
ORDER BY [CustomerID]