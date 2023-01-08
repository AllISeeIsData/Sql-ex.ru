/*
Exercise: 14
For the ships in the Ships table that have at least 10 guns, get the class, name, and country.
*/

SELECT
	c.class,
	s.name,
	c.country
FROM
	Classes c
INNER JOIN Ships s
ON
	c.class = s.class
WHERE
	c.numguns >= 10