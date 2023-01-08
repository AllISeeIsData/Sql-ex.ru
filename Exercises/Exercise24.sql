/*
Exercise: 24
List the models of any type having the highest price of all products present in the database.
*/

WITH pc_laptop_printer AS (
SELECT
	pc.model,
	pc.price
FROM
	PC pc
UNION ALL
SELECT
	lp.model,
	lp.price
FROM
	Laptop lp
UNION ALL
SELECT
	pt.model,
	pt.price
FROM
	Printer pt),

pc_laptop_printer_max_price AS (
SELECT
	TOP(1) model,
	MAX(price) AS highest_price
FROM
	pc_laptop_printer
GROUP BY
	model
ORDER BY
	MAX(price) DESC)

SELECT
	pr.model
FROM
	Product pr
INNER JOIN pc_laptop_printer_max_price cte
ON
	pr.model = cte.model

