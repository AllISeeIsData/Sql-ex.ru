/*
Exercise: 55
For each class, determine the year the first ship of this class was launched.
If the lead ship’s year of launch is not known, get the minimum year of launch for the ships of this class.
Result set: class, year.
*/

SELECT c.class, 
CASE
	WHEN s.launched IS NULL THEN (
	SELECT
		MIN(launched)
	FROM
		Ships s
	WHERE
		c.class = s.class)
	ELSE s.launched
END AS year
FROM
Classes c
LEFT JOIN Ships s
ON
c.class = s.name