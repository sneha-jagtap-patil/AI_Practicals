
# STUDENT PERFORMANCE SYSTEM

# PART 1: VECTOR


# Student IDs
student_id <- seq(1, 120, 1)

# Section (A, B, C)
section <- rep(c("A", "B", "C"), each = 40)

# Gender..
gender <- rep(c("Male", "Female"), each = 60)
set.seed(123)
gender <- sample(gender)


# FUNCTION: GENERATE MARKS

generate_marks <- function() {
  
  marks <- sample(40:100, 120, replace = TRUE)
  
  # Insert NA
  na_index <- sample(1:120, 10)
  marks[na_index] <- NA
  
  # NA Count
  print(paste("NA Count:", sum(is.na(marks))))
  
  # Mean
  mean_val <- mean(marks, na.rm = TRUE)
  print(paste("Mean:", mean_val))
  
  # Replace NA
  marks[is.na(marks)] <- mean_val
  
  return(marks)
}

# Generate subject marks
math <- generate_marks()
stats <- generate_marks()
prog <- generate_marks()
db <- generate_marks()
ml <- generate_marks()


# PART 2: MATRIX


marks_matrix <- cbind(math, stats, prog, db, ml)

# Student 10 marks
marks_matrix[10, ]

# Programming marks
marks_matrix[, 3]

# Add grace marks
marks_matrix <- marks_matrix + 5

# Total marks
total_marks <- rowSums(marks_matrix)

# Subject averages
subject_avg <- colMeans(marks_matrix)

print("Subject Averages:")
print(subject_avg)


# PART 3: LIST


student_list <- list(
  ID = student_id,
  Section = section,
  Gender = gender,
  Marks = marks_matrix,
  Total = total_marks
)

# Add Percentage
percentage <- total_marks / 5
student_list$Percentage <- percentage

# Remove Total
student_list$Total <- NULL

# Structure
str(student_list)


# PART 4: DATA FRAME


student_df <- data.frame(
  ID = student_id,
  Section = section,
  Gender = gender,
  Math = math,
  Stats = stats,
  Programming = prog,
  Database = db,
  ML = ml,
  Total = total_marks,
  Percentage = percentage
)

# View data
head(student_df)

# Filtering
female_students <- student_df[student_df$Gender == "Female", ]
section_B <- student_df[student_df$Section == "B", ]
above_75 <- student_df[student_df$Percentage > 75, ]
id_percentage <- student_df[, c("ID", "Percentage")]


# PART 5: RBIND & CBIND


new_students <- data.frame(
  ID = 121:125,
  Section = rep("A", 5),
  Gender = rep("Male", 5),
  Math = sample(50:100, 5),
  Stats = sample(50:100, 5),
  Programming = sample(50:100, 5),
  Database = sample(50:100, 5),
  ML = sample(50:100, 5),
  Total = sample(300:500, 5),
  Percentage = sample(60:95, 5)
)

student_df <- rbind(student_df, new_students)

# Add Attendance
attendance <- sample(75:100, nrow(student_df), replace = TRUE)
student_df <- cbind(student_df, Attendance = attendance)


# PART 6: FACTORS


student_df$Section <- factor(student_df$Section)
student_df$Gender <- factor(student_df$Gender)

# Levels
levels(student_df$Section)

# Rename levels
levels(student_df$Section) <- c("Sec-A", "Sec-B", "Sec-C")

# Count students
print("Students per Section:")
print(table(student_df$Section))


# GRADES


grade <- ifelse(student_df$Percentage >= 85, "A",
                ifelse(student_df$Percentage >= 70, "B",
                       ifelse(student_df$Percentage >= 50, "C", "D")))

student_df$Grade <- factor(grade, ordered = TRUE)

print("Grade Distribution:")
print(table(student_df$Grade))


# PART 7: SPLIT & BY

# Split by section
split_section <- split(student_df$Percentage, student_df$Section)

print("Section-wise Mean:")
print(lapply(split_section, mean))

# By function
print("Gender-wise Average:")
print(by(student_df$Percentage, student_df$Gender, mean))

print("Section-wise Average:")
print(by(student_df$Percentage, student_df$Section, mean))


# FINAL OUTPUT

# Top 5 students
top5 <- student_df[order(-student_df$Percentage), ][1:5, ]

print("Top 5 Students:")
print(top5)

# Subject averages
print("Final Subject Averages:")
print(subject_avg)