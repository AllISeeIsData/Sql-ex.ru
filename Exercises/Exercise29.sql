/*
Exercise: 29
Under the assumption that receipts of money (inc) and payouts (out) are registered not more than once a day for each 
collection point [i.e. the primary key consists of (point, date)], 
write a query displaying cash flow data (point, date, income, expense).
Use Income_o and Outcome_o tables.
*/

SELECT
	inc.point,
	inc.date,
	inc.inc,
	out.out
FROM
	Income_o inc
LEFT JOIN Outcome_o out
ON
	inc.point = out.point
	AND inc.date = out.date
UNION
SELECT
	out.point,
	out.date,
	inc.inc,
	out.out
FROM
	Outcome_o out
LEFT JOIN Income_o inc
ON
	out.point = inc.point
	AND out.date = inc.date