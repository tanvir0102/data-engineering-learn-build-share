# iPhone Data Analysis Using SQL.

## Create table for storing the apple product details (apple_product)

## Load the apple_product data in csv file to postgres database

## See the complete data using the SELECT QUERY
```
SELECT *
FROM apple_product;
```

## See the total number of rows(records) in the table
```
SELECT COUNT(*)
FROM apple_product;
```

## Get the average MRP of the Apple Product
```
SELECT AVG(mrp)
FROM apple_product;
```

## Get the Minimum MRP of the Apple Product
```
SELECT MIN(mrp)
FROM apple_product;
```

## Get the Maximum MRP of the Apple Product
```
SELECT MAX(mrp)
FROM apple_product;
```

## Get the product details having 4GB RAM with 4.0 Star Rating and Price less then 50000
```
SELECT *
FROM apple_product
WHERE ram = '4 GB' and star_rating > 4.0 and mrp < 50000
```
