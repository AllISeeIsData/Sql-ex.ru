/*
Exercise: 32
One of the characteristics of a ship is one-half the cube of the calibre of its main guns (mw).
Determine the average ship mw with an accuracy of two decimal places for each country having ships in the database.
*/

WITH all_ships AS (
SELECT
	country,
	bore,
	name
FROM
	Classes c
INNER JOIN Ships s
ON
	c.class = s.class
UNION
SELECT
	country,
	bore,
	ship AS name
FROM
	Classes c
INNER JOIN Outcomes o
ON
	c.class = o.ship)

SELECT
	country,
	CAST(AVG(POWER(bore, 3.0)/ 2.0) AS DECIMAL (10,
	2)) AS weight
FROM
	all_ships
GROUP By
	country
ORDER BY
	weight DESC