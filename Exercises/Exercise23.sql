/*
Exercise: 23
Get the makers producing both PCs having a speed of 750 MHz or higher and laptops with a speed of 750 MHz or higher.
Result set: maker
*/

SELECT
	pr.maker
FROM
	Product pr
INNER JOIN PC pc
ON
	pr.model = pc.model
WHERE
	pc.speed >= 750
INTERSECT
SELECT
	pr.maker
FROM
	Product pr
INNER JOIN Laptop lp
ON
	pr.model = lp.model
WHERE
	lp.speed >= 750
