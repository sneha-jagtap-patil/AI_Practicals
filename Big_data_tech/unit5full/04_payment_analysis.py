import duckdb

print("Step 4: Payment Analysis")

con = duckdb.connect("taxi.db")

result = con.execute("""
SELECT payment, COUNT(*) AS total_trips
FROM taxi
GROUP BY payment
ORDER BY total_trips DESC

""").fetchdf()

print(result)

con.close()