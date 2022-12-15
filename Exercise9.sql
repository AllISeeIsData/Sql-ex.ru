/*
Exercise: 9
Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.
*/

SELECT
	DISTINCT pr.maker
FROM
	Product pr
INNER JOIN PC pc
ON
	pr.model = pc.model
WHERE
	pc.speed >= 450