import duckdb

print("Step 8: Schema Enforcement")

con = duckdb.connect("taxi.db")


con.execute("""
CREATE OR REPLACE TABLE taxi_schema (
pickup TIMESTAMP,
dropoff TIMESTAMP,
total DOUBLE,
payment VARCHAR)
""")


# Enforce the schema by inserting data from the original table into the new schema-defined table. This will ensure that the data conforms to the specified types and structure.

con.execute("""
INSERT INTO taxi_schema
SELECT pickup,dropoff,total,payment
FROM taxi
""")

print("Schema Enforced Successfully")

con.close()