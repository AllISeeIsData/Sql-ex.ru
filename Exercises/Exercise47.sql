/*
Exercise: 47
Find the countries that have lost all their ships in battles.
*/

WITH all_ships_country AS (
SELECT
	c.country,
	s.name AS ship
FROM
	Classes c
INNER JOIN Ships s 
ON
	c.class = s.class
UNION
SELECT
	c.country,
	o.ship AS ship
FROM
	Outcomes o
INNER JOIN Classes c 
ON
	c.class = o.ship),

country_ship_result AS (
SELECT
	allsc.country,
	allsc.ship,
	CASE
		WHEN o.result = 'sunk' THEN 1
		ELSE 0
	END AS result_sunk
FROM
	all_ships_country allsc
LEFT JOIN Outcomes O
ON
	allsc.ship = o.ship)

SELECT
	DISTINCT country
FROM
	country_ship_result
GROUP BY
	country
HAVING
	COUNT(DISTINCT ship) = SUM(result_sunk)