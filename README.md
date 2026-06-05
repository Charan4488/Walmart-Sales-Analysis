#  Walmart Sales Analysis using SQL

##  Project Overview

This project focuses on analyzing Walmart sales data using SQL to extract meaningful business insights. It includes data cleaning, transformation, and analysis to understand sales performance, seasonal trends, and the impact of external factors.

##  Objectives

* Analyze overall sales performance
* Identify top-performing and low-performing stores
* Compare holiday vs non-holiday sales trends
* Study monthly and yearly sales patterns
* Evaluate the impact of external factors like temperature, fuel price, and unemployment

## Tech Stack

* **Database:** MySQL / MariaDB
* **Tool:** phpMyAdmin
* **Language:** SQL


##  Dataset Description

The dataset contains the following columns:

* Store – Store number
* Date – Weekly sales date
* Weekly_Sales – Sales for the week
* Holiday_Flag – Indicates holiday week (1 = Holiday, 0 = Non-Holiday)
* Temperature – Temperature during the week
* Fuel_Price – Fuel price in the region
* CPI – Consumer Price Index
* Unemployment – Unemployment rate



##  Data Cleaning Steps

* Imported CSV file using phpMyAdmin
* Converted `Date` column from VARCHAR to DATE using `STR_TO_DATE()`
* Removed header row mistakenly inserted as data
* Checked for NULL values and duplicates
* Ensured clean and structured dataset



##  Analysis Performed

###  Sales Analysis

* Total sales calculation
* Store-wise performance analysis
* Identification of high and low-performing stores

###  Time-Based Analysis

* Monthly sales trends
* Yearly sales trends
* Seasonal patterns

###  Holiday Analysis

* Comparison of holiday vs non-holiday sales
* Store performance during holidays

###  External Factors Analysis

* Impact of temperature on sales
* Fuel price vs sales relationship
* Unemployment rate vs sales

###  Advanced Analysis

* Ranking stores using window functions
* Moving average for trend analysis



##  Key Insights

*  Top-performing stores contribute significantly to total revenue
*  Some stores show inconsistent sales patterns
*  Holiday sales are generally higher than non-holiday periods
*  Moderate temperatures are associated with better sales
*  Rising fuel prices slightly affect customer purchasing behavior
*  Higher unemployment rates can reduce sales


##  Author
K.Charan
