import duckdb

print("Aggregations - Complete")

con = duckdb.connect("taxi.db")

# 1. Basic Aggregation

print("\n ---- Daily Revenue ----")

result = con.execute(""" 
SELECT DATE(pickup) AS day,

-- Total number of trips               
COUNT(*) AS trips,
                     
-- Total revenue
SUM(total) AS revenue
                     
FROM taxi
GROUP BY DATE(pickup)
ORDER BY day

""").fetchdf()

print(result)


# 2. Multi-Dimension Aggregation

print("\n ---- Revenue by payment + Day ----")

result1 = con.execute("""
SELECT payment, DATE(pickup) AS day,

SUM(total) AS revenue

FROM taxi
GROUP BY payment, day
ORDER BY day
LIMIT 20  
""").fetchdf()

print(result1)


# 3. ROLLUP (Advanced aggregation)

# print("\n ---- ROLLUP Aggregation----")

# result2 = con.execute("""
# SELECT payment, DATE(pickup) AS day, SUM(total) AS revenue
# FROM taxi
# GROUP BY ROLLUP(payment, DATE(pickup))    
# -- ORDER BY      
# LIMIT 20     
# """).fetchdf()

# print(result2)


print("\n---- ROLLUP Aggregation (Structured Output) ----")

result2 = con.execute("""
SELECT 
    COALESCE(payment, 'ALL_PAYMENTS') AS payment_type,
    COALESCE(CAST(DATE(pickup) AS VARCHAR), 'ALL_DATES') AS day,
    SUM(total) AS total_revenue
FROM taxi
GROUP BY ROLLUP(payment, DATE(pickup))
ORDER BY 
    payment_type,
    day
LIMIT 2000
""").fetchdf()

print(result2)

con.close()