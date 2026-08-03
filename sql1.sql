### uyga vazifa 113 qatordan boshlangan
select * from students;
+------+-----------+------+------+
| id   | name      | age  | baho |
+------+-----------+------+------+
|    1 | ahror     |   19 |   98 |
|    2 | Ali       |   18 |   87 |
|    3 | Vali      |   17 |   78 |
|    4 | Sherali   |   23 |   90 |
|    5 | Tursonboy |   12 |   60 |
+------+-----------+------+------+

select * FROM students WHERE baho between 90 and 101 ORDER BY name
+------+---------+------+------+
| id   | name    | age  | baho |
+------+---------+------+------+
|    1 | ahror   |   19 |   98 |
|    4 | Sherali |   23 |   90 |
+------+---------+------+------+


select * FROM students WHERE baho BETWEEN 70 and 90 ORDER BY age DESC
+------+---------+------+------+
| id   | name    | age  | baho |
+------+---------+------+------+
|    4 | Sherali |   23 |   90 |
|    2 | Ali     |   18 |   87 |
|    3 | Vali    |   17 |   78 |
+------+---------+------+------+

SELECT * FROM students WHERE baho BETWEEN 60 and 70 ORDER BY name
+------+-----------+------+------+
| id   | name      | age  | baho |
+------+-----------+------+------+
|    5 | Tursonboy |   12 |   60 |
+------+-----------+------+------+

----------------------------------------------------------------------------
SELECT * FROM taomlar;
+------+------------------+---------------------------------------------+
| id   | nomi             | masalliqlar                                 |
+------+------------------+---------------------------------------------+
|    1 | osh              | sabzi guruch gosht yog                      |
|    2 | dimlama          | karam kartoshka zabzi gosht yog             |
|    3 | mastava          | kartoshka guruch sabzi gosht balgarski      |
|    4 | manti            | kartoshka sabzi gosht balgarski piyoz       |
|    5 | shavla           | kartoshka guruch gosht piyoz                |
|    6 | galubsti         | kartoshka guruch gosht piyoz yog balgarski  |
|    7 | lavash           | hamir gosht piyoz yog mayonez               |
|    8 | tuchonka         | gosht                                       |
|    9 | rolton           | hamir ziravor suv                           |
|   10 | kartoshka jarkob | kartoska piyoz gosht yog                    |
+------+------------------+---------------------------------------------+

SELECT * from ovqat WHERE nomi LIKE '%a';
+------+----------+----------------------------------------+
| id   | nomi     | masalliqlar                            |
+------+----------+----------------------------------------+
|    2 | dimlama  | karam kartoshka zabzi gosht yog        |
|    3 | mastava  | kartoshka guruch sabzi gosht balgarski |
|    5 | shavla   | kartoshka guruch gosht piyoz           |
|    8 | tuchonka | gosht                                  |
+------+----------+----------------------------------------+

SELECT * from ovqat WHERE masalliqlar LIKE '%guruch%';
+------+----------+---------------------------------------------+
| id   | nomi     | masalliqlar                                 |
+------+----------+---------------------------------------------+
|    1 | osh      | sabzi guruch gosht yog                      |
|    3 | mastava  | kartoshka guruch sabzi gosht balgarski      |
|    5 | shavla   | kartoshka guruch gosht piyoz                |
|    6 | galubsti | kartoshka guruch gosht piyoz yog balgarski  |
+------+----------+---------------------------------------------+

---------------------------------------------------------------------------

INSERT INTO students VALUES
(1, 'Ali', '2005-03-15', 89),
(2, 'Vali', '2004-11-20', 76),
(3, 'Hasan', '2005-01-10', 95),
(4, 'Husan', '2004-08-30', 68),
(5, 'Dilshod', '2005-06-18', 82),
(6, 'Jasur', '2004-12-05', 91),
(7, 'Aziza', '2005-09-22', 87),
(8, 'Malika', '2004-04-14', 79),
(9, 'Shahzoda', '2005-07-09', 98),
(10, 'Zafar', '2004-10-27', 73);

SELECT * from Students;
+------+----------+------------+------+
| id   | ism      | sana       | baho |
+------+----------+------------+------+
|    1 | Ali      | 2005-03-15 |   89 |
|    2 | Vali     | 2004-11-20 |   76 |
|    3 | Hasan    | 2005-01-10 |   95 |
|    4 | Husan    | 2004-08-30 |   68 |
|    5 | Dilshod  | 2005-06-18 |   82 |
|    6 | Jasur    | 2004-12-05 |   91 |
|    7 | Aziza    | 2005-09-22 |   87 |
|    8 | Malika   | 2004-04-14 |   79 |
|    9 | Shahzoda | 2005-07-09 |   98 |
|   10 | Zafar    | 2004-10-27 |   73 |
+------+----------+------------+------+

SELECT * FROM students WHERe MONTH(sana) IN (1,11,12);
+------+-------+------------+------+
| id   | ism   | sana       | baho |
+------+-------+------------+------+
|    2 | Vali  | 2004-11-20 |   76 |
|    3 | Hasan | 2005-01-10 |   95 |
|    6 | Jasur | 2004-12-05 |   91 |
+------+-------+------------+------+

---------------------HOMEWORK---------------------------------------------------------

