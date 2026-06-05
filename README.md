#  Walmart Sales Analysis using SQL

##  Project Overview

This project aims to examine Walmart’s sales data using SQL to derive meaningful business insights. The dataset contains weekly sales information for multiple stores along with external variables such as temperature, fuel price, CPI, and unemployment rate.

The goal is to convert raw data into valuable insights that support better understanding of sales behavior and overall business performance.

---

##  Objectives

* Clean and prepare the dataset for analysis
* Standardize date formats into SQL DATE format
* Explore sales trends across different stores and time periods
* Identify high-performing and underperforming stores
* Analyze how external factors influence sales performance

---

##  Dataset Information

The dataset consists of the following attributes:

* Store
* Date
* Weekly_Sales
* Holiday_Flag
* Temperature
* Fuel_Price
* CPI
* Unemployment

---

##  Data Cleaning

* The `Date` column was initially stored as text in `DD-MM-YYYY` format
* Converted it into a proper DATE format using SQL:

```sql
UPDATE walmart
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');

ALTER TABLE walmart
MODIFY Date DATE;
```

* Eliminated the extra header row inserted during data import
* Verified and handled missing values and duplicate records

---

##  SQL Analysis

### 1. Total Sales

```sql
SELECT SUM(Weekly_Sales) AS Total_Sales FROM walmart;
```

---

### 2. Sales by Store

```sql
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales DESC;
```

---

### 3. Holiday vs Non-Holiday Sales

```sql
SELECT Holiday_Flag, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Holiday_Flag;
```

---

### 4. Monthly Sales Trend

```sql
SELECT MONTH(Date) AS Month, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Month;
```

---

### 5. Top 5 Stores

```sql
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales DESC
LIMIT 5;
```

---

### 6. Low Performing Stores

```sql
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales ASC
LIMIT 5;
```

---

### 7. External Factors Impact

```sql
SELECT ROUND(Temperature), AVG(Weekly_Sales)
FROM walmart
GROUP BY ROUND(Temperature);

SELECT ROUND(Unemployment), AVG(Weekly_Sales)
FROM walmart
GROUP BY ROUND(Unemployment);
```

---

##  Key Insights

*  A small number of stores generate a large portion of total revenue
*  Sales behavior varies significantly between holiday and regular periods
*  Seasonal trends are visible when analyzing monthly performance
*  Environmental and economic factors have a measurable impact on sales
*  Certain stores consistently show lower performance and need strategic improvement

---

##  Tools & Technologies

* SQL (MySQL / MariaDB)
* phpMyAdmin
* Excel

---

##  Conclusion

This project highlights how SQL can be effectively used to process and analyze real-world datasets. It demonstrates the ability to clean data, perform structured analysis, and extract insights that can support business decision-making.

---

##  Author

**Charan Katragadda**


---

