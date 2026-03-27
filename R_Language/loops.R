#for loop

for(i in 25:50){
  print(i)
}

#Loop over vector using shortcut method

prices <-c(100,200,300)
prices <- prices * 1.10
prices

# Loop over vector using for loop
prices <-c(100,200,300)
for(i in 1:length(prices)){
  prices[i] <- prices[i] * 1.10
}

prices



#Loops over characters
names <-c("Amit","Sneha","Rahul")

for(name in names) {
  print(paste("Hello",name))
}


#Break statement
for(i in 1:10){
  if(i==5){
    break
  }
  print(i)
}


#Next statement
for(i in 1:5){
  if(i==3){
    next
  }
  print(i)
}


#While loop
attempt <-1

while(attempt <=3){
  print(paste("Attempt",attempt))
  attempt<-attempt + 1
}

#count some numbers using while loop
count <-1

while(count<=5){
  print(count)
  count<-count + 1
}


