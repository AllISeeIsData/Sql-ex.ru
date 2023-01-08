/*
Exercise: 45
Find all ship names consisting of three or more words (e.g., King George V).
Consider the words in ship names to be separated by single spaces, 
and the ship names to have no leading or trailing spaces.
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
	LEN(LTRIM(RTRIM(name))) -
      LEN(REPLACE(LTRIM(RTRIM(name)), ' ', '')) >= 2
