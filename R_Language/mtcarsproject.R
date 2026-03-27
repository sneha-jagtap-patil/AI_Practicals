#display the in-built dataset
data()

#View the full dataset
View(mtcars)

#install the ggplot2 package
#installed.packages("ggplot2")

#Load Required packages -- ggplot2 (0)
library(ggplot2)


#Dataset Exploration Part (1)

# Load built-in dataset
data(mtcars)

#first 6 rows
head(mtcars)

#Summary of statistics
summar
#Get column name
colnames(mtcary(mtcars)
s)

#numbers of rows and columns
dim(mtcars)

#Structure of dataset (data types)
str(mtcars)



# Business Logic (2)

#calculate average mileage (POV Sales efficiency)
average_mileage <- mean(mtcars$mpg)

#print the average mileage
average_mileage


#define a constant using variable (Tax Rate)
tax_rate <-0.18

tax_rate


#identify high performing products
high_performance <- mtcars$mpg > average_mileage

#counting the high and low performing products
table(high_performance)


# Data Visualization

ggplot(mtcars,aes(wt,mpg)) + geom_point() + labs(title = "Sales Efficiency vs Product weight", x = "Product Weight", y="Sales Efficiency")

