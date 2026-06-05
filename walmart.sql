-- ============================================
-- Walmart Sales Analysis Project
-- ============================================

-- 1. CREATE DATABASE
CREATE DATABASE walmart_project;
USE walmart_project;

-- 2. CREATE TABLE
CREATE TABLE walmart_sales (
    Store INT,
    Date VARCHAR(20),
    Weekly_Sales FLOAT,
    Holiday_Flag INT,
    Temperature FLOAT,
    Fuel_Price FLOAT,
    CPI FLOAT,
    Unemployment FLOAT
);

-- 3. DATA CLEANING

-- Remove header row
DELETE FROM walmart_sales
WHERE Date = 'Date';

-- Convert Date format
UPDATE walmart_sales
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');

-- Change to DATE type
ALTER TABLE walmart_sales MODIFY Date DATE;

-- Check NULL values
SELECT *
FROM walmart_sales
WHERE Store IS NULL
   OR Date IS NULL
   OR Weekly_Sales IS NULL;

-- Check duplicates
SELECT Store, Date, COUNT(*)
FROM walmart_sales
GROUP BY Store, Date
HAVING COUNT(*) > 1;

-- 4. BASIC EXPLORATION

SELECT COUNT(*) AS total_rows FROM walmart_sales;

SELECT COUNT(DISTINCT Store) AS total_stores FROM walmart_sales;

SELECT MIN(Date), MAX(Date) FROM walmart_sales;

-- 5. SALES ANALYSIS

SELECT SUM(Weekly_Sales) AS total_sales FROM walmart_sales;

SELECT 
    Store,
    SUM(Weekly_Sales) AS total_sales,
    AVG(Weekly_Sales) AS avg_sales
FROM walmart_sales
GROUP BY Store
ORDER BY total_sales DESC;

-- 6. TIME ANALYSIS

SELECT 
    YEAR(Date) AS year,
    SUM(Weekly_Sales)
FROM walmart_sales
GROUP BY year;

SELECT 
    MONTH(Date) AS month,
    SUM(Weekly_Sales)
FROM walmart_sales
GROUP BY month;

-- 7. HOLIDAY ANALYSIS

SELECT 
    Holiday_Flag,
    AVG(Weekly_Sales),
    SUM(Weekly_Sales)
FROM walmart_sales
GROUP BY Holiday_Flag;

-- 8. EXTERNAL FACTORS

SELECT 
    CASE 
        WHEN Temperature < 50 THEN 'Cold'
        WHEN Temperature BETWEEN 50 AND 70 THEN 'Moderate'
        ELSE 'Hot'
    END AS temp_category,
    AVG(Weekly_Sales)
FROM walmart_sales
GROUP BY temp_category;

SELECT 
    ROUND(Fuel_Price,1),
    AVG(Weekly_Sales)
FROM walmart_sales
GROUP BY ROUND(Fuel_Price,1);

SELECT 
    ROUND(Unemployment,1),
    AVG(Weekly_Sales)
FROM walmart_sales
GROUP BY ROUND(Unemployment,1);

-- 9. ADVANCED ANALYSIS

SELECT 
    Store,
    SUM(Weekly_Sales),
    RANK() OVER (ORDER BY SUM(Weekly_Sales) DESC)
FROM walmart_sales
GROUP BY Store;

SELECT 
    Date,
    Weekly_Sales,
    AVG(Weekly_Sales) OVER (
        ORDER BY Date 
        ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    )
FROM walmart_sales;