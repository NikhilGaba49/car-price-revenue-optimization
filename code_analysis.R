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

# Running the multiple linear regression with all variables (but price) included as regressors
reg_price_all=lm(price~wheelbase+horsepower+car+suv+toyota+honda+interior_area, data=data)
summary(reg_price_all) # Summary stats for the regression (eg. coefficient estimates)
# Notice that honda and toyota add up to 1 and same goes for car vs suv.

reg_1 = lm(price~wheelbase, data = data) # First regression has wheelbase as the only regressor for price (dependent variable)
coeftest(reg_1, vcov = vcovHC(reg_1, "HC1")) # a coefficient test assuming heteroskedasticity
cov_1=vcovHC(reg_1, type = "HC1")    
se_1=sqrt(diag(cov_1))

reg_2 = lm(price~wheelbase+interior_area, data=data)
coeftest(reg_2, vcov = vcovHC(reg_2, "HC1"))
cov_2=vcovHC(reg_2, type = "HC1")    
se_2=sqrt(diag(cov_2))

reg_3 = lm(price~wheelbase+interior_area+horsepower, data=data)
coeftest(reg_3, vcov = vcovHC(reg_3, "HC1"))
cov_3=vcovHC(reg_3, type = "HC1")    
se_3=sqrt(diag(cov_3))

reg_4=lm(price~wheelbase + interior_area+horsepower+suv, data=data)
cov_4=vcovHC(reg_4, type = "HC1")    
se_4=sqrt(diag(cov_4))

reg_5=lm(price~wheelbase + interior_area+horsepower+suv+toyota, data=data)
cov_5=vcovHC(reg_5, type = "HC1")    
se_5=sqrt(diag(cov_5))

# Report all the summary stats for all regressions in the one table, with their standard errors
stargazer(reg_1, reg_2, reg_3, reg_4, reg_5, type="text", # the regressions to include in the output
          se=list(se_1, se_2, se_3, se_4, se_5), # with all their corresponding pre-defined standard errors
          digits=3, # all numbers should be reported to 3 decimal places
          dep.var.labels=c("Price of Vehicle"), # dependent variable name (i.e. Price of Vehicle)
          covariate.labels= c("Wheelbase", "Interior Area", "Horsepower", "Is SUV", "Is Toyota"), # Names/labels of the coefficients
          out="reg_output.txt")   # Output results to your directory in a text file