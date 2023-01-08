/*
Exercise: 58
For each product type and maker in the Product table, find out, with a precision of two decimal places, 
the percentage ratio of the number of models of the actual type produced by the actual maker 
to the total number of models by this maker.
Result set: maker, product type, the percentage ratio mentioned above.
*/

SELECT
	pr1.maker,
	pr2.type,
	CAST(100 * CAST(
(
	SELECT
		COUNT(pr.type)
	FROM
		Product pr
	WHERE
		pr.maker = pr1.maker
		AND pr.type = pr2.type) AS DECIMAL(10,
	2))
/
(
	SELECT
		COUNT(pr.type)
	FROM
		Product pr
	WHERE
		pr.maker = pr1.maker) AS DECIMAL(10,
	2)) AS prc
FROM
	Product pr1,
	Product pr2
GROUP BY
	pr1.maker,
	pr2.type

