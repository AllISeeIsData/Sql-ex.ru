/*
Exercise: 7
Get the models and prices for all commercially available products (of any type) produced by maker B.
*/

SELECT
	pr.model,
	pc.price
FROM
	Product pr
INNER JOIN PC pc
on
	pr.model = pc.model
WHERE
	pr.maker = 'B'
UNION
SELECT
	pr.model,
	lp.price
FROM
	Product pr
INNER JOIN Laptop lp
on
	pr.model = lp.model
WHERE
	pr.maker = 'B'
UNION
SELECT
	pr.model,
	pt.price
FROM
	Product pr
INNER JOIN Printer pt
on
	pr.model = pt.model
WHERE
	pr.maker = 'B'