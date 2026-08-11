import pymysql

class MySQL:
    def __init__(self):
        self.ConnectDB()
        self.CreateDB()

    def ConnectDB(self):
        self.db = pymysql.connect(
            host = "localhost",
            user = "root",
            password = "1234"
        )
        self.c = self.db.cursor()

    def CreateDB(self):
        self.c.execute("CREATE DATABASE IF NOT EXISTS restoran")
        self.c.execute("USE restoran")

    def CreateTB(self):
        self.c.execute("""CREATE TABLE IF NOT EXISTS kafe (
                                                    id INT PRIMARY KEY AUTO_INCREMENT,
                                                    name VARCHAR(100),
                                                    address VARCHAR(100),
                                                    maxFoodPrice INT,
                                                    minFoodPrice INT,
                                                    employeesCount INT,
                                                    experience INT)""")

    def Insert(self):
        self.c.execute("""INSERT INTO kafe
                    (name, address, maxFoodPrice, minFoodPrice, employeesCount, experience)
                    VALUES
                    ('Mavr', 'Tashkent', 120000, 35000, 25, 8),
                    ('Mister', 'Samarkand', 150000, 40000, 30, 10),
                    ('Marvarid', 'Tashkent', 100000, 25000, 20, 6),
                    ('Rayhon', 'Namangan', 90000, 20000, 18, 12),
                    ('Sultan', 'Tashkent', 180000, 50000, 35, 15),
                    ('Mazza', 'Andijan', 130000, 30000, 22, 7),
                    ('Milliy', 'Tashkent', 110000, 28000, 27, 9),
                    ('Osh Markazi', 'Bukhara', 80000, 15000, 15, 20),
                    ('Mehmon', 'Samarkand', 140000, 35000, 24, 11),
                    ('Musaffo', 'Tashkent', 200000, 45000, 40, 18);""")
        self.db.commit()

    def FirstQuery(self):
        self.c.execute("SELECT name FROM kafe WHERE name LIKE 'm%' and name LIKE '%r' ORDER BY maxFoodPrice")
        return self.c.fetchall()

    def SecondQuery(self):         # minFoodPrice shunchaki ko'zga kirinish uchun
        self.c.execute("SELECT name, minFoodPrice FROM kafe ORDER BY minFoodPrice DESC LIMIT 3")
        return self.c.fetchall()

    def ThirdQuery(self):
        self.c.execute('''SELECT * FROM (
                        SELECT name, maxFoodPrice, experience
                        FROM kafe
                        ORDER BY maxFoodPrice
                        DESC LIMIT 4) AS r
                        ORDER BY experience''')
        return self.c.fetchall()

mysql = MySQL()
# mysql.CreateTB()
# mysql.Insert()

# a = mysql.FirstQuery()
# for i in a:
#     print(i)

# a = mysql.SecondQuery()
# for i in a:
#     print(i)

a = mysql.ThirdQuery()
for i in a:
    print(i)