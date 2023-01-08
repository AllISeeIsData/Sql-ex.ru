/*
Exercise: 48
Find the ship classes having at least one ship sunk in battles.
*/

SELECT
	DISTINCT c.class
FROM
	Outcomes o
LEFT JOIN Ships s
ON
	o.ship = s.name
INNER JOIN Classes c
ON
	c.class = s.class
	OR c.class = o.ship
WHERE
	result = 'sunk'