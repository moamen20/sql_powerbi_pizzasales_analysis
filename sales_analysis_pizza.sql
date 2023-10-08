select * from pizza_sales

/* total revenue */
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

/* Average Order Value */
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

/*  Total Pizzas Sold */
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

/* Total Orders */
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

/* Average Pizzas Per Order */

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales

/*total revenue & PCT  of Sales by Pizza Category */
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

/*total revenue & PCT  of Sales by Pizza size */
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY total_revenue DESC

/* Total Pizzas Sold by Pizza Category */
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


/* Top 5 Pizzas by Revenue */
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue 

/* Top 5 ordered pizza  */
SELECT TOP 5 pizza_name, count(order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders 


/*  Busiest Hours of the Day with Time:*/ 
SELECT
    DATEPART(HOUR, order_time) AS order_hour,
    COUNT(*) AS order_count
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY order_count DESC;

/* Average Order Value (AOV) by hrs */

SELECT
    DATEPART(HOUR, order_time) AS order_hour,
    AVG(total_sales) AS avg_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY order_hour;





