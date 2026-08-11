import pymysql
import datetime

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
        self.c.execute("""CREATE DATABASE IF NOT EXISTS data""")
        self.c.execute("""USE data""")

    def CreateTB(self):
        self.c.execute("""CREATE TABLE IF NOT EXISTS company( name VARCHAR(50),
                                                            location VARCHAR(50),
                                                            capital VARCHAR(50),
                                                            employees_count INT,
                                                            establishedAt INT,
                                                            monthly_expenses INT)""")
    def Insert(self):
        self.c.execute("""INSERT INTO company 
                    (name, location, capital, employees_count, establishedAt, monthly_expenses)
                    VALUES
                    ('Artel', 'Tashkent', 500000000, 1200, 2010, 15000000),
                    ('Uzum', 'Tashkent', 300000000, 800, 2017, 12000000),
                    ('Click', 'Tashkent', 250000000, 450, 2012, 9000000),
                    ('Beeline', 'Samarkand', 700000000, 1500, 2006, 20000000),
                    ('Payme', 'Tashkent', 200000000, 300, 2013, 7500000),
                    ('Korzinka', 'Tashkent', 450000000, 900, 1996, 18000000),
                    ('Texnopark', 'Namangan', 600000000, 1100, 2019, 14000000),
                    ('Imkon', 'Andijan', 180000000, 250, 2015, 6000000),
                    ('Express24', 'Samarkand', 220000000, 350, 2018, 8000000),
                    ('Najot Ta''lim', 'Tashkent', 100000000, 200, 2018, 5000000);""")
        self.db.commit()

    def FirstQuery(self):
        self.c.execute("""SELECT name FROM company ORDER BY name""")
        return self.c.fetchall()

    def SecondQuery(self):
        self.c.execute("""SELECT capital FROM company ORDER BY capital DESC""")
        return self.c.fetchall()

    def ThirdQuery(self):
        self.c.execute("""SELECT * FROM company ORDER BY employees_count LIMIT 1""")
        return self.c.fetchone()

    def FourthQuery(self):
        self.c.execute('''SELECT * FROM company WHERE location = "Tashkent"''')
        return self.c.fetchall()

    def FifthQuery(self):
        self.c.execute('''SELECT location, COUNT(*) as soni FROM company GROUP BY location''')
        return self.c.fetchall()

    def SixthQuery(self):
        year = datetime.datetime.now().year
        self.c.execute(f"""SELECT name, (({year} - establishedAt) * (monthly_expenses * 12)) as total FROM company""")
        return self.c.fetchall()
mysql = MySQL()
# mysql.CreateTB()
# mysql.Insert()

# a = mysql.FirstQuery()
# for i in a:
#     print(i)

# for i in mysql.SecondQuery():
#     print(i)

# print(mysql.ThirdQuery())

# for i in mysql.FourthQuery():
#     print(i)

# for i in mysql.FifthQuery():
#     print(i)

# for i in mysql.SixthQuery():
#     print(i)