# Car Price Modelling and Revenue Optimization

## Project Overview
This project applies **econometric modelling** and **profit optimisation** to guide dealership purchasing decisions.  
Using a dataset of 750 automobiles, we estimate how vehicle characteristics such as wheelbase, interior space, horsepower, and brand influence prices, and then use these insights to determine the **profit-maximising mix of vehicles under a $200,000 budget**.

---

## Key Skills Demonstrated
- **Econometrics & Statistics:** Multiple linear regression, heteroskedasticity-robust inference, hypothesis testing, omitted variable bias analysis.
- **Data Analysis & Visualisation:** Summary statistics, scatter plots with regression lines, interpretation of bias and multicollinearity.
- **Optimisation & Algorithmic Thinking:** Brute-force search for profit maximisation (Python).
- **Programming:**  
  - **R:** `stargazer`, `AER`, `sandwich`, `lmtest`  
  - **Python:** Pure Python implementation (no external libraries)

---

## Dataset
`car_data.csv` (750 observations) contains:  
- **price**: automobile sale price ($1,000s)  
- **wheelbase**: distance between front and rear wheels (inches)  
- **interior_area**: interior space (cubic feet)  
- **horsepower**: engine horsepower  
- **car**: dummy variable (1 = car, 0 = otherwise)  
- **suv**: dummy variable (1 = SUV, 0 = otherwise)  
- **toyota**: dummy variable (1 = Toyota, 0 = otherwise)  
- **honda**: dummy variable (1 = Honda, 0 = otherwise)  

---

## Objectives & Methods

### 1. Descriptive Analysis
- Computed summary statistics for all variables (`stargazer` output).  
- Visualised relationships with scatter plots & fitted regression lines.

### 2. Econometric Modelling
- Estimated 5 regression models with heteroskedasticity-robust standard errors.  
- Interpreted coefficient signs, constant terms, adjusted R², and bias terms.  
- Checked multicollinearity & omitted variable bias.

### 3. Hypothesis Testing
- Performed F-tests to test overall and joint significance of predictors.  
- Compared individual vs joint significance outcomes.

### 4. Decision-Making Application
- Predicted prices for new vehicles using the final regression:  
  \[
  \text{price} = \beta_0 + \beta_1(\text{wheelbase}) + \beta_2(\text{interior area}) + \beta_3(\text{horsepower}) + \beta_4(\text{suv}) + \beta_5(\text{toyota}) + \varepsilon
  \]
- Formulated a profit-maximising purchasing strategy under budget constraints (Python brute-force search).

---

## Results

### Econometric Findings
- **Significant predictors:** interior area, horsepower, and SUV status (positive), Toyota (negative).  
- **Bias analysis:** confirmed expected positive/negative bias using correlations.  
- **Model fit:** Final regression achieved **adjusted R² = 0.354**.

### Profit-Maximising Strategy
| Vehicle ID | Predicted Price ($) | Cost ($) | Expected Profit ($) |
|------------|---------------------|----------|----------------------|
| ID1        | 36,683.79           | 23,000   | 13,683.79           |
| ID2        | 52,486.73           | 40,000   | 12,486.73           |
| ID3        | 41,156.87           | 27,000   | 14,156.87           |
| ID4        | 46,165.95           | 30,000   | 16,165.95           |

- **Optimal mix:** 4 × ID4, 2 × ID3, 1 × ID1  
- **Total Cost:** $197,000  
- **Maximum Expected Profit:** **$106,661.33**  
- Python simulation confirmed this theoretical solution.

---

## How to Run

### **R Analysis**
1. Install R (v4.0+) and libraries:  
   ```r
   install.packages(c("stargazer", "AER", "sandwich", "lmtest"))
