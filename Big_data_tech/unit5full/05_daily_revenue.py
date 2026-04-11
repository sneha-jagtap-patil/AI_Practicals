import duckdb

print("Step 5: Daily Revenue")

con = duckdb.connect("taxi.db")

result = con.execute("""
SELECT DATE(pickup) AS day, SUM(total) AS revenue
FROM taxi
GROUP BY day
ORDER BY day

""").fetchdf()

print(result)

con.close()