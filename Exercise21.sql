/*
Exercise: 21
Find out the maximum PC price for each maker having models in the PC table. Result set: maker, maximum price.
*/

SELECT
	pr.maker,
	MAX(pc.price) AS maximum_price
FROM
	Product AS pr
INNER JOIN PC AS pc
ON
	pr.model = pc.model
GROUP BY
	pr.maker
ORDER BY
	MAX(pc.price) DESC
