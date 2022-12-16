/*
Exercise: 44
Find all ship names beginning with the letter R.
*/

WITH all_ships AS (
SELECT
	s.name AS name
FROM
	Ships s
UNION
SELECT
	o.ship AS name
FROM
	Outcomes o)

SELECT
	name
FROM
	all_ships
WHERE
	name LIKE 'R%'
