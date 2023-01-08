/*
Exercise: 28
Using Product table, find out the number of makers who produce only one model.
*/

WITH CTE AS (
SELECT
	maker,
	COUNT(model) AS number_of_models
FROM
	Product
Group by
	maker
Having
	count(model) = 1)

SELECT
	COUNT(maker) AS QTY
FROM
	CTE