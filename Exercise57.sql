/*
Exercise: 57
For classes having irreparable combat losses and at least three ships in the database, 
display the name of the class and the number of ships sunk.
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
	c.class = o.ship),

all_ships_count_3_ships AS (
SELECT
	alls.class
FROM
	all_ships alls
GROUP BY
	class
HAVING
	COUNT(alls.ship) >= 3)

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
WHERE
	class IN (
	SELECT
		class
	FROM
		all_ships_count_3_ships)
GROUP BY
	class
HAVING
	SUM(IS_Sunk) >= 1

