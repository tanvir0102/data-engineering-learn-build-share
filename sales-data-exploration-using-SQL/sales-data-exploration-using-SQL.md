# Sales Data Exploration

### Suppose you work for a company that sells products online. Your team is responsible for analyzing sales data to identify trends and patterns, and to make recommendations for improving the company's sales performance. You have been tasked with exploring the sales data using SQL.

### Create the Sales Table
```
CREATE TABLE sales (
  id INT,
  sale_date DATE,
  product VARCHAR(50),
  quantity INT,
  revenue DECIMAL(10,2)
);
```

### Insert Data into the Sales Table
```
INSERT INTO sales (id, sale_date, product, quantity, revenue)
VALUES
  (1, '2021-01-01', 'Product A', 10, 100.00),
  (2, '2021-01-02', 'Product B', 5, 50.00),
  (3, '2021-01-03', 'Product C', 15, 150.00),
  (4, '2021-01-04', 'Product A', 8, 80.00),
  (5, '2021-01-05', 'Product B', 12, 120.00),
  (6, '2021-01-06', 'Product C', 20, 200.00),
  (7, '2021-01-07', 'Product A', 6, 60.00),
  (8, '2021-01-08', 'Product B', 18, 180.00),
  (9, '2021-01-09', 'Product C', 10, 100.00),
  (10, '2021-01-10', 'Product A', 4, 40.00);
```

## Explore the Sales Data
### Retrieve all the data from the sales table
```
SELECT * FROM sales;
```

### Retrieve data only for a specific product, such as "Product A"
```
SELECT * FROM sales WHERE product = 'Product A';
```

### Retrieve the total revenue for each day
```
SELECT sale_date, SUM(revenue) FROM sales GROUP BY sale_date;
```

### Retrieve the total revenue for each product
```
SELECT product, SUM(revenue) FROM sales GROUP BY product;
```

### Retrieve the top-selling products in descending order by quantity sold
```
SELECT product, SUM(quantity) FROM sales GROUP BY product ORDER BY SUM(quantity) DESC;
```

### Retrieves all columns and rows from the sales table where the product is "Product A" and the quantity sold is greater than 5
```
SELECT * FROM sales WHERE product = 'Product A' AND quantity > 5
```

### Retrieves all columns and rows from the sales table where the product is either "Product A" or "Product B"
```
SELECT * FROM sales WHERE product = 'Product A' OR product = 'Product B'
```

### Retrieves all columns and rows from the sales table where the product is not "Product A"
```
SELECT * FROM sales WHERE NOT product = 'Product A'
```

### Retrieves all columns and rows from the sales table where the product name contains the letter "A"
```
SELECT * FROM sales WHERE product LIKE '%A%'
```

### Retrieves all columns and rows from the sales table where the product is either "Product A" or "Product B"
```
SELECT * FROM sales WHERE product IN ('Product A', 'Product B')
```

### Rtrieves all columns and rows from the sales table where the revenue is between 50 and 100
```
SELECT * FROM sales WHERE revenue BETWEEN 50 AND 100
```

### Which products were sold on January 2nd?
```
SELECT product FROM sales WHERE sale_date = '2021-01-02';
```

### What was the total revenue for Product C?
```
SELECT SUM(revenue) FROM sales WHERE product = 'Product C';
```

### Which days had revenue greater than $150?
```
SELECT sale_date FROM sales WHERE revenue > 150;
```

### Which products had a total quantity sold greater than 30?
```
SELECT product FROM sales GROUP BY product HAVING SUM(quantity) > 30;
```

### What was the average revenue per sale for Product B?
```
SELECT AVG(revenue) FROM sales WHERE product = 'Product B';
```

### Which products had a revenue per sale greater than $15?
```
SELECT product FROM sales GROUP BY product HAVING AVG(revenue) > 15;
```
