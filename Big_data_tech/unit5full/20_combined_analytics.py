import duckdb

print("Combined Analytics")

con = duckdb.connect("taxi.db")

result = con.execute("""
SELECT payment, DATE(pickup) AS day,


-- Aggregation
SUM(total) AS revenue,
                     
-- Ranking within each payment group
ROW_NUMBER() OVER (PARTITION BY payment ORDER BY SUM(total) DESC) AS rank,

-- Percentage Contribution
SUM(total) * 100.0 / SUM(SUM(total)) OVER (PARTITION BY payment) AS percent
                     
FROM taxi
GROUP BY payment,day
                     
""").fetchdf()

print(result)

result.to_csv("Combined_analytics.csv",index=False)


con.close()