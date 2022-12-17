/*
Exercise: 49
Find the names of the ships having a gun caliber of 16 inches (including ships in the Outcomes table).
*/

WITH all_ships_bore AS (
SELECT
	s.name AS ship,
	c.bore
FROM
	Classes c
INNER JOIN Ships s 
ON
	c.class = s.class
UNION
SELECT
	o.ship AS ship,
	c.bore
FROM
	outcomes o
INNER JOIN Classes c 
ON
	c.class = o.ship)

SELECT
	ship
FROM
	all_ships_bore
WHERE
	bore = '16.0'