/*
Exercise: 10
Find the printer models having the highest price. Result set: model, price.
*/

SELECT
	pr.model,
	pr.price
FROM
	Printer pr
WHERE
	pr.price IN 
(
	SELECT
		MAX(pr.price)
	FROM
		Printer pr)