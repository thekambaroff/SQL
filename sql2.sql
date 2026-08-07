CREATE TABLE kurs(
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Instuctor VARCHAR(100) NOT NULL,
    DurationHour DECIMAL(4,1) NOT NULL,
    Price DECIMAL(10,2) DEFAULT 0,
    Rating DECIMAL(2,1) DEFAULT 0,
    Enrolled INT DEFAULT 0
);

INSERT INTO kurs (Title, Instuctor, DurationHour, Price, Rating, Enrolled)
VALUES
('Python Basics', 'Muhammad Ali', 24.0, 0.00, 4.8, 350),
('Advanced Python', 'Muhammad Ali', 36.0, 850000.00, 4.9, 220),
('Web Development', 'Aziz Karimov', 40.0, 950000.00, 4.7, 500),
('HTML & CSS', 'Aziz Karimov', 20.0, 0.00, 4.5, 180),
('Java Programming', 'Muhammad Umar', 35.0, 750000.00, 4.6, 420),
('C++ Fundamentals', 'Muhammad Umar', 30.0, 650000.00, 4.4, 170),
('Database with MySQL', 'Dilshod Rahimov', 28.5, 550000.00, 4.8, 610),
('React JS', 'Dilshod Rahimov', 32.0, 990000.00, 4.9, 450),
('Django Framework', 'Bekzod Xasanov', 38.0, 0.00, 4.7, 260),
('Cyber Security', 'Bekzod Xasanov', 42.0, 980000.00, 4.8, 390),
('Flutter Mobile', 'Sarvar Ismoilov', 34.5, 870000.00, 4.7, 310),
('Linux Administration', 'Sarvar Ismoilov', 31.5, 0.00, 4.6, 140),
('Machine Learning', 'Muhammad Yusuf', 48.0, 990000.00, 4.9, 550),
('Cloud Computing', 'Muhammad Yusuf', 45.0, 920000.00, 4.8, 280),
('UI/UX Design', 'Nilufar Qodirova', 27.0, 450000.00, 4.5, 190);


SELECT * FROM kurs WHERE price = 0;
+----------+----------------------+-----------------+--------------+-------+--------+----------+
| CourseID | Title                | Instuctor       | DurationHour | Price | Rating | Enrolled |
+----------+----------------------+-----------------+--------------+-------+--------+----------+
|        1 | Python Basics        | Muhammad Ali    |         24.0 |  0.00 |    4.8 |      350 |
|        4 | HTML & CSS           | Aziz Karimov    |         20.0 |  0.00 |    4.5 |      180 |
|        9 | Django Framework     | Bekzod Xasanov  |         38.0 |  0.00 |    4.7 |      260 |
|       12 | Linux Administration | Sarvar Ismoilov |         31.5 |  0.00 |    4.6 |      140 |
+----------+----------------------+-----------------+--------------+-------+--------+----------+

SELECT Title FROM kurs WHERE price = 0;
+----------------------+
| Title                |
+----------------------+
| Python Basics        |
| HTML & CSS           |
| Django Framework     |
| Linux Administration |
+----------------------+


SELECT * FROM kurs ORDER BY enrolled DESC LIMIT 3;
+----------+---------------------+-----------------+--------------+-----------+--------+----------+
| CourseID | Title               | Instuctor       | DurationHour | Price     | Rating | Enrolled |
+----------+---------------------+-----------------+--------------+-----------+--------+----------+
|        7 | Database with MySQL | Dilshod Rahimov |         28.5 | 550000.00 |    4.8 |      610 |
|       13 | Machine Learning    | Muhammad Yusuf  |         48.0 | 990000.00 |    4.9 |      550 |
|        3 | Web Development     | Aziz Karimov    |         40.0 | 950000.00 |    4.7 |      500 |
+----------+---------------------+-----------------+--------------+-----------+--------+----------+

SELECT Title FROM kurs ORDER BY enrolled DESC LIMIT 3;
+---------------------+
| Title               |
+---------------------+
| Database with MySQL |
| Machine Learning    |
| Web Development     |
+---------------------+


SELECT * FROM kurs WHERE Instuctor LIKE '%Muhammad%';
+----------+------------------+----------------+--------------+-----------+--------+----------+
| CourseID | Title            | Instuctor      | DurationHour | Price     | Rating | Enrolled |
+----------+------------------+----------------+--------------+-----------+--------+----------+
|        1 | Python Basics    | Muhammad Ali   |         24.0 |      0.00 |    4.8 |      350 |
|        2 | Advanced Python  | Muhammad Ali   |         36.0 | 850000.00 |    4.9 |      220 |
|        5 | Java Programming | Muhammad Umar  |         35.0 | 750000.00 |    4.6 |      420 |
|        6 | C++ Fundamentals | Muhammad Umar  |         30.0 | 650000.00 |    4.4 |      170 |
|       13 | Machine Learning | Muhammad Yusuf |         48.0 | 990000.00 |    4.9 |      550 |
|       14 | Cloud Computing  | Muhammad Yusuf |         45.0 | 920000.00 |    4.8 |      280 |
+----------+------------------+----------------+--------------+-----------+--------+----------+

SELECT title FROM kurs WHERE Instuctor LIKE '%Muhammad%';
+------------------+
| title            |
+------------------+
| Python Basics    |
| Advanced Python  |
| Java Programming |
| C++ Fundamentals |
| Machine Learning |
| Cloud Computing  |
+------------------+

ALTER TABLE kurs CHANGE Instuctor Instructor VARCHAR(100);

SELECT Instructor, JSON_ARRAYAGG(title) as kurslar, COUNT(*) AS kurs_soni
    -> FROM kurs
    -> GROUP BY Instructor;
+------------------+--------------------------------------------+-----------+
| Instructor       | kurslar                                    | kurs_soni |
+------------------+--------------------------------------------+-----------+
| Aziz Karimov     | ["Web Development", "HTML & CSS"]          |         2 |
| Bekzod Xasanov   | ["Django Framework", "Cyber Security"]     |         2 |
| Dilshod Rahimov  | ["Database with MySQL", "React JS"]        |         2 |
| Muhammad Ali     | ["Python Basics", "Advanced Python"]       |         2 |
| Muhammad Umar    | ["Java Programming", "C++ Fundamentals"]   |         2 |
| Muhammad Yusuf   | ["Machine Learning", "Cloud Computing"]    |         2 |
| Nilufar Qodirova | ["UI/UX Design"]                           |         1 |
| Sarvar Ismoilov  | ["Flutter Mobile", "Linux Administration"] |         2 |
+------------------+--------------------------------------------+-----------+

ALTER TABLE kurs RENAME TO courses;


------------------------------------------------------------------------------------

CREATE TABLE books(
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    YearPublished YEAR NOT NULL,
    PageCount INT NOT NULL, 
    Price DECIMAL(6,2) DEFAULT 0,
    Available BOOLEAN DEFAULT TRUE);


    