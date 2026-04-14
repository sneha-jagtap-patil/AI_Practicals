# This script loads the taxi dataset into a DuckDB database.
import duckdb

print("Step 1: Loading Dataset...")

con = duckdb.connect("taxi.db")

con.execute("""
CREATE OR REPLACE TABLE taxi AS 
SELECT * FROM
read_csv_auto('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/taxis.csv') 
""")

print("Dataset Loaded Successfully")

con.close()


