/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query finds the highest-value individual orders
*/
WITH order_totals AS (
  SELECT
    Invoice,
    Country,
    "Customer ID",
    SUM(Quantity * Price) AS order_value
  FROM 
	online_retail_clean
  WHERE 
	TransactionType = 'Sale'
    AND UPPER(Description) NOT IN (
      'MANUAL',
      'DOTCOM POSTAGE',
      'POSTAGE'
    )
  GROUP BY
    Invoice,
    Country,
    "Customer ID"
)

SELECT
  Invoice AS "Invoice",
  Country AS "Country",
  "Customer ID" AS "Customer ID",
  ROUND(order_value, 2) AS "Order Value"
FROM 
	order_totals
ORDER BY 
	order_value DESC
LIMIT 10;
