# Car Price Modelling and Revenue Optimization

This project applies econometric techniques to model automobile prices, perform hypothesis testing, and optimize dealership purchasing decisions. Using a dataset of 750 recently sold automobiles, the analysis identifies how vehicle characteristics such as size, horsepower, and brand influence price, and leverages these insights to maximize expected revenue for a car distributor.

## Dataset

The dataset `car_data.csv` contains the following variables:

- **price**: automobile sale price in $1,000s  
- **wheelbase**: distance between front and rear wheels (inches)  
- **interior_area**: interior space of the car (cubic feet)  
- **horsepower**: engine horsepower  
- **car**: dummy variable (1 = car, 0 = otherwise)  
- **suv**: dummy variable (1 = SUV, 0 = otherwise)  
- **toyota**: dummy variable (1 = Toyota, 0 = otherwise)  
- **honda**: dummy variable (1 = Honda, 0 = otherwise)

The dataset covers 750 vehicles from various manufacturers and types.

## Objectives

1. **Descriptive Analysis**  
   - Compute summary statistics for all variables.  
   - Visualize key relationships using scatter plots and regression lines.

2. **Econometric Modelling**  
   - Estimate multiple linear regression models with heteroskedasticity-robust standard errors.  
   - Interpret coefficients, constant terms, and adjusted R-squared values.  
   - Diagnose and address potential multicollinearity and omitted variable bias.

3. **Hypothesis Testing**  
   - Perform F-tests to evaluate overall model significance.  
   - Test joint significance of selected predictors.  
   - Compare individual and joint significance outcomes.

4. **Decision-Making Application**  
   - Use regression results to predict prices of new vehicles.  
   - Formulate a profit-maximizing purchasing strategy under budget constraints.

## Methods

The analysis was conducted in **R**, using the following key packages:

- `stargazer` for summary statistics and regression tables  
- `sandwich` and `lmtest` for heteroskedasticity-robust inference  
- `ggplot2` for data visualization  

The final regression specification used for prediction is:
price = β0 + β1(wheelbase) + β2(interior_area) + β3(horsepower) + β4(suv) + β5(toyota) + ε
