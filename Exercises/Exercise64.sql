/*
Exercise: 64
Using the Income and Outcome tables, 
determine for each buy-back center the days when it received funds but made no payments, 
and vice versa.
Result set: point, date, type of operation (inc/out), sum of money per day.
*/


SELECT
	ISNULL(inc.point,
	out.point) AS point,
	ISNULL(inc.date,
	out.date) AS date,
	CASE
		WHEN SUM(inc.inc) IS NOT NULL
THEN 'inc'
		ELSE 'out'
	END AS type_of_operation,
	CASE
		WHEN SUM(inc.inc) IS NOT NULL
THEN SUM(inc.inc)
		ELSE SUM(out.out)
	END AS money_sum
FROM
	Income inc
FULL JOIN Outcome OUT
ON
	inc.point = out.point
	AND inc.date = out.date
GROUP BY
	ISNULL(inc.point,
	out.point),
	ISNULL(inc.date,
	out.date)
HAVING
	SUM(inc.inc) IS NULL
	OR SUM(out.out) IS NULL
ORDER BY
	point,
	date,
	money_sum