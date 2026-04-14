#import duckdb
import duckdb

print("Step 2: preview Data..")

con = duckdb.connect("taxi.db")

result = con.execute("SELECT * FROM taxi LIMIT 5").fetchdf()

print(result)

con.close()