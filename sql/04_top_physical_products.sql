/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query shows the top 10 products with the most completed sales
*/
SELECT
	Description AS Product,
	Round (SUM(Quantity * Price), 2) AS "Total Sales",
	SUM(Quantity) AS "Units Sold"
FROM
	online_retail_clean
WHERE 
	TransactionType = 'Sale'
	AND
	Description IS NOT NULL
	AND
	UPPER(Description) NOT IN(
		'MANUAL',
		'DOTCOM POSTAGE',
		'POSTAGE'
		)
GROUP BY
	Description
ORDER BY
	"Total Sales" DESC
LIMIT 10;
