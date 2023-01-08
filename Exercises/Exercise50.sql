/*
Exercise: 50
Find the battles in which Kongo-class ships from the Ships table were engaged.
*/

WITH all_ships_Kongo_class AS (
SELECT
	c.class,
	s.name AS ship
FROM
	Classes c
INNER JOIN Ships s 
ON
	c.class = s.class
WHERE
	c.class = 'Kongo'
UNION
SELECT
	c.class,
	o.ship AS ship
FROM
	Outcomes o
INNER JOIN Classes c 
ON
	c.class = o.ship
WHERE
	c.class = 'Kongo')

SELECT
	DISTINCT o.battle
FROM
	all_ships_Kongo_class askc
INNER JOIN Outcomes o
ON
	askc.ship = o.ship