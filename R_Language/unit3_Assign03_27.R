
# DATASET CREATION 

customer_id <- 1:20

amount_spent <- c(2500, 1800, 900, 3000, 1200, 700, 2200, 1500, 500, 2700,
                  2100, 1600, 800, 2900, 1300, 600, 2400, 1700, 400, 2600)

visits <- c(5, 2, 3, 6, 4, 1, 5, 3, 2, 7,
            4, 3, 2, 6, 5, 1, 4, 3, 2, 6)

membership <- rep(c("Gold", "Silver", "Bronze", "Gold"), 5)

grocery_df <- data.frame(
  Customer_ID = customer_id,
  Amount = amount_spent,
  Visits = visits,
  Membership = membership
)

print("Initial Dataset:")
print(grocery_df)


# BASIC EXPLORATION 


print("Summary of Dataset:")
print(summary(grocery_df))

print("Structure of Dataset:")
str(grocery_df)


# TASK 1: CONDITIONS 

grocery_df$Category <- ifelse(grocery_df$Amount > 2000, "High",
                              ifelse(grocery_df$Amount >= 1000, "Medium", "Low"))

print("Dataset with Category:")
print(grocery_df)

# Count categories
print("Category Count:")
print(table(grocery_df$Category))


# TASK 2: LOOP 


print("Customer Categories using for loop:")
for(i in 1:nrow(grocery_df)) {
  cat("Customer:", grocery_df$Customer_ID[i],
      "| Category:", grocery_df$Category[i], "\n")
}

# While loop
print("While Loop")
i <- 1
while(i <= 5) {
  print(paste("Checking Customer", i))
  i <- i + 1
}


# TASK 3: CONTROL FUNCTIONS 

print("Control Flow")

valid_customers <- c()

for(i in 1:nrow(grocery_df)) {
  
  if(grocery_df$Amount[i] < 0) {
    stop("Negative amount found!")
  }
  
  if(grocery_df$Visits[i] < 3) {
    next
  }
  
  valid_customers <- c(valid_customers, grocery_df$Customer_ID[i])
  
  print(paste("Valid Customer:", grocery_df$Customer_ID[i]))
}

print("Valid Customers:")
print(valid_customers)


# TASK 4: APPLY FAMILY

print("Apply Functions Analysis:")

# Mean, Max, Min
avg_amount <- mean(grocery_df$Amount)
max_amount <- max(grocery_df$Amount)
min_amount <- min(grocery_df$Amount)

print(avg_amount)
print(max_amount)
print(min_amount)

# sapply
print("Mean using sapply:")
print(sapply(grocery_df[, c("Amount", "Visits")], mean))

# lapply
print("Using lapply:")
print(lapply(grocery_df[, c("Amount", "Visits")], summary))


# TASK 5: FUNCTION WITH DEFAULT ARGUMENT


calculate_discount <- function(amount, membership = "Bronze") {
  
  if(membership == "Gold") {
    discount <- amount * 0.20
  } else if(membership == "Silver") {
    discount <- amount * 0.10
  } else {
    discount <- amount * 0.05
  }
  
  return(discount)
}

# Apply discount to all customer
grocery_df$Discount <- mapply(calculate_discount,
                              grocery_df$Amount,
                              grocery_df$Membership)

print("Dataset with Discount:")
print(grocery_df)


# TASK 6: LAZY EVALUATION


lazy_discount <- function(amount, membership = "Bronze") {
  
  result <- function() {
    if(membership == "Gold") return(amount * 0.20)
    else if(membership == "Silver") return(amount * 0.10)
    else return(amount * 0.05)
  }
  
  return(result)
}

ld1 <- lazy_discount(3000, "Gold")
ld2 <- lazy_discount(1500, "Silver")

print("Lazy Evaluation Results:")
print(ld1())
print(ld2())


# TASK 7: OBJECTS AND CLASSES

customer_obj <- list(
  ID = 101,
  Amount = 2800,
  Visits = 6,
  Membership = "Gold"
)

class(customer_obj) <- "Customer"

print("Customer Object:")
print(customer_obj)

print("Class of Object:")
print(class(customer_obj))


# TASK 8: DEBUGGING


# Error Function
error_function <- function(x) {
  return(x + z)  # z undefined
}


# Fixed Function
fixed_function <- function(x, z) {
  return(x + z)
}

print("Fixed Function Output:")
print(fixed_function(10, 5))


# EXTRA ANALYSIS 


print("Top 5 Customers by Spending:")
top5 <- grocery_df[order(-grocery_df$Amount), ][1:5, ]
print(top5)

print("Customers with High Spending:")
high_spenders <- grocery_df[grocery_df$Category == "High", ]
print(high_spenders)

print("Average Spending by Membership:")
print(tapply(grocery_df$Amount, grocery_df$Membership, mean))

print("Total Visits:")
print(sum(grocery_df$Visits))


# FINAL MESSAGE


print("Extended Program Completed Successfully!")