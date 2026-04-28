#Create a Dataframe............

employees <- data.frame(
  name = c("Amit","Neha","Rahul","Sneha","Rakesh"),
  Salary = c(25000,30000,28000,40000,35000),
  department = c("IT","HR","IT","Sales","IT")
)


#Split the data 

split(employees$Salary,employees$department)


# by() function

#calculate average salary per department

by(employees$Salary, employees$department,mean)




# Mini Task

sales <- data.frame(
  product = c("A","B","A","C","B","A"),
  revenue = c(1000,1500,1200,2000,1300,1100)
)

sales$product <- as.factor(sales$product)

str(sales)

levels(sales$product)

# 1. Total Revenue per product
# 2. Average Revenue per product


# Solution 1
by(sales$revenue, sales$product,sum)

# Solution 2
by(sales$revenue, sales$product,mean)

