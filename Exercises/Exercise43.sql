/*
Exercise: 43
Get the battles that occurred in years when no ships were launched into water.
*/

SELECT
	b.name
FROM
	Battles b
WHERE
	DATEPART(year, b.date) NOT IN (
	SELECT
		s.launched
	FROM
		Ships s
	WHERE
		s.launched IS NOT NULL)