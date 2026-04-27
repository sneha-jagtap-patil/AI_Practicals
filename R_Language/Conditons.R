# only if statement 

salary <- 20000

if(salary > 30000)
{
  print("Salary is High")
}

#if-else statement

salary1 <-25000

if(salary1 >30000){
  print("High salary")
} else {
  print("Normal Salary")
}


#if else-if else

salary2 <-45000
bonus <-0

if(salary2 > 40000)
{
  bonus <- 5000
} else if (salary2 >30000)
{
  bonus <-3000
} else { bonus <-1000
}
print(bonus)



# Another Example

salary3 <-32000
bonus1 <-0

if(salary3 > 40000)
{
  bonus1 <- 5000
} else if (salary3 >30000)
{
  bonus1 <-3000
} else { bonus1 <-1000
}
print(bonus1)



# AND Operator Conditions

marks <-85
attendance <-80

if(marks >=80 & attendance >=75)
{
  print("Distinction")
}


# OR Operator condition


if(marks >=90 | attendance >=95)
{
  print("Special Recognition")
}



# Nested if Conditions

department <- "IT"
salary5 <- 35000

if(department == "IT"){
  if(salary5 >30000){
    print("IT Senior")
  } else {
    print("IT Junior")
  }
}


# Mini Task

marks2 <-72
attendace2 <-68

if(marks2 >=80 & attendance >=75) 
{
  print("Distinction")
} else if (marks >=60) {
  print("pass")
} else {
  print("Fail")
}



# NA Values in conditions

salary6 <- NA
if(salary6 >30000)
{
  print("High")
}

#Handle NA values in if statement
if(!is.na(salary6) && salary >30000) {
  print("High")
}








