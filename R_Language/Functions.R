#Repetitive Process of Calculating Something
salary1 <- 30000
bonus1<- salary1*0.10
bonus1

bonus2 <-salary1*0.20
bonus2

#Solution: Function (Single Argument)

calculate_bonus <-function(salary){
  bonus <-salary * 0.10
  return(bonus)
}

calculate_bonus(30000)
calculate_bonus(40000)



#Multiple Arguments in Function
calculate_bonus1 <-function(salary9,rate){
  bonus9 <-salary9 * rate
  return(bonus9)
}

calculate_bonus1(30000,0.10)
calculate_bonus1(40000,0.20)


#Default Arguments - Default values make functions Flexible
calculate_bonus0 <-function(salary0,rate0=0.10){
  bonus0 <-salary0 * rate0
  return(bonus0)
}

calculate_bonus0(30000,0.50)
calculate_bonus0(40000,0.20)


#Named Arguments
calculate_bonus01 <-function(salary01,rate01=0.10){
  bonus01 <-salary01 - rate01
  return(bonus01)
}

calculate_bonus01(rate01=0.6,salary01 = 50000) 
calculate_bonus01(0.6,50000) # 0.6 - 50000


#####Lazy Evaluation - Arguments only considers when they are actually used
#IMP for Exam

test_function <-function(x,y){
  return(x)
}

test_function(10,20)

# Y was never used, so R Programming Code never evaluated it
