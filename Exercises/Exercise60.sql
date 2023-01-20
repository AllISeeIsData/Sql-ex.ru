/*
Exercise: 60
For the database with money transactions being recorded not more than once a day, 
calculate the cash balance of each buy-back center at the beginning of 4/15/2001.
Note: exclude centers not having any records before the specified date.
Result set: point, balance
*/

SELECT
	ISNULL(inc.point,
	out.point) AS point,
	SUM(ISNULL(inc.inc, 0)) - SUM(ISNULL(out.out, 0)) AS Cash_balance
FROM
	Income_o inc
FULL JOIN Outcome_o OUT 
ON
	inc.point = out.point
	AND inc.date = out.date
WHERE
	ISNULL(inc.date,
	out.date) < '2001-04-15'
GROUP BY
	ISNULL(inc.point,
	out.point)
ORDER BY
	1