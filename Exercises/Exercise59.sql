/*
Exercise: 59
Calculate the cash balance of each buy-back center for the database 
with money transactions being recorded not more than once a day.
Result set: point, balance.
*/

SELECT
	ISNULL(inc.point,
	out.point) AS Point,
	SUM(ISNULL(inc.inc, 0)) - SUM(ISNULL(out.out, 0)) AS Cash_balance
FROM
	Income_o inc
FULL JOIN Outcome_o OUT 
ON
	inc.point = out.point
	AND inc.date = out.date
GROUP BY
	ISNULL(inc.point,
	out.point)
ORDER BY
	1