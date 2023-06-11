# iPhone Data Analysis Using SQL.

## Create table for storing the apple product details (apple_product)

## Load the apple_product data in csv file to postgres database

```
SELECT *
FROM apple_product;
```
```
SELECT COUNT(*)
FROM apple_product;
```
```
SELECT AVG(mrp)
FROM apple_product;
```
```
SELECT MIN(mrp)
FROM apple_product;
```
```
SELECT MAX(mrp)
FROM apple_product;
```
```
SELECT *
FROM apple_product
WHERE ram = '4 GB' and star_rating > 4.0 and mrp < 50000
```
