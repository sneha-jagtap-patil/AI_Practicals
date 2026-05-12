#Creating a Data Frame

employees <- data.frame(
  emp_id = 1:5,
  name = c("amit","Sneha","Ajay","Yash","Anurag"),
  salary = c(20000,25000,30000,28750,40000),
  department = c("IT","HR","IT","Sales","IT")
)

employees

#Inspecting the Data Frame

#Check the structure of Data Frame
str(employees)

#Check the overall summary --> useful for quick statistics
summary(employees)

#Check Count of rows and columns
dim(employees)




#Accessing the Columns

#Using $ method
employees$salary
employees$name


#using [] method
#[rows,columns]

employees[,4] #4th column (index method)
employees[,"salary"] #salary column (name method)



#Filtering the rows

#Employees in IT Department
employees[employees$department =="IT",]


#Salary above 30,000
employees[employees$salary>30000,]

#Handling the Missing Values or NA Values
mean(employees$salary)

mean(employees$salary, na.rm = TRUE)


#Adding a new column

#Adding a bonus column
employees$bonus <-employees$salary * 0.10
employees

#Adding a Total Salary column
employees$total_salary <-employees$salary + employees$bonus
employees

