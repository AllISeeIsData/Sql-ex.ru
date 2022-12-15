/*
Exercise: 12
Find out the average speed of the laptops priced over $1000.
*/

SELECT
	AVG(lp.speed)
FROM
	Laptop lp
WHERE
	lp.price IN 
(
	SELECT
		lp.price
	FROM
		Laptop lp
	WHERE
		lp.price > 1000)