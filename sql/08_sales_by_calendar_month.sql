/*
Created by: Elliot Staples
Create Date: 08/27/2026
Description: This query finds the strongest sales months combinding the months across all the different years
*/
SELECT
	CASE strftime('%m', InvoiceDate)
		WHEN '01' THEN 'January'
		WHEN '02'  THEN 'February'
		WHEN '03' THEN 'March'
		WHEN '04' THEN 'April'
		WHEN '05' THEN 'May'
		WHEN '06' THEN 'June'
		WHEN '07' THEN 'July'
		WHEN '08' THEN 'August'
		WHEN '09' THEN 'September'
		WHEN '10' THEN 'October'
		WHEN '11' THEN 'November'
		WHEN '12' THEN 'December'
	END AS "Calender Month",
	ROUND(SUM(Quantity * Price), 2) AS "Total Sales",
	COUNT(DISTINCT Invoice) AS "Total Orders"
FROM
	online_retail_clean
WHERE
	TransactionType = 'Sale'
GROUP BY 
	strftime('%m', InvoiceDate)
ORDER BY
	strftime('%m', InvoiceDate);
		
