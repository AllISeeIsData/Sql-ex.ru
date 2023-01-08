/*
Exercise: 30
Under the assumption that receipts of money (inc) and payouts (out) can be registered 
any number of times a day for each collection point [i.e. the code column is the primary key], 
display a table with one corresponding row for each operating date of each collection point.
Result set: point, date, total payout per day (out), total money intake per day (inc).
Missing values are considered to be NULL.
*/

WITH grouped_inc AS (
SELECT
	point,
	date,
	SUM(inc) AS sum_inc
FROM
	Income
GROUP BY
	point,
	date),

grouped_out AS (
SELECT
	point,
	date,
	SUM(out) AS sum_out
FROM
	Outcome
GROUP BY
	point,
	date)

SELECT
	inc.point,
	inc.date,
	out.sum_out,
	inc.sum_inc
FROM
	grouped_inc inc
LEFT JOIN grouped_out out
ON
	inc.point = out.point
	AND inc.date = out.date
UNION
SELECT
	out.point,
	out.date,
	out.sum_out,
	inc.sum_inc
FROM
	grouped_out out
LEFT JOIN grouped_inc inc
ON
	out.point = inc.point
	AND out.date = inc.date