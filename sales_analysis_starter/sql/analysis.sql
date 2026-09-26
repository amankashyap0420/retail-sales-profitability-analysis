-- SQLite. Grain: one row per order line. Distinct orders are not additive.
-- query: kpis
SELECT SUM(Sales) AS Sales, SUM(Profit) AS Profit,
 COUNT(DISTINCT "Order ID") AS Orders,
 COUNT(DISTINCT "Customer ID") AS Customers,
 100.0*SUM(Profit)/NULLIF(SUM(Sales),0) AS Margin_pct,
 SUM(Sales)/NULLIF(COUNT(DISTINCT "Order ID"),0) AS AOV
FROM sales;
-- query: category
SELECT Category, SUM(Sales) AS Sales, SUM(Profit) AS Profit,
 100.0*SUM(Profit)/NULLIF(SUM(Sales),0) AS Margin_pct
FROM sales GROUP BY Category ORDER BY Sales DESC;
-- query: loss_states
SELECT State, SUM(Sales) AS Sales, SUM(Profit) AS Profit
FROM sales GROUP BY State HAVING SUM(Profit)<0 ORDER BY Profit;
-- query: monthly_yoy
WITH monthly AS (
 SELECT substr("Order Date",1,7) AS Month, SUM(Sales) AS Sales
 FROM sales GROUP BY 1
), lagged AS (
 SELECT *, LAG(Sales,12) OVER(ORDER BY Month) AS Prior_Year_Sales FROM monthly
)
SELECT *, 100.0*(Sales/Prior_Year_Sales-1) AS YoY_pct FROM lagged;
-- query: category_product_rank
WITH products AS (
 SELECT Category,"Product ID","Product Name",SUM(Sales) AS Sales,SUM(Profit) AS Profit
 FROM sales GROUP BY 1,2,3
), ranked AS (
 SELECT *,DENSE_RANK() OVER(PARTITION BY Category ORDER BY Sales DESC) AS Revenue_Rank
 FROM products
)
SELECT * FROM ranked WHERE Revenue_Rank<=5 ORDER BY Category,Revenue_Rank;
-- query: repeat_customers
WITH counts AS (
 SELECT "Customer ID",COUNT(DISTINCT "Order ID") AS Orders FROM sales GROUP BY 1
)
SELECT 100.0*AVG(CASE WHEN Orders>1 THEN 1.0 ELSE 0.0 END) AS Repeat_pct FROM counts;
