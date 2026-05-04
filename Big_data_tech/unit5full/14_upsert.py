import duckdb

print("Upsert") 

con = duckdb.connect("taxi.db")

con.execute("""
DELETE FROM taxi_inc
WHERE pickup IN (SELECT pickup FROM taxi)            
""")

con.execute("""
INSERT INTO taxi_inc
SELECT * FROM taxi         
""")

print("Data Updated and Inserted")

con.close()

