/*
Exercise: 27
Find out the average hard disk drive capacity of PCs produced by makers who also manufacture printers.
Result set: maker, average HDD capacity.
*/

WITH makers AS (
SELECT
	maker
from
	Product
WHERE
	type = 'PC'
INTERSECT
SELECT
	maker
from
	Product
WHERE
	type = 'Printer')

SELECT
	pr.maker,
	avg(hd) AS Avg_hd
FROM
	Product pr
INNER JOIN PC pc
ON
	pr.model = pc.model
WHERE
	pr.maker IN (
	SELECT
		maker
	FROM
		makers)
GROUP BY
	pr.maker
ORDER BY
	Avg_hd DESC
