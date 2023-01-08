/*
Exercise: 53
With a precision of two decimal places, determine the average number of guns for the battleship classes.
*/

SELECT
	CAST(AVG(CAST(numGuns AS DECIMAL(4, 2))) AS DECIMAL (4,
	2)) AS avg_numGuns
FROM
	Classes
WHERE
	type = 'bb'