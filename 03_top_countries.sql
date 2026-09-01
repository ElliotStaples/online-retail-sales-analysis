/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query shows the top 10 countires with the most completed sales
*/
SELECT
  Country AS "Country",
  ROUND(SUM(Quantity * Price), 2) AS "Total Sales",
  COUNT(DISTINCT Invoice) AS "Total Orders"
FROM 
	online_retail_clean
WHERE 
	TransactionType = 'Sale'
GROUP BY 
	Country
ORDER BY 
	"Total Sales" DESC
LIMIT 10;