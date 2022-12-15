/*
Exercise: 38
Find countries that ever had classes of both battleships (‘bb’) and cruisers (‘bc’).
*/

SELECT
	Country
FROM
	Classes
WHERE
	type = 'bb'
GROUP BY
	Country
HAVING
	COUNT(class) >= 1
INTERSECT
SELECT
	Country
FROM
	Classes
WHERE
	type = 'bc'
GROUP BY
	Country
HAVING
	COUNT(class) >= 1