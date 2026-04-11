import duckdb

print("Step 3: Total Revenue")

con = duckdb.connect("taxi.db")

result = con.execute(""" 
SELECT SUM(total) AS total_revenue
FROM taxi
""").fetchdf()

print(result)

con.close()