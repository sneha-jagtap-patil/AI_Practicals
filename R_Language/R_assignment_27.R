# Load dataset
data("airquality")

# Preview data
head(airquality, 10)
tail(airquality, 5)

# Structure & summary
str(airquality)
summary(airquality)
colnames(airquality)

# Check missing values
colSums(is.na(airquality))

# Remove missing values
clean_data <- na.omit(airquality)

# Check dimensions
dim(clean_data)
# Mean values
mean_ozone <- mean(clean_data$Ozone)
mean_temp <- mean(clean_data$Temp)

# Median values
median_ozone <- median(clean_data$Ozone)
median_temp <- median(clean_data$Temp)

# Standard deviation
sd_ozone <- sd(clean_data$Ozone)
sd_temp <- sd(clean_data$Temp)

# Print values
cat("Mean Ozone:", mean_ozone, "\n")
cat("Mean Temp:", mean_temp, "\n")
cat("Median Ozone:", median_ozone, "\n")
cat("Median Temp:", median_temp, "\n")
cat("SD Ozone:", sd_ozone, "\n")
cat("SD Temp:", sd_temp, "\n")

# Install only if not installed
install.packages("ggplot2")

# Load package .
library(ggplot2)
# Variable
avg_temp <- mean(clean_data$Temp)

# Constant
SAFE_LIMIT <- 70

# Print
cat("Average Temperature:", avg_temp, "\n")
cat("Safe Ozone Limit:", SAFE_LIMIT, "\n")

# Unsafe days
unsafe_days <- clean_data$Ozone > SAFE_LIMIT

# Counts
unsafe_count <- sum(unsafe_days)
safe_count <- nrow(clean_data) - unsafe_count

# Print
cat("Unsafe Days:", unsafe_count, "\n")
cat("Safe Days:", safe_count, "\n")

# Percentage
unsafe_percent <- (unsafe_count / nrow(clean_data)) * 100
cat("Unsafe Percentage:", unsafe_percent, "%\n")

monthly_avg <- aggregate(Ozone ~ Month, data = clean_data, mean)

print(monthly_avg)
correlation <- cor(clean_data$Temp, clean_data$Ozone)

cat("Correlation between Temp and Ozone:", correlation, "\n")

ggplot(clean_data, aes(x = Temp, y = Ozone)) +
  geom_point(color = "blue") +
  labs(
    title = "Temperature vs Ozone",
    x = "Temperature",
    y = "Ozone"
  )
ggplot(clean_data, aes(x = Temp, y = Ozone)) +
  geom_point(color = "darkgreen") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Trend Analysis")

ggplot(clean_data, aes(x = Ozone)) +
  geom_histogram(bins = 20, fill = "orange") +
  labs(title = "Ozone Distribution")

ggplot(clean_data, aes(x = factor(Month), y = Ozone)) +
  geom_boxplot(fill = "purple") +
  labs(title = "Monthly Ozone Variation", x = "Month")

max_ozone <- max(clean_data$Ozone)
min_ozone <- min(clean_data$Ozone)

cat("Max Ozone:", max_ozone, "\n")
cat("Min Ozone:", min_ozone, "\n")
