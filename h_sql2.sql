CREATE DATABASE if not exists market;
CREATE TABLE sales (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    quantity INT,
    sale_date DATE
);

INSERT INTO sales VALUES (1, 'Laptop', 'Electronics', 800, 2, '2025-01-01');
INSERT INTO sales VALUES (2, 'Phone', 'Electronics', 600, 3, '2025-01-01');
INSERT INTO sales VALUES (3, 'TV', 'Electronics', 900, 1, '2025-01-02');
INSERT INTO sales VALUES (4, 'Headphones', 'Electronics', 150, 5, '2025-01-03');

INSERT INTO sales VALUES (5, 'Table', 'Furniture', 300, 1, '2025-01-01');
INSERT INTO sales VALUES (6, 'Chair', 'Furniture', 100, 4, '2025-01-02');
INSERT INTO sales VALUES (7, 'Sofa', 'Furniture', 1200, 1, '2025-01-03');
INSERT INTO sales VALUES (8, 'Bed', 'Furniture', 900, 1, '2025-01-04');

INSERT INTO sales VALUES (9, 'T-shirt', 'Clothing', 40, 6, '2025-01-01');
INSERT INTO sales VALUES (10, 'Jeans', 'Clothing', 70, 3, '2025-01-02');
INSERT INTO sales VALUES (11, 'Jacket', 'Clothing', 120, 2, '2025-01-03');
INSERT INTO sales VALUES (12, 'Shoes', 'Clothing', 90, 4, '2025-01-04');

INSERT INTO sales VALUES (13, 'Apple', 'Food', 2, 20, '2025-01-01');
INSERT INTO sales VALUES (14, 'Bread', 'Food', 3, 15, '2025-01-02');
INSERT INTO sales VALUES (15, 'Milk', 'Food', 4, 10, '2025-01-03');
INSERT INTO sales VALUES (16, 'Cheese', 'Food', 8, 5, '2025-01-04');

INSERT INTO sales VALUES (17, 'Notebook', 'Stationery', 5, 10, '2025-01-01');
INSERT INTO sales VALUES (18, 'Pen', 'Stationery', 2, 25, '2025-01-02');
INSERT INTO sales VALUES (19, 'Marker', 'Stationery', 4, 12, '2025-01-03');
INSERT INTO sales VALUES (20, 'Folder', 'Stationery', 6, 8, '2025-01-04');

### 1
SELECT category, SUM(quantity) as total FROM sales GROUP BY category;
+-------------+-------+
| category    | total |
+-------------+-------+
| Electronics |    11 |
| Furniture   |     7 |
| Clothing    |    15 |
| Food        |    50 |
| Stationery  |    55 |
+-------------+-------+

### 2
SELECT category, SUM(price * quantity) as price FROM sales GROUP BY category;
+-------------+-------+
| category    | price |
+-------------+-------+
| Electronics |  5050 |
| Furniture   |  2800 |
| Clothing    |  1050 |
| Food        |   165 |
| Stationery  |   196 |
+-------------+-------+

### 3
SELECT category, AVG(price * quantity) as price FROM sales GROUP BY category;
+-------------+-----------+
| category    | price     |
+-------------+-----------+
| Electronics | 1262.5000 |
| Furniture   |  700.0000 |
| Clothing    |  262.5000 |
| Food        |   41.2500 |
| Stationery  |   49.0000 |
+-------------+-----------+

### 4
SELECT sale_date, SUM(price * quantity) as price FROM sales GROUP BY sale_date;
+------------+-------+
| sale_date  | price |
+------------+-------+
| 2025-01-01 |  4030 |
| 2025-01-02 |  1605 |
| 2025-01-03 |  2278 |
| 2025-01-04 |  1348 |
+------------+-------+

### 5
SELECT sale_date, SUM(price * quantity) as price FROM sales WHERE category = "Electronics"
GROUP BY sale_date;
+------------+-------+
| sale_date  | price |
+------------+-------+
| 2025-01-01 |  3400 |
| 2025-01-02 |   900 |
| 2025-01-03 |   750 |
+------------+-------+

### 6
SELECT category, SUM(price * quantity) as price FROM sales GROUP BY category HAVING price > 2000;
+-------------+-------+
| category    | price |
+-------------+-------+
| Electronics |  5050 |
| Furniture   |  2800 |
+-------------+-------+

### 7
SELECT category, AVG(price * quantity) as price FROM sales GROUP BY category HAVING price > 100;
+-------------+-----------+
| category    | price     |
+-------------+-----------+
| Electronics | 1262.5000 |
| Furniture   |  700.0000 |
| Clothing    |  262.5000 |
+-------------+-----------+

### 8
SELECT product_name, COUNT(*) FROM sales WHERE sale_date = "2025-01-01" GROUP BY product_name;
+--------------+----------+
| product_name | COUNT(*) |
+--------------+----------+
| Laptop       |        1 |
| Phone        |        1 |
| Table        |        1 |
| T-shirt      |        1 |
| Apple        |        1 |
| Notebook     |        1 |
+--------------+----------+

SELECT COUNT(*) AS count
    FROM sales
    WHERE sale_date = '2025-01-01';
+-------+
| count |
+-------+
|     6 |
+-------+

### 9

SELECT MAX(quantity) FROM sales;
+---------------+
| MAX(quantity) |
+---------------+
|            25 |
+---------------+

SELECT product_name, quantity
    FROM sales
    WHERE quantity = (SELECT MAX(quantity) FROM sales);
+--------------+----------+
| product_name | quantity |
+--------------+----------+
| Pen          |       25 |
+--------------+----------+


### 10
SELECT category, SUM(price * quantity) as tushum FROM sales WHERE quantity > 3 GROUP BY category;
+-------------+--------+
| category    | tushum |
+-------------+--------+
| Electronics |    750 |
| Furniture   |    400 |
| Clothing    |    600 |
| Food        |    165 |
| Stationery  |    196 |
+-------------+--------+