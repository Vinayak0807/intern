CREATE TABLE sales (
    user_id INT,
    cust_name VARCHAR(255),
    product_id VARCHAR(50),
    gender VARCHAR(10),
    age_group VARCHAR(20),
    age INT,
    marital_status INT,
    state VARCHAR(100),
    zone VARCHAR(50),
    occupation VARCHAR(100),
    product_category VARCHAR(100),
    orders INT,
    amount NUMERIC(12, 2),
    status VARCHAR(50),    -- This column appears empty in the file
    unnamed1 VARCHAR(50)   -- This column appears empty in the file
);
COPY sales 
FROM 'F:/diwali_sales_analysis/Python_Diwali_Sales_Analysis-main/sales.csv' 
WITH (FORMAT csv, HEADER true, ENCODING 'latin1');
-- Data cleaning

-- Remove unused columns
ALTER TABLE sales
DROP COLUMN IF EXISTS status,
DROP COLUMN IF EXISTS unnamed1;

-- Remove rows with missing amount
DELETE FROM sales
WHERE amount IS NULL;

-- Basic KPI analysis

-- Total revenue
SELECT SUM(amount) AS total_revenue
FROM sales;

-- Total orders
SELECT SUM(orders) AS total_orders
FROM sales;

-- Average order value
SELECT AVG(amount) AS avg_order_value
FROM sales;

-- Demographic analysis

-- Revenue by gender
SELECT gender,
       SUM(amount) AS revenue,
       COUNT(*) AS transactions
FROM sales
GROUP BY gender
ORDER BY revenue DESC;

-- Revenue by age group
SELECT age_group,
       SUM(amount) AS revenue
FROM sales
GROUP BY age_group
ORDER BY revenue DESC;

-- Married vs unmarried spending
SELECT marital_status,
       SUM(amount) AS total_spend,
       AVG(amount) AS avg_spend
FROM sales
GROUP BY marital_status;

-- Geographic analysis

-- Top states by revenue
SELECT state,
       SUM(amount) AS revenue
FROM sales
GROUP BY state
ORDER BY revenue DESC
LIMIT 10;

-- Zone contribution percentage
SELECT zone,
       SUM(amount) AS revenue,
       ROUND(
         SUM(amount) * 100.0 /
         SUM(SUM(amount)) OVER (),
         2
       ) AS revenue_percentage
FROM sales
GROUP BY zone;

-- Product analysis

-- Best product categories
SELECT product_category,
       SUM(amount) AS revenue,
       SUM(orders) AS total_orders
FROM sales
GROUP BY product_category
ORDER BY revenue DESC;

-- Occupation purchasing power
SELECT occupation,
       SUM(amount) AS revenue,
       AVG(amount) AS avg_purchase
FROM sales
GROUP BY occupation
ORDER BY revenue DESC;

-- Advanced analytics

-- Top 5 customers by lifetime value
SELECT user_id,
       cust_name,
       SUM(amount) AS lifetime_value,
       RANK() OVER (ORDER BY SUM(amount) DESC) AS rank
FROM sales
GROUP BY user_id, cust_name
LIMIT 5;

-- Running revenue by zone
SELECT zone,
       SUM(amount) AS zone_revenue,
       SUM(SUM(amount)) OVER (ORDER BY zone) AS running_total
FROM sales
GROUP BY zone;

-- Customer contribution to total sales
SELECT user_id,
       SUM(amount) AS customer_spend,
       ROUND(
         SUM(amount) * 100.0 /
         SUM(SUM(amount)) OVER (),
         2
       ) AS contribution_percent
FROM sales
GROUP BY user_id
ORDER BY customer_spend DESC;

-- End of project
