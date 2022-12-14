/*
Exercise: 36
List the names of lead ships in the database (including the Outcomes table).
*/

WITH all_lead_ships AS (
SELECT
	s.name AS name
FROM
	Ships s
WHERE
	s.name = s.class
UNION
SELECT
	o.ship AS name
FROM
	outcomes o
WHERE
	o.ship IN (
	SELECT
		class
	FROM
		Classes))

SELECT
	name
FROM
	all_lead_ships