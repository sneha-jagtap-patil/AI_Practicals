import duckdb

print("Step 9: ACID Transactions")

con = duckdb.connect("taxi.db")

# Start transaction

con.execute("BEGIN TRANSACTION")

try:


#Insert new data
    con.execute(""" 
    INSERT INTO taxi_schema
    VALUES (NOW(),NOW(),200,'card')                
                """)
    
#save changes
    con.execute("COMMIT")
    print("Transaction successful")

except:
    con.execute("ROLLBACK")
    print("Transaction failed")


con.close()