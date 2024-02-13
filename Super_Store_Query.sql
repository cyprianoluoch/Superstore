--Overal view of Super Store Dataset--
SELECT
COUNT(order_id) AS Total_orders,
COUNT(DISTINCT country) AS Total_Countries,
COUNT(DISTINCT product_name) AS Total_Products,
COUNT(DISTINCT category) AS Total_Categories,
COUNT(DISTINCT sub_category) AS Total_Subcategories,
COUNT(DISTINCT year) AS Total_Years,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold,
AVG(profit) AS Avg_Profit,
AVG(discount) AS Total_Discount
FROM dbo.[SuperStoreOrders Dataset]

--Sales Performance Analysis--
SELECT TOP 10
product_name,
category,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY 
product_name,
category
ORDER BY SUM(sales) DESC

--Sales over year--
SELECT
year,
SUM(sales)AS Total_sales
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY year
ORDER BY SUM(sales) DESC

--customer segmentation--
SELECT
segment,
COUNT(DISTINCT customer_name) AS Total_customers,
SUM(sales) AS Total_sales
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY segment
ORDER BY SUM(sales) DESC

--shipping and order management--
SELECT
ship_mode,
AVG(shipping_cost) AS Avg_Shipping_cost,
AVG(profit) AS Avg_Profit
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY ship_mode
ORDER BY AVG(profit) DESC

--time analysis--
SELECT
ship_mode,
AVG(DATEDIFF(WEEKDAY, TRY_CAST(order_date AS DATE), TRY_CAST(ship_date AS DATE))) AS Avg_time_gap
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY ship_mode

--profitability and cost analysis--
SELECT TOP 10
product_name,
category,
sub_category,
AVG(profit) AS Avg_Profit,
AVG(discount) AS Avg_Discount
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY
product_name,
category,
sub_category
ORDER BY AVG(profit) DESC

--Global sales and quantity product overview--
SELECT TOP 10
country,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY country
ORDER BY SUM(sales)DESC

--state level category exploration--
SELECT TOP 20
state,
product_name,
category,
SUM(quantity) AS Total_quantity
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY 
product_name,
category,
state
ORDER BY SUM(quantity) DESC

--Regional subcategory analysis--
SELECT TOP 20
region,
sub_category,
SUM(quantity) AS Total_quantity
FROM dbo.[SuperStoreOrders Dataset]
GROUP BY 
region,
sub_category
ORDER BY SUM(quantity) DESC