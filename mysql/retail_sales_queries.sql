create database retail_sales_db;
USE retail_sales_db;

-- Total Revenue
SELECT SUM(`Total Spent`) AS Total_Revenue
FROM retail_store_sales;

-- Total Orders
SELECT COUNT(`Transaction ID`) AS Total_Orders
FROM retail_store_sales;

-- Total Customers
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM retail_store_sales;

-- Average Order Value
SELECT AVG(`Total Spent`) AS Average_Order_Value
FROM retail_store_sales;

-- Revenue by Category
SELECT
Category,
SUM(`Total Spent`) AS Revenue
FROM retail_store_sales
GROUP BY Category
ORDER BY Revenue DESC;

-- Top 10 Products by Revenue
SELECT
Item,
SUM(`Total Spent`) AS Revenue
FROM retail_store_sales
GROUP BY Item
ORDER BY Revenue DESC
LIMIT 10;

-- Units Sold by Category
SELECT
Category,
SUM(Quantity) AS Units_Sold
FROM retail_store_sales
GROUP BY Category
ORDER BY Units_Sold DESC;

-- Revenue by Payment Method
SELECT
`Payment Method`,
SUM(`Total Spent`) AS Revenue
FROM retail_store_sales
GROUP BY `Payment Method`;

-- Revenue by Location
SELECT
Location,
SUM(`Total Spent`) AS Revenue
FROM retail_store_sales
GROUP BY Location;

-- Revenue by Discount
SELECT
`Discount Applied`,
SUM(`Total Spent`) AS Revenue
FROM retail_store_sales
GROUP BY `Discount Applied`;

-- Yearly Revenue
SELECT
Year,
SUM(`Total Spent`) AS Revenue
FROM retail_store_sales
GROUP BY Year
ORDER BY Year;

-- Quarterly Revenue
SELECT
Quarter,
SUM(`Total Spent`) AS Revenue
FROM retail_store_sales
GROUP BY Quarter
ORDER BY Quarter;

-- Monthly Revenue
SELECT
Month,
SUM(`Total Spent`) AS Revenue
FROM retail_store_sales
GROUP BY Month;

-- Daily Revenue
SELECT
Day,
SUM(`Total Spent`) AS Revenue
FROM retail_store_sales
GROUP BY Day;

-- Top 10 Customers
SELECT
`Customer ID`,
SUM(`Total Spent`) AS Customer_Value
FROM retail_store_sales
GROUP BY `Customer ID`
ORDER BY Customer_Value DESC
LIMIT 10;

-- Top 10 Selling Products
SELECT
Item,
SUM(Quantity) AS Units_Sold
FROM retail_store_sales
GROUP BY Item
ORDER BY Units_Sold DESC
LIMIT 10;

-- Average Price by Category
SELECT
Category,
AVG(`Price Per Unit`) AS Avg_Price
FROM retail_store_sales
GROUP BY Category;

-- Top 10 Highest Transactions
SELECT *
FROM retail_store_sales
ORDER BY `Total Spent` DESC
LIMIT 10;

-- Orders by Location
SELECT
Location,
COUNT(*) AS Orders
FROM retail_store_sales
GROUP BY Location;

-- Orders by Payment Method
SELECT
`Payment Method`,
COUNT(*) AS Orders
FROM retail_store_sales
GROUP BY `Payment Method`;

-- Revenue Contribution by Category
SELECT
Category,
ROUND(
SUM(`Total Spent`) * 100 /
(SELECT SUM(`Total Spent`) FROM retail_store_sales),
2
) AS Revenue_Percentage
FROM retail_store_sales
GROUP BY Category
ORDER BY Revenue_Percentage DESC;