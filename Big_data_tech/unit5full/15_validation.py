import duckdb

print("validation")

con = duckdb.connect("taxi.db")

result = con.execute("""
SELECT COUNT(*) AS total_rows,
                     COUNT(DISTINCT pickup) AS unique_rows 
FROM taxi_inc   
""").fetchdf()

print(result)

con.close()