/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query shows the total sales, orders, and average order value
*/
SELECT
  ROUND(SUM(Quantity * Price), 2) AS "Total Sales",
  COUNT(DISTINCT Invoice) AS "Total Orders",
  ROUND(
    SUM(Quantity * Price) * 1.0
      / COUNT(DISTINCT Invoice),
    2
  ) AS "Average Order Value"
FROM 
	online_retail_clean
WHERE 
	TransactionType = 'Sale';