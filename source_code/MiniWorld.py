import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate



def hireAnEmployee():
    # choice = input("ENTER TABLE:")
    # if choice == "PLAYER":
    #     return choice

    """
    This is a sample function implemented for the refrence.
    This example is related to the Employee Database.
    In addition to taking input, you are required to handle domain errors as well
    For example: the SSN should be only 9 characters long
    Sex should be only M or F
    If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
    HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
    """
    # try:
    #     # Takes emplyee details as input
    #     row = {}
    #     print("Enter new employee's details: ")
    #     name = (input("Name (Fname Minit Lname): ")).split(' ')
    #     row["Fname"] = name[0]
    #     row["Minit"] = name[1]
    #     row["Lname"] = name[2]
    #     row["Ssn"] = input("SSN: ")
    #     row["Bdate"] = input("Birth Date (YYYY-MM-DD): ")
    #     row["Address"] = input("Address: ")
    #     row["Sex"] = input("Sex: ")
    #     row["Salary"] = float(input("Salary: "))
    #     row["Dno"] = int(input("Dno: "))

    #     query = "INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Dno) VALUES('%s', '%c', '%s', '%s', '%s', '%s', '%c', %f, %d)" % (
    #         row["Fname"], row["Minit"], row["Lname"], row["Ssn"], row["Bdate"], row["Address"], row["Sex"], row["Salary"], row["Dno"])

    #     print(query)
    #     rows = cur.execute(query)
    #     con.commit()

    #     print("Inserted Into Database")

    # except Exception as e:
    #     con.rollback()
    #     print("Failed to insert into database")
    #     print(">>>>>>>>>>>>>", e)

    return 





def insert():                              #insert
    """
    Function to implement option 2
    """
    try:
        val = (input("Enter Tuple to be inserted: "))
        table = input("ENTER THE TABLES: ")
        query = "INSERT INTO "
        query += table
        query += " VALUES("
        query += val
        query += ")"
        query += ";"
        print(query)
        rows = cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

   
def delete():                                                   #delete
    """
    Function to implement option 1
    """
    try:
        query = "DELETE FROM "
        table = input("ENTER THE TABLES: ")
        query += table
        query += " WHERE "
        condition = input("condition: ")
        query += condition
        query += ";"
        print(query)
        rows = cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return 
 

def update():                                                  #update
    """
    Function to implement option 3
    """
    try:
        table = input("ENTER THE TABLES: ")
        query = "UPDATE "
        query += table
        query += " SET "
        upd = input("ENTER THE ATTRIBUTES AND ITS NEW VALUES: ")
        query += upd
        query += " WHERE "
        condition = input("ENTER CONDITION: ")
        query += condition
        query += ";"
        print(query)
        rows = cur.execute(query)
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to update in the database")
        print(">>>>>>>>>>>>>", e)

    return


def select():                                          #select
    """
    Function to implement option 3
    """
    try:
        query = "SELECT * "
        # selection_items = input("ENTER THE COLUMNS TO BE SELECTED : ")
        # query += selection_items
        query += " FROM "
        tables = input("ENTER THE TABLES: ")
        query += tables
        check = input("Condition[Y/N]: ")
        if check == "yes" or check == "y" or check == "Y":
            query += " WHERE "
            cond = input("ENTER CONDITION: ")
            query += cond
        query += ";"
        print(query)
        rows = cur.execute(query)
        result = cur.fetchall()
        t = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([result[j-1][k] for k in t])
        if result is not None:
            print(tabulate(entry, headers=t, tablefmt='psql'))
            # print("\nResult:\n", result)
        else:
            print("No result found.")

        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to select from database")
        print(">>>>>>>>>>>>>", e)

    return

def projection():
    try:
        query = "SELECT "
        selection_items = input("ENTER THE COLUMNS TO BE PROJECTED : ")
        query += selection_items
        query += " FROM "
        tables = input("ENTER THE TABLES: ")
        query += tables
        check = input("Condition[Y/N]: ")
        if check == "yes" or check == "y" or check == "Y":
            query += " WHERE "
            cond = input("ENTER CONDITION: ")
            query += cond
        query += ";"
        print(query)
        rows = cur.execute(query)
        result = cur.fetchall()
        t = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([result[j-1][k] for k in t])
        if result is not None:
            print(tabulate(entry, headers=t, tablefmt='psql'))
            # print("\nResult:\n", result)
        else:
            print("No result found.")
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to project from database")
        print(">>>>>>>>>>>>>", e)

    return

