/*
Exercise: 13
Find out the average speed of the PCs produced by maker A.
*/

SELECT
	AVG(pc.speed)
FROM
	Product pr
INNER JOIN PC pc
on
	pr.model = pc.model
WHERE
	pr.maker = 'A'