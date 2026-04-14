import duckdb

print("Step 6: Peak Hours")

con = duckdb.connect("taxi.db")

result = con.execute("""
SELECT EXTRACT(HOUR FROM pickup) AS hour,
COUNT(*) AS trips
FROM taxi
GROUP BY hour
ORDER BY trips DESC

""").fetchdf()
# Identify the hours of the day when taxi demand is highest.s
print(result)

con.close()