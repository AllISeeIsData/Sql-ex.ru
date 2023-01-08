/*
Exercise: 52
Determine the names of all ships in the Ships table that can be a Japanese battleship 
having at least nine main guns with a caliber of less than 19 inches and a displacement of not more than 65 000 tons.
*/

-- 1 solution that has the right logic of the query to solve the exercise. 
SELECT
	s.name
FROM
	Ships s
INNER JOIN Classes c
ON
	s.class = c.class
WHERE
	c.country = 'Japan'
	AND c.type = 'bb'
	AND c.numGuns >= 9
	AND c.bore < 19
	AND c.displacement <= 65000

-- 2 solution due to error (returns incorrect dataset when checking the second hidden database with null values).
SELECT
	s.name
FROM
	Ships s
INNER JOIN Classes c
ON
	s.class = c.class
WHERE
	(c.country = 'Japan'
		OR c.country IS NULL)
	AND (c.type = 'bb'
		OR c.type IS NULL)
	AND (c.numGuns >= 9
		OR c.numGuns IS NULL)
	AND (c.bore < 19
		OR c.bore IS NULL)
	AND (c.displacement <= 65000
		OR c.displacement IS NULL)
