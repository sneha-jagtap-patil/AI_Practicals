sales <- matrix(
  c(100,200,150,300,400,500,900,1000),
  nrow = 4
)

sales

t(sales) #transpose

#array

arr <- array(1:24,dim = c(2,3,5))
arr

#mini task solution 

#quantity matrix 

quantity <-matrix(c(5,10,8,12),nrow=2,byrow = TRUE)
quantity

rownames(quantity) <- c("Product_A","Product_B")
colnames(quantity) <-c("Month_1","Month_2")
quantity

price <-matrix(c(100,150),ncol=1)
price

rownames(price) <- c("Month_1","Month_2")
colnames(price) <-c("Price")
price
quantity

revenue <- quantity %*% price
revenue

#List creation

students <- list(
  name ="Vivek",
  age = 20,
  marks = c(80,85,90),
  passed = TRUE
)

View(students)

students$name
students$marks

students[[3]]

students[["age"]]

class(students[[4]])

