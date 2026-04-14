# Step 3: Total Revenue
import duckdb

print("Step 3: Total Revenue")

con = duckdb.connect("taxi.db")

result = con.execute(""" 
SELECT SUM(total) AS total_revenueS
FROM taxi
""").fetchdf()

print(result)

con.close() 