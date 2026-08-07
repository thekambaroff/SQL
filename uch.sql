-- 3
SELECT category, AVG(price * quantity) AS ortacha FROM sales GROUP BY category;

-- 5
SELECT category, SUM(price * quantity) AS tushum FROM sales GROUP BY category HAVING category="electronics";

-- 8
SELECT sale_date, SUM(quantity) AS miqdor FROM sales GROUP BY sale_date HAVING sale_date = "2025-01-01";

--------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS oquvchi(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50));

INSERT INTO oquvchi(name) VALUES("Karim"), ("Vali"), ("Aziz"), ("Lola");

CREATE TABLE IF NOT EXISTS phones(id INT AUTO_INCREMENT PRIMARY KEY, s_id INT, phone VARCHAR(50) UNIQUE);

INSERT INTO phones(s_id, phone) VALUES
                                        (1, "+99893456"),
                                        (4, "+99890123"),
                                        (2, "+99871478"),
                                        (1, "+99899563"),
                                        (3, "+99894645"),
                                        (2, "+99833478"),
                                        (1, "+99897777"),
                                        (2, "+99893458");

                        
SELECT * FROM oquvchi AS o
    INNER JOIN phones AS p
    ON o.id = p.s_id;
+----+-------+----+------+-----------+
| id | name  | id | s_id | phone     |
+----+-------+----+------+-----------+
|  1 | Karim |  1 |    1 | +99893456 |
|  4 | Lola  |  2 |    4 | +99890123 |
|  2 | Vali  |  3 |    2 | +99871478 |
|  1 | Karim |  4 |    1 | +99899563 |
|  3 | Aziz  |  5 |    3 | +99894645 |
|  2 | Vali  |  6 |    2 | +99833478 |
|  1 | Karim |  7 |    1 | +99897777 |
|  2 | Vali  |  8 |    2 | +99893458 |
+----+-------+----+------+-----------+

SELECT * FROM oquvchi AS o
INNER JOIN phones AS p ON o.id = p.s_id
GROUP BY o.id;
+----+-------+----+------+-----------+
| id | name  | id | s_id | phone     |
+----+-------+----+------+-----------+
|  1 | Karim |  1 |    1 | +99893456 |
|  4 | Lola  |  2 |    4 | +99890123 |
|  2 | Vali  |  3 |    2 | +99871478 |
|  3 | Aziz  |  5 |    3 | +99894645 |
+----+-------+----+------+-----------+

SELECT o.id, name, JSON_ARRAYAGG(phone) AS phone FROM oquvchi AS o 
JOIN phones AS p ON p.s_id = o.id
GROUP BY o.id;
+----+-------+-----------------------------------------+
| id | name  | phone                                   |
+----+-------+-----------------------------------------+
|  1 | Karim | ["+99893456", "+99899563", "+99897777"] |
|  2 | Vali  | ["+99871478", "+99833478", "+99893458"] |
|  3 | Aziz  | ["+99894645"]                           |
|  4 | Lola  | ["+99890123"]                           |
+----+-------+-----------------------------------------+


SELECT  JSON_ARRAYAGG(o.id),  JSON_ARRAYAGG(name), JSON_ARRAYAGG(phone),  JSON_ARRAYAGG(p.id),  JSON_ARRAYAGG(s_id) AS phone FROM oquvchi AS o 
JOIN phones AS p ON p.s_id = o.id 
GROUP BY o.id 
HAVING COUNT(*) > 1;

CREATE TABLE maosh(s_id INT, salary INT);
INSERT INTO maosh VALUES(1, 45600), (4, 10000);
INSERT INTO maosh VALUES(1, 5600);


SELECT  o.id, name, JSON_ARRAYAGG(phone), salary AS maosh FROM oquvchi AS o 
JOIN phones AS p ON p.s_id = o.id 
JOIN maosh AS m ON o.id = m.s_id
GROUP BY o.id;

----------------------------------------------------------------

CREATE TABLE IF NOT EXISTS odam(id INT PRIMARY KEY,
                                name VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS qarz(id INT PRIMARY KEY, 
                                o_id INT,
                                qarz INT,
                                FOREIGN KEY (o_id) REFERENCES odam(id) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO odam VALUES(1, "Karim"), (2, "Jasur");

INSERT INTO qarz VALUES(1, 2, 100000);