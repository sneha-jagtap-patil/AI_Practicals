import duckdb

import pandas as pd

# ✅ Fix truncated output
pd.set_option('display.max_rows', None)        
pd.set_option('display.max_columns', None)     # show all columns
pd.set_option('display.width', None)           # auto width
pd.set_option('display.max_colwidth', None)    # full column content

print("Window Functions - Complete")

con = duckdb.connect("taxi.db")

# 1. GROUP BY VS Window Function

print("\n ----GROUP BY----")
group_result = con.execute("""
SELECT payment, SUM(total) AS total_payment
FROM taxi
GROUP BY payment             
""").fetchdf()

print(group_result)


print("\n ----WINDOW FUNCTION----")
window_result = con.execute("""
SELECT payment, total,
    
    -- Total per payment group (without removing rows)
    
    SUM(total) OVER (PARTITION BY payment) AS total_payment

    FROM taxi
    limit 5
""").fetchdf()

print(window_result)


#2 ROW_NUMBER vs RANK

print("\n ----ROW_NUMBER vs RANK----")

rank_result = con.execute("""
SELECT payment, total,

-- Unique Ranking
ROW_NUMBER() OVER (PARTITION BY payment ORDER BY total DESC) AS row_num,
                          
-- Same rank for same values
RANK() OVER (PARTITION BY payment ORDER BY total DESC) AS rank
                              
FROM taxi
LIMIT 70
""").fetchdf()

print(rank_result)


#3 LAG and LEAD (Time Analysis)

print("\n ---- LAG and LEAD----")

lag_result = con.execute("""
SELECT pickup, total,

-- Previous row value
LAG(total) OVER (ORDER BY pickup) AS prev_total,

-- Next row Value
LEAD(total) OVER (ORDER BY pickup) AS next_total
                        
                         
FROM taxi
LIMIT 20

""").fetchdf()

print(lag_result)



# 4 Percentage Contribution

print("\n ---- Percentage Contribution---")

percent_result = con.execute("""
SELECT payment, total,

total * 100.0 / SUM(total) OVER (PARTITION BY payment) AS percent
                             
FROM taxi

""").fetchdf()

print(percent_result)
con.close()