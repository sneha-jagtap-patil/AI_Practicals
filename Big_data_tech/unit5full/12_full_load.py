import duckdb

print("Full load")

con = duckdb.connect("taxi.db")

con.execute("""
CREATE OR REPLACE TABLE taxi_full AS
SELECT * FROM taxi      
""")

print("Full Load Done")

con.close()