SELECT * FROM laptop;
+----+---------+------------------+---------------+-----------+------+--------------+-------+
| id | brand   | model            | cpu           | frequency | ram  | os           | price |
+----+---------+------------------+---------------+-----------+------+--------------+-------+
|  1 | Apple   | MacBook Air M1   | Apple M1      |       3.2 |    8 | macOS Sonoma |  1200 |
|  2 | Apple   | MacBook Pro M2   | Apple M2      |       3.5 |   16 | macOS Sonoma |  2200 |
|  3 | ASUS    | ZenBook 14       | Intel Core i7 |       3.8 |   16 | Windows 11   |  1400 |
|  4 | ASUS    | VivoBook 15      | AMD Ryzen 5   |       3.6 |    8 | Windows 11   |   850 |
|  5 | Dell    | Inspiron 15      | Intel Core i5 |       3.1 |    8 | Windows 10   |   750 |
|  6 | Dell    | XPS 13           | Intel Core i7 |       4.2 |   16 | Windows 11   |  1800 |
|  7 | HP      | Pavilion 15      | AMD Ryzen 7   |       3.9 |   16 | Windows 11   |  1100 |
|  8 | HP      | EliteBook 840    | Intel Core i5 |       3.4 |    8 | Windows 10   |   950 |
|  9 | Lenovo  | ThinkPad X1      | Intel Core i7 |       4.0 |   16 | Ubuntu 22.04 |  1700 |
| 10 | Lenovo  | IdeaPad 3        | AMD Ryzen 5   |       3.7 |    8 | Windows 11   |   700 |
| 11 | Acer    | Aspire 5         | Intel Core i5 |       3.3 |    8 | Windows 11   |   680 |
| 12 | Acer    | Swift 3          | AMD Ryzen 7   |       3.8 |   16 | Windows 11   |   980 |
| 13 | MSI     | GF63 Thin        | Intel Core i7 |       4.1 |   16 | Windows 11   |  1500 |
| 14 | MSI     | Modern 14        | Intel Core i5 |       3.5 |    8 | Windows 11   |   890 |
| 15 | Samsung | Galaxy Book3     | Intel Core i5 |       3.6 |    8 | Windows 11   |  1150 |
| 16 | Samsung | Galaxy Book4 Pro | Intel Core i7 |       4.3 |   16 | Windows 11   |  2100 |
| 17 | Huawei  | MateBook D15     | AMD Ryzen 5   |       3.5 |    8 | Windows 11   |   820 |
| 18 | Huawei  | MateBook X Pro   | Intel Core i7 |       4.1 |   16 | Windows 11   |  1900 |
| 19 | LG      | Gram 16          | Intel Core i7 |       4.2 |   16 | Windows 11   |  2000 |
| 20 | LG      | Gram 14          | Intel Core i5 |       3.8 |    8 | Windows 11   |  1300 |
+----+---------+------------------+---------------+-----------+------+--------------+-------+

SELECT * FROM laptop ORDER BY price DESC LIMIT 1;
+----+-------+----------------+----------+-----------+------+--------------+-------+
| id | brand | model          | cpu      | frequency | ram  | os           | price |
+----+-------+----------------+----------+-----------+------+--------------+-------+
|  2 | Apple | MacBook Pro M2 | Apple M2 |       3.5 |   16 | macOS Sonoma |  2200 |
+----+-------+----------------+----------+-----------+------+--------------+-------+

SELECT * FROM laptop ORDER BY price LIMIT 1;
+----+-------+----------+---------------+-----------+------+------------+-------+
| id | brand | model    | cpu           | frequency | ram  | os         | price |
+----+-------+----------+---------------+-----------+------+------------+-------+
| 11 | Acer  | Aspire 5 | Intel Core i5 |       3.3 |    8 | Windows 11 |   680 |
+----+-------+----------+---------------+-----------+------+------------+-------+

SELECT frequency FROM laptop WHERE price BETWEEN 400 and 1000 and cpu LIKE '%intel%';
+-----------+
| frequency |
+-----------+
|       3.1 |
|       3.4 |
|       3.3 |
|       3.5 |
+-----------+

SELECT COUNT(*) FROM laptop WHERE brand = 'Apple';
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+

SELECT * FROM laptop WHERE os LIKE "%windows%" and ram = 8  ORDER BY price;
+----+---------+---------------+---------------+-----------+------+------------+-------+
| id | brand   | model         | cpu           | frequency | ram  | os         | price |
+----+---------+---------------+---------------+-----------+------+------------+-------+
| 11 | Acer    | Aspire 5      | Intel Core i5 |       3.3 |    8 | Windows 11 |   680 |
| 10 | Lenovo  | IdeaPad 3     | AMD Ryzen 5   |       3.7 |    8 | Windows 11 |   700 |
|  5 | Dell    | Inspiron 15   | Intel Core i5 |       3.1 |    8 | Windows 10 |   750 |
| 17 | Huawei  | MateBook D15  | AMD Ryzen 5   |       3.5 |    8 | Windows 11 |   820 |
|  4 | ASUS    | VivoBook 15   | AMD Ryzen 5   |       3.6 |    8 | Windows 11 |   850 |
| 14 | MSI     | Modern 14     | Intel Core i5 |       3.5 |    8 | Windows 11 |   890 |
|  8 | HP      | EliteBook 840 | Intel Core i5 |       3.4 |    8 | Windows 10 |   950 |
| 15 | Samsung | Galaxy Book3  | Intel Core i5 |       3.6 |    8 | Windows 11 |  1150 |
| 20 | LG      | Gram 14       | Intel Core i5 |       3.8 |    8 | Windows 11 |  1300 |
+----+---------+---------------+---------------+-----------+------+------------+-------+

SELECT frequency FROM laptop WHERE os LIKE "%windows%" and ram = 8  ORDER BY price;
+-----------+
| frequency |
+-----------+
|       3.3 |
|       3.7 |
|       3.1 |
|       3.5 |
|       3.6 |
|       3.5 |
|       3.4 |
|       3.6 |
|       3.8 |
+-----------+