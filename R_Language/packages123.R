#Get whole list of packages
installed.packages()

#Check a particular Package in installed packages list
"ggplot2" %in% rownames(installed.packages())

#Install a Package
install.packages("ggplot2")

#Delete a package
remove.packages("ggplot2")

#import package or use package
library(ggplot2)

#View a Dataset
View(iris)


#Plot a Graph which will have 150 data points and parameters are:
#1.Sepal Length
#2. Petal Length

ggplot(iris,aes(Sepal.Length,Petal.Length)) + geom_point()
