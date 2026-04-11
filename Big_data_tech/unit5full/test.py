import duckdb

con = duckdb.connect()

print(con.execute("SELECT 1+1").fetchall())