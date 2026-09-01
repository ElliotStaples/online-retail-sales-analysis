/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query shows the 10 highest average order customers with at least 5 orders
*/
SELECT
  "Customer ID" AS "Customer ID",
  COUNT(DISTINCT Invoice) AS "Total Orders",
  ROUND(SUM(Quantity * Price), 2) AS "Total Sales",
  ROUND(
    SUM(Quantity * Price) * 1.0
      / COUNT(DISTINCT Invoice),
    2
  ) AS "Average Order Value"
FROM 
	online_retail_clean
WHERE 
	TransactionType = 'Sale'
  AND 
	"Customer ID" IS NOT NULL
GROUP BY 
	"Customer ID"
HAVING
	COUNT(DISTINCT Invoice) >= 5
ORDER BY 
	"Average Order Value" DESC
LIMIT 10;
