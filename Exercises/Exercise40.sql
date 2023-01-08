/*
Exercise: 40
Find the ships that `survived for future battles`; 
that is, after being damaged in a battle, they participated in another one, which occurred later.
*/

SELECT
	maker,
	type
FROM
	Product
WHERE
	maker IN (
	SELECT
		maker
	FROM
		Product
	GROUP BY
		maker
	HAVING
		COUNT(DISTINCT type) = 1)
GROUP BY
	maker,
	type
HAVING
	COUNT(model) > 1
