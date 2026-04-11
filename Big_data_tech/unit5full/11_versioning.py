import duckdb
from datetime import datetime

print("Step 11: Versioned data")

con = duckdb.connect("taxi.db")

#create unique version using timestamp

timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

table_name = f"taxi_version_{timestamp}"

#Create new version of dataset
#Each running of code/script it will create a new copy

con.execute(f"""
CREATE TABLE {table_name} AS
SELECT * FROM taxi_schema
""")

print(f"Created version: {table_name}")

con.close()