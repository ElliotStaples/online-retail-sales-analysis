/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query shows the month by month sales change
*/
WITH monthly_sales AS (
  SELECT
    MonthYear,
    MIN(InvoiceDate) AS month_start,
    SUM(Quantity * Price) AS total_sales
  FROM 
	online_retail_clean
  WHERE 
	TransactionType = 'Sale'
  GROUP BY 
	MonthYear
)

SELECT
  MonthYear AS "Month",
  ROUND(total_sales, 2) AS "Total Sales",
  ROUND(
    total_sales - LAG(total_sales) OVER (ORDER BY month_start),
    2
  ) AS "Change vs Previous Month"
FROM 
	monthly_sales
ORDER BY 
	month_start;
