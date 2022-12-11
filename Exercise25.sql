/*
Exercise: 25
Find the printer makers also producing PCs with the lowest RAM capacity and the highest processor speed of all PCs having the lowest RAM capacity.
Result set: maker.
*/

SELECT
	pr.maker
FROM
	Product pr
WHERE
	pr.type = 'Printer'
INTERSECT
SELECT
	pr.maker
FROM
	Product pr
INNER JOIN PC pc
ON
	pr.model = pc.model
WHERE
	pr.type = 'PC'
	AND pc.speed IN (
	SELECT
		MAX(speed)
	FROM
		PC
	WHERE
		ram IN (
		SELECT
			MIN (ram)
		FROM
			PC))
	AND pc.ram IN (
	SELECT
		MIN(ram)
	FROM
		PC)
