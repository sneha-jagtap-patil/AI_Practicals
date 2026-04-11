import duckdb

print("Step 7: Columnar Performance Test")

con = duckdb.connect("taxi.db")

result = con.execute("""
SELECT SUM(total) FROM taxi

""").fetchdf()

print(result)

con.close()