/*
Exercise: 51
Find the names of the ships with the largest number of guns 
among all ships having the same displacement (including ships in the Outcomes table).
*/

WITH all_ships_numGuns_displacement AS (
SELECT
	s.name AS ship,
	c.numGuns,
	c.displacement
FROM
	Classes c
INNER JOIN Ships s
ON
	c.class = s.class
UNION
SELECT
	o.ship AS ship,
	c.numGuns,
	c.displacement
FROM
	Classes c
INNER JOIN Outcomes o
ON
	c.class = o.ship),

all_ships_maxnumGuns_displacement AS (
SELECT
	displacement,
	MAX(numGuns) AS Max_num_Guns
FROM
	all_ships_numGuns_displacement
GROUP BY
	displacement)

SELECT
	asnd.ship
FROM
	all_ships_numGuns_displacement asnd
INNER JOIN all_ships_maxnumGuns_displacement asmd
ON
	asnd.displacement = asmd.displacement
	AND asnd.numGuns = asmd.Max_num_Guns