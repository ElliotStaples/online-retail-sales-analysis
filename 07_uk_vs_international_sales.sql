/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query compares the completed sales between the United Kingdom and all other international markets combined
*/
SELECT
	CASE
	WHEN
		Country = 'United Kingdom' THEN 'United Kingdom'
		ELSE
		'International'
	END AS "Market",
	ROUND(SUM(Quantity * Price), 2) AS "Total Sales",
	COUNT(DISTINCT Invoice) AS "Total Orders"
FROM
	online_retail_clean
WHERE
	TransactionType = 'Sale'
GROUP BY
	CASE
		WHEN Country = 'United Kingdom' THEN 'United Kingdom'
		ELSE 'International'
	END
ORDER BY 
	"Total Sales" DESC;