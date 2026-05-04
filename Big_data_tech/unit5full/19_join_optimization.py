import duckdb

print("Join Optimization")

con = duckdb.connect("taxi.db")

##Helper Table
con.execute("""
CREATE OR REPLACE TABLE payment_info AS
SELECT DISTINCT payment AS type            
FROM taxi
""")


# 1. Basic Join

print("\n ----Basic Join----")

result = con.execute("""
SELECT * FROM taxi t JOIN payment_info p
ON t.payment = p.type
                                          
                     
""").fetchdf()

print(result)

# Download Output (IMP)
result.to_csv("BasicJoin.csv",index=False)


# 2. Optimized Join 

print("\n ----Optimized Join----")

result1 = con.execute("""
SELECT t.payment, t.total

FROM ( SELECT * FROM taxi WHERE total > 100
) t

JOIN payment_info p
ON t.payment = p.type
                      


""").fetchdf()



print(result1)

result1.to_csv("OptimizedJoin.csv",index=False)

con.close()