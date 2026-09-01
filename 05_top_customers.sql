/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query shows the 10 highest-valued customers 
*/
SELECT
  "Customer ID" AS "Customer ID",
  ROUND(SUM(Quantity * Price), 2) AS "Total Sales",
  COUNT(DISTINCT Invoice) AS "Total Orders"
FROM 
	online_retail_clean
WHERE 
	TransactionType = 'Sale'
  AND 
  "Customer ID" IS NOT NULL
GROUP BY 
	"Customer ID"
ORDER BY 
	"Total Sales" DESC
LIMIT 10;