#Creating a Data Frame

employees <- data.frame(
  emp_id = 1:5,
  name = c("amit","Sneha","Rahul","Yash","Anurag"),
  salary = c(20000,25000,30000,28750,40000),
  department = c("IT","HR","IT","Sales","IT")
)

employees
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


#Extract only IT Department
it_employees <- employees[employees$department == "IT", ]
it_employees

#Extract Selected Columns:
employees[,c("name","salary")]




#rbind() --> Row Bind --> Used to add new row in the existing data frame

#Ading a new employee using rbind()

new_emp <- data.frame(
  emp_id = 6,
  name = "Anuj",
  salary = 50000,
  department = "HR"
)

employees <- rbind(employees,new_emp)
employees



#Adding a new column using cbind()
age <- c(25,28,24,27,40,30)
employees <- cbind(employees,age)
employees




#Mini Task for revision purpose
# 1. Average Salary per department
# 2. IT Employees earning above 25,000

tapply(employees$salary,employees$department,mean,na.rm=TRUE)

employees[employees$department == "IT" & employees$salary >25000, ]
