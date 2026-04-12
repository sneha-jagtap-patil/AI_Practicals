import duckdb

print("Incremental load")

con = duckdb.connect("taxi.db")

con.execute("""
CREATE TABLE IF NOT EXISTS taxi_inc AS
SELECT * FROM taxi WHERE 1=0        
""")

con.execute("""
INSERT INTO taxi_inc 
SELECT *
FROM taxi     
WHERE pickup > (SELECT COALESCE(MAX(pickup),'1900-01-01')FROM taxi_inc)

""")

print("Only new data loaded")

con.close()