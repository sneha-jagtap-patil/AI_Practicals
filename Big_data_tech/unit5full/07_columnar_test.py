import duckdb

print("Step 7: Columnar Performance Test")

con = duckdb.connect("taxi.db")

result = con.execute("""
SELECT SUM(total) FROM taxi

""").fetchdf()

print(result)
# This test demonstrates the performance benefits of columnar storage in DuckDB, especially for aggregation queries like this one.
con.close()