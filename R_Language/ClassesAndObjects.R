#Checking the class of a variable
x<-10
class(x)

name <-"Sneha"
class(name)

y<-TRUE
class(y)

#Checking the class of a vector
x1 <-c(1,2,3,4)
class(x1)
str(x1)

#Checking the class of a dataframe
df <-data.frame(
  name = c("amit","neha"),
  salary = c(30000,40000)
)
str(df)


#Creating Custom Class

employee <-list(name="amit", salary = 30000)

class(employee)

class(employee) <- "Employee"
class(employee)


#Method for custom class - Method Dispatch
print.Employee <-function(obj){
  cat("Employee Name:",obj$name,"\n")
  cat("Salary:",obj$salary,"\n")
}

print(employee)




#simple error example in vector
x <- c(1,2,3)
y<-c(4,5)
x+y

#syntax error
if(z>5
  print("High")
  
#Object not found error
if(xy <100)
  print("ABCD")
  
#Runtime Error

log("Hello")

#logical error
salary12 <- 30000
bonus1 <-salary12 *10
bonus1
#(30000 x 10)

#0.10 (10%)


#debugging using Print

calculate_bonus <-function(salary){
  bonus<-salary * 0.10
  total <- salary + bonus
  return(total)
}

#Fixing
calculate_bonus <-function(salary){
  print(salary)
  bonus<-salary * 0.10
  print(bonus)
  total <- salary + bonus
  return(total)
}


#debug()
calculate_bonus <-function(salary){
  bonus<-salary * 0.10
  total <- salary + bonus
  return(total)
}
debug(calculate_bonus)
calculate_bonus(50000)

# sample example

data <-c(10,20,30)
str(data)
class(data)
length(data)
summary(data)



#index exceeds size

numbers <- c(2,4,6,8)

for(i in 1:5){
  print(numbers[[i]])
}
