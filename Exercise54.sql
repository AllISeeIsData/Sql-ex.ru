/*
Exercise: 54
With a precision of two decimal places, 
determine the average number of guns for all battleships (including the ones in the Outcomes table).
*/

WITH all_ships_type_numGuns AS (
SELECT
	s.name AS ship,
	c.type,
	c.numGuns
FROM
	Classes c
INNER JOIN Ships s
ON
	c.class = s.class
UNION
SELECT
	o.ship AS ship,
	c.type,
	c.numGuns
FROM
	Classes c
INNER JOIN Outcomes o
ON
	c.class = o.ship)

SELECT
	CAST(AVG(CAST(numGuns AS DECIMAL(4, 2))) AS DECIMAL(4,
	2)) AS avg_numGuns
FROM
	all_ships_type_numGuns
WHERE
	type = 'bb'
