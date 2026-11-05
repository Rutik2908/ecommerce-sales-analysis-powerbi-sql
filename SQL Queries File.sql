-- ============================================================
-- Primeor Solutions: E-Commerce Data Analytics Internship
-- Level 2: SQL Analysis (Tasks 1, 2 and 3)
-- Author: Rutik Kumbhar
-- Database: ecommerse | Table: orders (51,256 cleaned rows)
-- ============================================================

-- ------------------------------------------------------------
-- TASK 1: Import data into SQL
-- ------------------------------------------------------------
-- The cleaned dataset (Cleaned_Dataset.csv) was loaded into this table.
USE ecommerse;

-- CREATE TABLE orders (
--   order_id VARCHAR(30), order_date DATE, ship_date DATE, ship_mode VARCHAR(30),
--   segment VARCHAR(30), state VARCHAR(80), country VARCHAR(80), market VARCHAR(30),
--   region VARCHAR(40), product_id VARCHAR(30), category VARCHAR(40),
--   sub_category VARCHAR(40), product_name VARCHAR(200), sales INT, quantity INT,
--   discount DOUBLE, profit DOUBLE, shipping_cost DOUBLE, order_priority VARCHAR(20),
--   year INT, customer_name VARCHAR(100)
-- );

-- Import check: expected 51256 rows, sales 12632373, profit 1467499
SELECT COUNT(*), SUM(sales), ROUND(SUM(profit),0) FROM orders;

-- ------------------------------------------------------------
-- TASK 2: SQL Queries
-- ------------------------------------------------------------

-- 1. Top 10 profitable products
SELECT product_name, ROUND(SUM(profit),2) AS total_profit
FROM orders GROUP BY product_name ORDER BY total_profit DESC LIMIT 10;

-- 2. Top 10 customers by sales
SELECT customer_name, SUM(sales) AS total_sales
FROM orders GROUP BY customer_name ORDER BY total_sales DESC LIMIT 10;

-- 3. Region-wise total sales
SELECT region, SUM(sales) AS total_sales
FROM orders GROUP BY region ORDER BY total_sales DESC;

-- 4. Category-wise average profit
SELECT category, ROUND(AVG(profit),2) AS avg_profit
FROM orders GROUP BY category;

-- 5. Highest discount category
SELECT category, ROUND(AVG(discount),4) AS avg_discount
FROM orders GROUP BY category ORDER BY avg_discount DESC LIMIT 1;

-- 6. Orders with negative profit
SELECT order_id, product_name, sales, profit
FROM orders WHERE profit < 0 ORDER BY profit;

-- 7. Monthly sales trend
SELECT YEAR(order_date) AS yr, MONTH(order_date) AS mn, SUM(sales) AS total_sales
FROM orders GROUP BY yr, mn ORDER BY yr, mn;

-- 8. Market-wise revenue analysis
SELECT market, SUM(sales) AS revenue
FROM orders GROUP BY market ORDER BY revenue DESC;

-- 9. Top-performing sub-categories
SELECT sub_category, SUM(sales) AS total_sales, ROUND(SUM(profit),2) AS total_profit
FROM orders GROUP BY sub_category ORDER BY total_sales DESC;

-- 10. Ship mode usage analysis
SELECT ship_mode, COUNT(*) AS orders_count
FROM orders GROUP BY ship_mode ORDER BY orders_count DESC;

-- ------------------------------------------------------------
-- TASK 3: Insights based on the SQL analysis
-- ------------------------------------------------------------

-- Q1. Which market generates the highest revenue?  (uses query 8)
--   Result: APAC 3,581,361 | EU 2,936,867 | US 2,295,756 | LATAM 2,163,876
--           EMEA 804,920 | Africa 783,261 | Canada 66,332
--   Insight: APAC generates the highest revenue at 3,581,361, about 28.4% of
--   total sales. EU (23.2%) and US (18.2%) follow. Canada is the smallest
--   market with only 66,332 (0.5%).

-- Q2. Which categories are least profitable?
SELECT category, ROUND(AVG(profit),2) AS avg_profit, ROUND(SUM(profit),2) AS total_profit
FROM orders GROUP BY category ORDER BY total_profit;

SELECT sub_category, SUM(sales) AS total_sales, ROUND(SUM(profit),2) AS total_profit
FROM orders GROUP BY sub_category ORDER BY total_profit;

--   Result (category): Furniture avg 29.00, total 286,124.88
--                      Office Supplies avg 16.58, total 518,173.69
--                      Technology avg 65.46, total 663,200.15
--   Result (sub-category, lowest first): Tables -64,113.45, Fasteners 11,522.02
--   Insight: "Least profitable" depends on the measure. Furniture has the lowest
--   total profit (about 286,125). Office Supplies has the lowest average profit
--   per order line (16.58). Tables is the only loss-making sub-category, with a
--   total loss of about 64,113. Technology is the most profitable category.

-- Q3. Which shipping mode is most commonly used?  (uses query 10)
--   Result: Standard Class 30,755 | Second Class 10,301 | First Class 7,503
--           | Same Day 2,697
--   Insight: Standard Class is used most, for 30,755 order lines, which is 60%
--   of all orders. Same Day is used least (5.3%).

-- Q4. Which category has the highest discount?  (uses query 5)
--   Result: Furniture 0.1680 (16.8%)
--   Insight: Furniture has the highest average discount at 16.8%, compared with
--   13.7% for Office Supplies and 13.5% for Technology. It also has the lowest
--   profit margin (7.0%), so heavy discounting may be one reason its profit is low.
