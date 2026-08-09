-----------------------1-link-------------------------------------------
CREATE DATABASE IF NOT EXISTS transport_routes_db;
USE transport_routes_db;
CREATE TABLE routes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    route_number VARCHAR(10) NOT NULL,
    start_point VARCHAR(50) NOT NULL,
    end_point VARCHAR(50) NOT NULL,
    duration_min INT NOT NULL,
    distance_km DECIMAL(5,1) NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL,
    bus_type VARCHAR(20) NOT NULL
);

INSERT INTO routes
(route_number, start_point, end_point, duration_min, distance_km, ticket_price, bus_type)
VALUES
('1', 'Chorsu', 'Beruniy', 20, 8.5, 3000.00, 'Shahar'),
('5', 'Qo''yliq', 'Sergeli', 35, 14.2, 4000.00, 'Shahar'),
('12', 'Yunusobod', 'Olmazor', 40, 16.8, 4500.00, 'Shahar'),
('21A', 'Chilonzor', 'Toshkent City', 28, 10.4, 3500.00, 'Shahar'),
('30', 'Buyuk Ipak Yo''li', 'Qo''yliq', 50, 21.7, 6000.00, 'Shahar'),
('45', 'Namangan', 'Andijon', 95, 72.5, 18000.00, 'Tezyurar'),
('55', 'Andijon', 'Farg''ona', 80, 65.3, 17000.00, 'Tezyurar'),
('60', 'Farg''ona', 'Qo''qon', 90, 78.6, 19000.00, 'Tezyurar'),
('75', 'Toshkent', 'Chirchiq', 60, 35.0, 9000.00, 'Elektr'),
('81', 'Toshkent', 'Yangiyo''l', 75, 48.2, 11000.00, 'Elektr'),
('90', 'Samarqand', 'Jizzax', 120, 95.8, 25000.00, 'Tezyurar'),
('101', 'Buxoro', 'Navoiy', 110, 88.4, 22000.00, 'Tezyurar'),
('110', 'Urganch', 'Xiva', 45, 32.5, 8000.00, 'Shahar'),
('120', 'Termiz', 'Denov', 70, 54.6, 13000.00, 'Elektr'),
('130', 'Qarshi', 'Shahrisabz', 85, 69.7, 16000.00, 'Elektr');




SELECT * FROM routes ORDER BY ticket_price;
+----+--------------+------------------+---------------+--------------+-------------+--------------+----------+
| id | route_number | start_point      | end_point     | duration_min | distance_km | ticket_price | bus_type |
+----+--------------+------------------+---------------+--------------+-------------+--------------+----------+
|  1 | 1            | Chorsu           | Beruniy       |           20 |         8.5 |      3000.00 | Shahar   |
|  4 | 21A          | Chilonzor        | Toshkent City |           28 |        10.4 |      3500.00 | Shahar   |
|  2 | 5            | Qoyliq           | Sergeli       |           35 |        14.2 |      4000.00 | Shahar   |
|  3 | 12           | Yunusobod        | Olmazor       |           40 |        16.8 |      4500.00 | Shahar   |
|  5 | 30           | Buyuk Ipak Yoli  | Qoyliq        |           50 |        21.7 |      6000.00 | Shahar   |
| 13 | 110          | Urganch          | Xiva          |           45 |        32.5 |      8000.00 | Shahar   |
|  9 | 75           | Toshkent         | Chirchiq      |           60 |        35.0 |      9000.00 | Elektr   |
| 10 | 81           | Toshkent         | Yangiyol      |           75 |        48.2 |     11000.00 | Elektr   |
| 14 | 120          | Termiz           | Denov         |           70 |        54.6 |     13000.00 | Elektr   |
| 15 | 130          | Qarshi           | Shahrisabz    |           85 |        69.7 |     16000.00 | Elektr   |
|  7 | 55           | Andijon          | Fargona        |           80 |        65.3 |     17000.00 | Tezyurar |
|  6 | 45           | Namangan         | Andijon       |           95 |        72.5 |     18000.00 | Tezyurar |
|  8 | 60           | Fargona          | Qoqon         |           90 |        78.6 |     19000.00 | Tezyurar |
| 12 | 101          | Buxoro           | Navoiy        |          110 |        88.4 |     22000.00 | Tezyurar |
| 11 | 90           | Samarqand        | Jizzax        |          120 |        95.8 |     25000.00 | Tezyurar |
+----+--------------+------------------+---------------+--------------+-------------+--------------+----------+

