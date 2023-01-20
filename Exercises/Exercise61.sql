/*
Exercise: 61
For the database with money transactions being recorded not more than once a day, 
calculate the total cash balance of all buy-back centers.
*/

SELECT
	SUM(ISNULL(inc.inc, 0) - ISNULL(out.out, 0)) AS Cash_balance
FROM
	Income_o inc
FULL JOIN Outcome_o OUT
ON
	inc.point = out.point
	AND inc.date = out.date