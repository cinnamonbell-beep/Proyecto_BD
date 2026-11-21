import pymysql
from pymongo import MongoClient, errors
from decimal import Decimal
import sys

# CONFIG
MYSQL_DB_NAME = "GroceryStore"
MONGO_DB_NAME = "GroceryStore"

# DATABASE CONNECTIONS
mysql_conn = pymysql.connect(
    host='localhost',
    user='root',
    password=''
)

mongo_client = MongoClient("mongodb://localhost:27017/")


# CHECK MYSQL DATABASE EXISTS
with mysql_conn.cursor() as cursor:
    cursor.execute("SHOW DATABASES")
    available_dbs = [row[0].lower() for row in cursor.fetchall()]
    if MYSQL_DB_NAME.lower() not in available_dbs:
        print(f"❌ MySQL database '{MYSQL_DB_NAME}' does not exist.")
        sys.exit(1)

# Reconnect now selecting the DB
mysql_conn.select_db(MYSQL_DB_NAME)


# MongoDB creates the database automatically when data is inserted
mongo_db = mongo_client[MONGO_DB_NAME]


def get_all_tables():
    with mysql_conn.cursor() as cursor:
        cursor.execute("SHOW TABLES")
        return [row[0] for row in cursor.fetchall()]


def migrate_table(table_name, use_sp=False):
    try:
        with mysql_conn.cursor(pymysql.cursors.DictCursor) as cursor:

            if use_sp:
                sp_name = f"getAll{table_name.capitalize()}"
                cursor.callproc(sp_name)
            else:
                cursor.execute(f"SELECT * FROM `{table_name}`")

            rows = cursor.fetchall()

            if not rows:
                print(f"No data found in table: {table_name}")
                return

            # MongoDB cannot store Decimal values, so convert them to float
            rows = [{k: float(v) if isinstance(v, Decimal) else v for k, v in row.items()} for row in rows]

            mongo_db[table_name].insert_many(rows)
            print(f"✔ Migration successful for '{table_name}' ({len(rows)} rows).")

    except Exception as e:
        print(f"❌ Error migrating '{table_name}': {e}")


# MAIN PROCESS
tables = get_all_tables()
print(f"Detected tables: {tables}")

for table in tables:
    migrate_table(table, use_sp=False)
    # migrate_table(table, use_sp=True)


# CLEANUP
mysql_conn.close()
mongo_client.close()