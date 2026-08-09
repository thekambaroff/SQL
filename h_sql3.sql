CREATE TABLE IF NOT EXISTS author (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS genre (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS book (id INT AUTO_INCREMENT PRIMARY KEY, 
                                name VARCHAR(50) NOT NULL,
                                price INT ,
                                amount INT, 
                                a_id INT,
                                g_id INT,
                                FOREIGN KEY (a_id) REFERENCES author(id) ON DELETE CASCADE ON UPDATE CASCADE,
                                FOREIGN KEY (g_id) REFERENCES genre(id) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO author VALUES(1, "Alisher Navoiy"), (2, "Abdulla Qodiriy"), (3, "Oybek"), (4, "Zulfiya");

INSERT INTO genre VALUES(1, "Detektiv"), (2, "Drama"), (3, "Tarixiy");

INSERT INTO book(name, price, amount, a_id, g_id)  VALUES ("Hamsa", 100000, 5, 1, 3),
                                                        ("Ufq", 25000, 10, 4, 2),
                                                        ("O'tkan kunlar", 50000, 2, 3, 2),
                                                        ("KEcha va kunduz", 40000, 100, 1, 1),
                                                        ("Martin", 101000, 4, 1, 3),
                                                        ("Binafsha Shulasi", 13000, 2, 2, 2),
                                                        ("Yulduzli tunlar", 80000, 8, 3, 1),
                                                        ("Atom odatlar", 40000, 10, 4, 1),
                                                        ("Jyulvern", 60000, 11, 4, 2),
                                                        ("Oq Kema", 50000, 12, 3, 3),
                                                        ("Boy Ota Kambag'al OTa", 61000, 12, 1, 3),
                                                        ("Grahmonte Krista", 130000, 1, 3, 1);
                                        

### 1
SELECT JSON_ARRAYAGG(book.name) as Navoiy_kitoblari FROM book  WHERE a_id = 1;
+-----------------------------------------------------------------+
| Navoiy_kitoblari                                                |
+-----------------------------------------------------------------+
| ["Hamsa", "KEcha va kunduz", "Martin", "Boy Ota Kambag'al OTa"] |
+-----------------------------------------------------------------+

### 2
SELECT JSON_ARRAYAGG(book.name) as books FROM book;
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| books                                                                                                                                                                                     |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ["Hamsa", "Ufq", "O'tkan kunlar", "KEcha va kunduz", "Martin", "Binafsha Shulasi", "Yulduzli tunlar", "Atom odatlar", "Jyulvern", "Oq Kema", "Boy Ota Kambag'al OTa", "Grahmonte Krista"] |
+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

### 3

SELECT COUNT(*) FROM book GROUP BY book.g_id;
+----------+
| COUNT(*) |
+----------+
|        4 |
|        4 |
|        4 |
+----------+

UPDATE book SET g_id = 3 WHERE id = 7; # ozgartirish
### 4

SELECT genre.name, COUNT(book.id) AS book_count
FROM genre
JOIN book ON genre.id = book.g_id
GROUP BY genre.id, genre.name
ORDER BY book_count DESC
LIMIT 1;
+---------+------------+
| name    | book_count |
+---------+------------+
| Tarixiy |          5 |
+---------+------------+

### 5

SELECT author.name AS author,
    genre.name AS genre,
    COUNT(book.id) AS book_count
FROM book
JOIN author ON book.a_id = author.id
JOIN genre ON book.g_id = genre.id
GROUP BY author.id, author.name, genre.id, genre.name;
+-----------------+----------+------------+
| author          | genre    | book_count |
+-----------------+----------+------------+
| Alisher Navoiy  | Detektiv |          1 |
| Zulfiya         | Detektiv |          1 |
| Oybek           | Detektiv |          1 |
| Zulfiya         | Drama    |          2 |
| Oybek           | Drama    |          1 |
| Abdulla Qodiriy | Drama    |          1 |
| Alisher Navoiy  | Tarixiy  |          3 |
| Oybek           | Tarixiy  |          2 |
+-----------------+----------+------------+