#List creation

student <- list(
  name ="Vivek",
  age = 20,
  marks = c(80,85,90),
  passed = TRUE
)

student


# Accessing list elements

# Method 1 (Using $)
student$name
student$marks

#Method 2 (index number)
student[[3]]

#Method 3 (Index Name)
student[["age"]]


#Checking Data Type
class(student[[4]])



#Nested List --> Opertions 

client_data <- list(
  company = "ABC Pvt Ltd",
  employees = 10,
  revenue = c(50000,60000,70000),
  location = list(
    city = "Pune",
    Country = "India"
  )
)

client_data

#Accessing elements in a nested list (Using $ method)
client_data$location$city

#Accessing elements in a nested list (Using index name method)
client_data[["location"]][["Country"]]


#Modify a List 

#Adding a new element in an existing list
client_data$profit <-c(10000,15000,20000)

client_data

#Remove an element from the exisiting list
client_data$employees <-NULL


#List Functions

#Check the length of a list
length(client_data)

#Extract elements name from a list
names(client_data)

#Check the structure of a list 
str(client_data)


#Mini Task of list
project <-list(
  name = "Sales Analysis",
  budget = 200000,
  monthly_sales = c(50000,60000,70000)
)

#Calculate Total Sales (Sum function)
total_sales <-sum(project$monthly_sales)

total_sales


#calculate average sales (mean function)

average_sales <-mean(project$monthly_sales)

average_sales


#Adding a new element called 'average_sales"
project$average_sales <-average_sales

project
