import duckdb

print("Final Analysis")

con = duckdb.connect("taxi.db")

result = con.execute("""
SELECT
    DATE(pickup) AS day,
    COUNT(*) AS trips,
    SUM(total) AS revenue
FROM taxi_inc
GROUP BY DATE(pickup)
ORDER BY revenue DESC
LIMIT 5                  
                     
""").fetchdf()

print(result)

con.close()