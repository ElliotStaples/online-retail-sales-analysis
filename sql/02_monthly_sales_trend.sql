/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query shows the completed month by month sales
*/
SELECT
  MonthYear AS "Month",
  ROUND(SUM(Quantity * Price), 2) AS "Total Sales",
  COUNT(DISTINCT Invoice) AS "Total Orders"
FROM 
	online_retail_clean
WHERE 
	TransactionType = 'Sale'
GROUP BY 
	MonthYear
ORDER BY 
	MIN(InvoiceDate);
