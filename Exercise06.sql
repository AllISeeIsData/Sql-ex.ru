/*
Exercise: 6
For each maker producing laptops with a hard drive capacity of 10 Gb or higher, 
find the speed of such laptops. Result set: maker, speed.
*/

SELECT
	DISTINCT pr.maker,
	lp.speed
FROM
	Product pr
INNER JOIN Laptop lp
on
	pr.model = lp.model
WHERE
	lp.hd >= 10