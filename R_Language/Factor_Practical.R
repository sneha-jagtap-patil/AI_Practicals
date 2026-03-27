#Create a Dataframe

employees <- data.frame(
  name = c("Amit","Neha","Rahul","Sneha","Rakesh"),
  Salary = c(25000,30000,28000,40000,35000),
  department = c("IT","HR","IT","Sales","IT")
)

#Convert department into Factor
employees$department <- as.factor(employees$department)

#Check the structure of a data.frame
str(employees)

#Check how many category you have
levels(employees$department)
