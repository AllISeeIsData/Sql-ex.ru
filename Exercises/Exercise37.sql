/*
Exercise: 37
Find classes for which only one ship exists in the database (including the Outcomes table).
*/

WITH all_ships AS (
SELECT
	class
FROM
	(
	SELECT
		DISTINCT name,
		class
	FROM
		ships) sub1
UNION ALL
SELECT
	DISTINCT c.class
FROM
	classes c
INNER JOIN outcomes o
ON
	c.class = o.ship
WHERE
	o.ship NOT IN (
	SELECT
		name
	FROM
		ships)
)

SELECT
	class
FROM
	all_ships
GROUP BY
	class
HAVING
	COUNT(class) = 1
