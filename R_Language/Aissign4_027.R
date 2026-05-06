
# SECTION 1: IMPORTING DATA


# IMPORTANT of data
data <- read.csv("C:/Users/Cpu/Downloads/students.csv", stringsAsFactors = FALSE)

print("Dataset Loaded Successfully!")
print(data)

# Structure
print("Structure of Dataset:")
str(data)

# First 5 rows
print("First 5 Rows:")
head(data, 5)

# Last 5 rows
print("Last 5 Rows:")
tail(data, 5)


# SECTION 2: DATA CLEANING.........

# Check missing values
print("Missing Values (TRUE = Missing):")
print(is.na(data))

# Count missing values
print("Missing Values Count:")
print(colSums(is.na(data)))

# Convert columns to numeric 
data$Math <- as.numeric(data$Math)
data$Science <- as.numeric(data$Science)
data$English <- as.numeric(data$English)
data$Attendance <- as.numeric(data$Attendance)

# Replace NA with mean
data$Math[is.na(data$Math)] <- mean(data$Math, na.rm = TRUE)
data$Science[is.na(data$Science)] <- mean(data$Science, na.rm = TRUE)
data$English[is.na(data$English)] <- mean(data$English, na.rm = TRUE)
data$Attendance[is.na(data$Attendance)] <- mean(data$Attendance, na.rm = TRUE)

# Verify cleaning
print("After Cleaning Missing Values:")
print(colSums(is.na(data)))


# SECTION 3: DATA MANIPULATION 


 #install.packages

library(dplyr)

# Add Average column
data <- data %>%
  mutate(Average = (Math + Science + English) / 3)

print("Dataset with Average:")
print(data)

# Filter students
filtered_data <- data %>% filter(Average > 75)
print("Students with Average > 75:")
print(filtered_data)

# Select columns
selected_data <- data %>% select(Name, Average)
print("Selected Columns (Name & Average):")
print(selected_data)

# Sort data
sorted_data <- data %>% arrange(desc(Average))
print("Sorted by Average (Descending):")
print(sorted_data)

# Group by Gender
grouped <- data %>%
  group_by(Gender) %>%
  summarise(Avg_Marks = mean(Average))

print("Average Marks by Gender:")
print(grouped)


# SECTION 4: EDA

print("Summary Statistics:")
summary(data)

# Mean of subjects
subject_means <- colMeans(data[, c("Math", "Science", "English")])
print("Subject Means:")
print(subject_means)

# Correlation
correlation <- cor(data[, c("Math", "Science", "English")])
print("Correlation Matrix:")
print(correlation)

# Highest scoring subject
print("Highest Average Subject:")
print(names(which.max(subject_means)))


# SECTION 5: VISUALIZATION

install.packages("ggplot2")
library(ggplot2)

# Bar Plot
ggplot(data, aes(x = Name, y = Average)) +
  geom_bar(stat = "identity") +
  ggtitle("Students vs Average Marks")

# Scatter Plot
ggplot(data, aes(x = Attendance, y = Average)) +
  geom_point() +
  ggtitle("Attendance vs Average")

# Boxplot
ggplot(data, aes(x = Gender, y = Average)) +
  geom_boxplot() +
  ggtitle("Average Marks by Gender")

# Histogram
ggplot(data, aes(x = Average)) +
  geom_histogram(bins = 10) +
  ggtitle("Distribution of Average Marks")


# STATISTICS

mean_avg <- mean(data$Average)
median_avg <- median(data$Average)
sd_avg <- sd(data$Average)

print("Mean of Average:")
print(mean_avg)

print("Median of Average:")
print(median_avg)

print("Standard Deviation:")
print(sd_avg)


# : MACHINE LEARNING


model <- lm(Average ~ Attendance, data = data)

print("Linear Regression Summary:")
summary(model)

# Predictions
data$Predicted <- predict(model)

print("Actual vs Predicted Values:")
print(data[, c("Average", "Predicted")])


#  EXPORTING DATA

write.csv(data, "cleaned_student_data.csv", row.names = FALSE)

save(data, file = "student_data.RData")

# Reload file
load("student_data.RData")

print("Data Reloaded Successfully!")


# FINAL CHALLENGE


# Grade column
data$Grade <- ifelse(data$Average > 85, "A",
                     ifelse(data$Average >= 70, "B", "C"))

print("Dataset with Grades:")
print(data)

# Top 3 students
top3 <- data %>% arrange(desc(Average)) %>% head(3)
print("Top 3 Students:")
print(top3)

# Best performing gender
best_gender <- data %>%
  group_by(Gender) %>%
  summarise(Average = mean(Average))

print("Performance by Gender:")
print(best_gender)

# Extra Visualization
ggplot(data, aes(x = Grade, fill = Gender)) +
  geom_bar() +
  ggtitle("Grade Distribution by Gender")