SELECT * FROM routes ORDER BY distance_km DESC LIMIT 3;
+----+--------------+-------------+-----------+--------------+-------------+--------------+----------+
| id | route_number | start_point | end_point | duration_min | distance_km | ticket_price | bus_type |
+----+--------------+-------------+-----------+--------------+-------------+--------------+----------+
| 11 | 90           | Samarqand   | Jizzax    |          120 |        95.8 |     25000.00 | Tezyurar |
| 12 | 101          | Buxoro      | Navoiy    |          110 |        88.4 |     22000.00 | Tezyurar |
|  8 | 60           | Fargona     | Qoqon     |           90 |        78.6 |     19000.00 | Tezyurar |
+----+--------------+-------------+-----------+--------------+-------------+--------------+----------+

SELECT * FROM routes WHERE duration_min > 30;
+----+--------------+------------------+------------+--------------+-------------+--------------+----------+
| id | route_number | start_point      | end_point  | duration_min | distance_km | ticket_price | bus_type |
+----+--------------+------------------+------------+--------------+-------------+--------------+----------+
|  2 | 5            | Qo'yliq          | Sergeli    |           35 |        14.2 |      4000.00 | Shahar   |
|  3 | 12           | Yunusobod        | Olmazor    |           40 |        16.8 |      4500.00 | Shahar   |
|  5 | 30           | Buyuk Ipak Yo'li | Qo'yliq    |           50 |        21.7 |      6000.00 | Shahar   |
|  6 | 45           | Namangan         | Andijon    |           95 |        72.5 |     18000.00 | Tezyurar |
|  7 | 55           | Andijon          | Farg'ona   |           80 |        65.3 |     17000.00 | Tezyurar |
|  8 | 60           | Farg'ona         | Qo'qon     |           90 |        78.6 |     19000.00 | Tezyurar |
|  9 | 75           | Toshkent         | Chirchiq   |           60 |        35.0 |      9000.00 | Elektr   |
| 10 | 81           | Toshkent         | Yangiyo'l  |           75 |        48.2 |     11000.00 | Elektr   |
| 11 | 90           | Samarqand        | Jizzax     |          120 |        95.8 |     25000.00 | Tezyurar |
| 12 | 101          | Buxoro           | Navoiy     |          110 |        88.4 |     22000.00 | Tezyurar |
| 13 | 110          | Urganch          | Xiva       |           45 |        32.5 |      8000.00 | Shahar   |
| 14 | 120          | Termiz           | Denov      |           70 |        54.6 |     13000.00 | Elektr   |
| 15 | 130          | Qarshi           | Shahrisab' |           85 |        69.7 |     16000.00 | Elektr   |
+----+--------------+------------------+------------+--------------+-------------+--------------+----------+

SELECT bus_type, AVG(ticket_price) as avg FROM routes GROUP BY bus_type;
+----------+--------------+
| bus_type | avg          |
+----------+--------------+
| Shahar   |  4833.333333 |
| Tezyurar | 20200.000000 |
| Elektr   | 12250.000000 |
+----------+--------------+




-----------------2-link-----------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;
CREATE TABLE employees(id INT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(50),
                        surename VARCHAR(50),
                        position VARCHAR(50),
                        department VARCHAR(50),
                        salary DECIMAL(10,2));

INSERT INTO employees(name, surename, position, department, salary) VALUES('Jamshid', 'Rakhimov', 'Dasturchi', 'Axborot texnologiyalari', 70000.00),
('Dildora', 'Tursunova', 'HR Menejeri', 'Kadrlar boshqarmasi', 65000.00),
('Nilufar', 'Karimova', 'Mahsulot Menejeri', 'Savdo', 80000.00),
('Rasul', 'Sobirov', 'UX Dizayneri', 'Dizayn studiyasi', 75000.00),
('Farida', 'Ismailova', 'Malumotlarni Tahlilchi', 'Analitika bolimi', 72000.00),
('Azamat', 'Karimov', 'Texnik Rivojlantiruvchi', 'Texnik xizmatlar', 67000.00),
('Nargiza', 'Tashkentova', 'HR Mutaxassisi', 'Kadrlar boshqarmasi', 60000.00),
('Alisher', 'Muradov', 'Biznes Tahlilchisi', 'Biznes bolimi', 72000.00),
('Zohid', 'Salimov', 'Mahsulot Tahlilchisi', 'Savdo', 74000.00),
('Shahzod', 'Murodov', 'Dasturiy Taminot Mutaxassisi', 'Axborot texnologiyalari', 75000.00)
