# Load necessary libraries
library(stargazer)
library(AER)

# read in the required dataset
data = read.csv("car_data.csv")

#understand the nature of the data (columns, a few data rows, etc.)
View(data)
names(data)

#compute descriptive statistics for all the variables in the dataset
stargazer(data, # dataset to refer to
          summary.stat = c("n", "mean", "sd", "median", "min", "max"),  # which summary stats are required
          type="text", title="Descriptive Statistics", out="sumstats1.txt") # output as a text file with title "Descriptive Statistics"

#Running separate single linear regressions between the three relationships
# Regression for Price as the dependent variable and Wheelbase as the independent variable       
reg_price_wheelbase=lm(price~wheelbase, data=data)
summary(reg_price_wheelbase) # summary statistics for the regression (i.e. coefficient estimates)

# Regression for Price as the dependent variable and SUV as the independent variable
reg_price_suv=lm(price~suv, data=data)
summary(reg_price_suv) # summary statistics for this regression

# Regression for Wheelbase as the dependent variable and SUV as the independent variable
reg_wheelbase_suv=lm(wheelbase~suv, data=data)
summary(reg_wheelbase_suv) # summary statistics for this regression