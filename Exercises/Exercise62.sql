/*
Exercise: 62
For the database with money transactions being recorded not more than once a day, 
calculate the total cash balance of all buy-back centers at the beginning of 04/15/2001.
*/

SELECT
	SUM(ISNULL(inc.inc, 0) - ISNULL(out.out, 0)) AS Cash_balance
FROM
	Income_o inc
FULL JOIN Outcome_o OUT
ON
	inc.point = out.point
	AND inc.date = out.date
WHERE
	ISNULL(inc.date,
	out.date) < '2001-04-15'
