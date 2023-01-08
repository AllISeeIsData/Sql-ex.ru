/*
Exercise: 56
For each class, find out the number of ships of this class that were sunk in battles.
Result set: class, number of ships sunk.
*/

WITH all_ships AS (
SELECT
	c.class,
	s.name AS ship
FROM
	Classes c
INNER JOIN Ships s
ON
	c.class = s.class
UNION
SELECT
	c.class,
	o.ship AS ship
FROM
	Classes c
LEFT JOIN Outcomes o
ON
	c.class = o.ship)

SELECT
	class,
	SUM(IS_Sunk) AS Sunks
FROM
	(
	SELECT
		alls.class,
		CASE
			WHEN o.result = 'sunk' THEN 1
			ELSE 0
		END AS IS_Sunk
	FROM
		all_ships alls
	LEFT JOIN Outcomes o
ON
		alls.ship = o.ship) sub_a
GROUP BY
	class