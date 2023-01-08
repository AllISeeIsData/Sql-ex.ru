/*
Exercise: 19
For each maker having models in the Laptop table, find out the average screen size of the laptops he produces.
Result set: maker, average screen size.
*/

SELECT
	pr.maker,
	avg(lp.screen) AS average_screen_size
FROM
	Product pr
INNER JOIN Laptop lp
ON
	pr.model = lp.model
GROUP BY
	pr.maker
ORDER BY
	average_screen_size
