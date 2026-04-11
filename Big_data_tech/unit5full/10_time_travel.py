import duckdb

print("Step 10: Time Travel")

con = duckdb.connect("taxi.db")

#Create backup table
#this simulates the old version of data

con.execute("""
CREATE OR REPLACE TABLE taxi_backup AS
SELECT * FROM taxi_schema
""")

#simulate wrong operation
#delete small values

con.execute(""" 
DELETE FROM taxi_schema
WHERE total < 10
""")

print("After deletion: ")
print(con.execute("SELECT COUNT(*) FROM taxi_schema").fetchall())


#Restore old data
#Replace with backup

con.execute(""" 
CREATE OR REPLACE TABLE taxi_schema AS 
SELECT * FROM taxi_backup 
""")

print("After restoring old version: ")
print(con.execute("SELECT COUNT(*) FROM taxi_schema").fetchall())

con.close()