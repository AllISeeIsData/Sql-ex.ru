/*
Exercise: 39
Find the ships that `survived for future battles`; 
that is, after being damaged in a battle, they participated in another one, which occurred later.
*/

WITH damaged_all_ships AS (
SELECT
	o.ship,
	b.date
FROM
	Outcomes o
INNER JOIN battles b
ON
	o.battle = b.name
WHERE
	result = 'damaged')

SELECT
	DISTINCT o.ship
FROM
	Outcomes o
INNER JOIN damaged_all_ships das
ON
	o.ship = das.ship
INNER JOIN Battles b
ON
	o.battle = b.name
WHERE
	b.date > das.date
