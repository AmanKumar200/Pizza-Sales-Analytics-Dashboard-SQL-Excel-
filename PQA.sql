use pizza_sales;

-- PIZZA SALES SQL QUERIES

-- A. KPI’s

-- 1.  Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM psad;

-- 2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM psad;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM psad;

-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM psad;

-- 5. Average Pizzas Per Order
SELECT 
    SUM(quantity) * 1.0 / COUNT(DISTINCT order_id) AS avg_pizzas_per_order
FROM psad;

-- B. Daily Trend for Total Orders
SELECT 
    DAYNAME(order_date) AS day_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM psad
GROUP BY day_name;

-- C. Hourly Trend for Orders
SELECT 
    HOUR(order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS Total_order
FROM psad
WHERE order_time IS NOT NULL
GROUP BY order_hour
ORDER BY order_hour;

-- D. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from psad) AS DECIMAL(10,2)) AS PCT
FROM psad
GROUP BY pizza_category;

-- E. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from psad) AS DECIMAL(10,2)) AS PCT
FROM psad
GROUP BY pizza_size
ORDER BY pizza_size;

-- F. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM psad
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- G. Top 5 Best Sellers by Total Pizzas Sold
SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM psad
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;

-- H. Bottom 5 Best Sellers by Total Pizzas Sold
SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM psad
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
limit 5;


