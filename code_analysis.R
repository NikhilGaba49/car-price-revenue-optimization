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

# Construct the scatter plots appropriately for each relationship titled and axes labelled, output in jpeg (image format)
jpeg("Relationship Between Wheelbase Length and Automobile Price.jpeg") 
plot(data$wheelbase, data$price, # scatterplot with wheelbase as the independent variable and price as the dependent variable
     main="Relationship Between Wheelbase Length and Automobile Price", # title for the scatterplot
     xlab="Wheelbase (Inches)", # label on the x-axis for the independent variable (Wheelbase)
     ylab="Price ($1000s)") # label on the y-axis for the dependent variable (Prices)
abline(reg_price_wheelbase,col="red",lwd=2) # Overlay the regression line above the scatterplot
dev.off()

jpeg("Price Comparison Between 'Is SUV' and 'Is Car'.jpeg")
plot(data$suv, data$price, # scatter plot representing the relationship between SUV as the independent variable and Price as the dependent variable
     main="Price Comparison Between 'Is SUV' and 'Is Car'",
     xlab="Is SUV (1 if SUV, 0 if Car (not SUV))", # SUV is the independent variable (x-axis)
     ylab="Price ($1000s)") # Prices is the dependent variable (y-axis) 
abline(reg_price_suv,col="red",lwd=2) # Overlay the corresponding regression line above the scatterplot
dev.off()

jpeg("Wheelbase Comparison Between 'Is SUV' and 'Is Car'.jpeg")
plot(data$suv, data$wheelbase, # scatter plot representing the relationship between SUV as the independent variable and Wheelbase as the dependent variable
     main="Wheelbase Comparison Between 'Is SUV' and 'Is Car'",
     xlab="Is SUV (1 if SUV, 0 if Car (not SUV))", # SUV is the independent variable (x-axis)
     ylab="Wheelbase (Inches)") # Wheelbase is the dependent variable (y-axis)
abline(reg_wheelbase_suv,col="red",lwd=2) # Overlay the corresponding regression line above the scatterplot
dev.off()