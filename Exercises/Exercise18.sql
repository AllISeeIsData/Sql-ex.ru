/*
Exercise: 18
Find the makers of the cheapest color printers.
Result set: maker, price.
*/

SELECT DISTINCT 
	pr.maker,
	pt.price
FROM
	Printer AS pt
INNER JOIN Product AS pr
ON
	pt.model = pr.model
WHERE
	pt.color = 'y'
	AND pt.price IN (
	SELECT
		MIN(price)
	FROM
		Printer
	WHERE
		color = 'y')
