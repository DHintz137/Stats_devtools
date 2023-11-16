# where is R being executed from 
file.path(R.home(), "bin", "R")

# Libraires is just a directory
.libPaths() # path to libraries 
list.files(.libPaths()) # actaul R libraries 

installed.packages()[, c("Package", "Version")]

# Is dplyr in our new enviroment?
find.package("dplyr")
find.package("base")

list.files(.libPaths())


# 

library(ggplot2) 

# Load the mtcars dataset
data(mtcars)

# View the first few rows of the dataset
head(mtcars)

# Scatter plot of mpg vs wt
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +  # Add a linear regression line
  labs(title = "Relationship between Car Weight and MPG",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon") +
  theme_minimal()

Average Miles per Gallon by Number of Cylinders
# Calculate average mpg for different numbers of cylinders
avg_mpg_by_cyl <- aggregate(mpg ~ cyl, data = mtcars, mean)

# Bar plot of average mpg by number of cylinders
ggplot(avg_mpg_by_cyl, aes(x = factor(cyl), y = mpg, fill = factor(cyl))) +
  geom_bar(stat = "identity") +
  labs(title = "Average MPG by Number of Cylinders",
       x = "Number of Cylinders",
       y = "Average Miles per Gallon") +
  theme_minimal() +
  scale_fill_brewer(palette = "Pastel1")  # Color palette
