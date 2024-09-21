-- Finding the month salary with the high sales and the one with the least sales.

SELECT  DATE_FORMAT(Date, '%Y-%M') AS month, SUM(Sales) AS Total_Sales
FROM sales_data_project_1.customer_order_complete_data
GROUP BY month
ORDER By Total_Sales desc;
-- We can see that the month with the large sales was in June 2021, the least sales was in October 2021

-- Since it was the month with the highest sales, it will be interesting first to check the product with the most orders in that month 
-- as well as, the product that gave the most sales

-- The products with the most purchases (Top 3 best sellers) in that month (Ebooks, blueprints, training videos)
SELECT   CategoryName , SUM(Quantity) AS Total_purchase
FROM sales_data_project_1.customer_order_complete_data
WHERE Date Like '2021-06%' 
GROUP BY CategoryName
ORDER BY Total_purchase desc;

-- The product with the highest sales in that month (Robots)
SELECT CategoryName, SUM(Sales) AS Total_sales
FROM sales_data_project_1.customer_order_complete_data
WHERE Date Like '2021-06%' 
GROUP BY CategoryName
ORDER BY Total_sales desc;

-- Overall monthly sales
SELECT date_format(date, '%Y-%m') AS Month, SUM(Sales) AS Total_Sales
FROM sales_data_project_1.customer_order_complete_data
GROUP BY Month
ORDER BY Month;

-- Overall  product specific monthly sales
SELECT date_format(date, '%Y-%m') AS Month, SUM(Sales) AS Total_Robots_Sales, (SELECT SUM(Sales) 
FROM sales_data_project_1.customer_order_complete_data
WHERE CategoryName= 'ebooks') AS Total_Ebook_Sales, (SELECT SUM(Sales) 
FROM sales_data_project_1.customer_order_complete_data
WHERE CategoryName= 'Blueprints') AS Total_Blueprints_Sales, (SELECT SUM(Sales) 
FROM sales_data_project_1.customer_order_complete_data
WHERE CategoryName= 'Training Videos') AS Total_TrainingVideos_Sales, (SELECT SUM(Sales) 
FROM sales_data_project_1.customer_order_complete_data
WHERE CategoryName= 'Drones') AS Total_Drones_Sales, (SELECT SUM(Sales) 
FROM sales_data_project_1.customer_order_complete_data
WHERE CategoryName= 'Drone Kits') AS Total_DroneKits_Sales, (SELECT SUM(Sales) 
FROM sales_data_project_1.customer_order_complete_data
WHERE CategoryName= 'Robot Kits') AS Total_RobotsKits_Sales
FROM sales_data_project_1.customer_order_complete_data
WHERE CategoryName= 'Robots'
GROUP BY Month
ORDER BY Month asc;
 
-- Sales by Region
SELECT CustomerState, SUM(Sales) AS Total_Sales_per_state
FROM sales_data_project_1.customer_order_complete_data
GROUP BY CustomerState
ORDER BY Total_Sales_per_state desc;

-- Total number of sales and quantity 
SELECT sum(Sales) AS Total_sales 
FROM sales_data_project_1.customer_order_complete_data;

SELECT sum(Quantity) AS Total_quantity
FROM sales_data_project_1.customer_order_complete_data;

-- Total sales per month
SELECT DATE_FORMAT(Date, '%M') AS month, SUM(Sales) total_sales
FROM sales_data_project_1.customer_order_complete_data
Group by month;

-- Average sales per month
SELECT avg( total_sales) AS Monthly_sales_Average
FROM ( SELECT DATE_FORMAT(Date, '%M') AS Month , SUM(Sales) AS total_sales
       FROM sales_data_project_1.customer_order_complete_data
       Group by Month ) AS Months_table;

SELECT OrderID, CASE WHEN 
                  OrderID IS NOT NULL 
                  Then 1
                  ELSE 0
                  END AS count_OrderID
FROM sales_data_project_1.customer_order_complete_data;

-- Number of orders
SELECT  COUNT(count_OrderID)
  FROM (SELECT OrderID, CASE WHEN 
                  OrderID IS NOT NULL 
                  Then 1
                  ELSE 0
                  END AS count_OrderID
FROM sales_data_project_1.customer_order_complete_data) AS Order_Table