def aggregate():
    print("1. AVG")
    print("2. MAX")
    print("3. MIN")
    print("4. SUM")
    try:
        query = "SELECT "
        oper = int(input("ENTER YOUR CHOICE OF AGGREGATE: "))
        column = input("ENTER THE COLUMN TO BE SELECTED: ")
        if oper == 1:
            query += "AVG("
            query += column
            query +=")"
        if oper==2:
            query += "MAX("
            query += column
            query +=")"
        if oper==3:
            query += "MIN("
            query += column
            query +=")"
        if oper==4:
            query += "SUM("
            query += column
            query +=")"
        query += " FROM "
        tables = input("ENTER THE TABLES: ")
        query += tables
        check = input("Condition[Y/N]: ")
        if check == "yes" or check == "y" or check == "Y":
            query += " WHERE "
            cond = input("ENTER CONDITION: ")
            query += cond
        query += ";"
        print(query)
        rows = cur.execute(query)
        result = cur.fetchall()
        t = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([result[j-1][k] for k in t])
        if result is not None:
            print(tabulate(entry, headers=t, tablefmt='psql'))
            # print("\nResult:\n", result)
        else:
            print("No result found.")
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to perform aggregate in the database")
        print(">>>>>>>>>>>>>", e)

    return

def search():
    try:
        query = "SELECT *"
        query += " FROM "
        tables = input("ENTER THE TABLES: ")
        query += tables
        query += " WHERE "
        column = input("ENTER THE COLUMN TO BE SEARCHED IN: ")
        query += column
        query += " ="
        value = input("ENTER THE VALUE TO BE SEARCHED: ")
        query += value
        query += ";"
        print(query)
        rows = cur.execute(query)
        result = cur.fetchall()
        t = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([result[j-1][k] for k in t])
        if result is not None:
            print(tabulate(entry, headers=t, tablefmt='psql'))
            # print("\nResult:\n", result)
        else:
            print("No result found.")
        con.commit()
        
    except Exception as e:
        con.rollback()
        print("Failed to Search in the database")
        print(">>>>>>>>>>>>>", e)
    return

def userdefined_functionalities():
    print("1. Best Players Of a Guild")
    print("2. Order Of countries with best players")
    try:
        oper = int(input("ENTER YOUR CHOICE OF AGGREGATE: "))
        if oper == 1:
            guild=input("ENTER GUILD ID:")
            query = "SELECT PLAYERS.* FROM ((PLAYERS RIGHT JOIN GUILD ON PLAYERS.Guild_id = GUILD.Guild_id) JOIN STATS ON PLAYERS.Player_id = STATS.Player_id) WHERE GUILD.Guild_id = " 
            query += guild
            query += " AND STATS.No_of_Matches > 50 AND STATS.Headshot_rate > (SELECT AVG(STATS.Headshot_rate) FROM ((PLAYERS RIGHT JOIN GUILD ON PLAYERS.Guild_id = GUILD.Guild_id) JOIN STATS ON PLAYERS.Player_id = STATS.Player_id) WHERE GUILD.Guild_id = " 
            query += guild
            query += " );"
        if oper == 2:
            query = "SELECT PLAYERS.Region, AVG(CS_kd) AS CS_AVG , AVG(BR_kd) AS BR_AVG, (AVG(CS_kd)+AVG(BR_kd))/2 AS TOT_AVG FROM (PLAYERS RIGHT JOIN STATS ON PLAYERS.Player_id = STATS.Player_id) GROUP BY PLAYERS.Region ORDER BY TOT_AVG DESC;"
        print(query)
        rows = cur.execute(query)
        result = cur.fetchall()
        t = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([result[j-1][k] for k in t])
        if result is not None:
            print(tabulate(entry, headers=t, tablefmt='psql'))
            # print("\nResult:\n", result)
        else:
            print("No result found.")
        con.commit()

    except Exception as e:
        con.rollback()
        print("Failed to EXECUTE Userdefined functionality in database")
        print(">>>>>>>>>>>>>", e)

    return

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        insert()
    elif(ch == 2):
        delete()
    elif(ch == 3):
        update()
    elif(ch == 4):
        select()
    elif(ch == 5):
        projection()
    elif(ch == 6):
        aggregate()
    elif(ch == 7):
        search()
    elif(ch == 8):
        userdefined_functionalities()

    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='127.0.0.1',
                              port=3306,
                              user=username,
                              password=password,
                              db='freefire',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Insert an Entry")  # Hire an Employee
                print("2. Delete an Entry")  # Fire an Employee
                print("3. Update an Entry")  # Promote Employee
                print("4. Selection")  # Employee Statistics
                print("5. Projection")  # Employee Statistics
                print("6. Aggregate Functions")  # Employee Statistics
                print("7. Search")  # Employee Statistics
                print("8. User Defined Functions")  # Employee Statistics

                print("9. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 9:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")

