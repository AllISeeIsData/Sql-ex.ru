/*
Exercise: 41
For each maker who has models at least in one of the tables PC, Laptop, or Printer, 
determine the maximum price for his products.
Output: maker; if there are NULL values among the prices for the products of a given maker, 
display NULL for this maker, otherwise, the maximum price.
*/

WITH all_models AS (
SELECT
	pc.model,
	pc.price
FROM
	PC pc
UNION ALL
SELECT
	lp.model,
	lp.price
FROM
	Laptop lp
UNION ALL
SELECT
	pt.model,
	pt.price
FROM
	Printer pt)

SELECT
	pr.maker,
	CASE
		WHEN SUM(CASE WHEN
allm.price IS NULL THEN 1
ELSE 0
END) > 0 THEN NULL
		ELSE MAX(allm.price)
	END AS m_price
FROM
	Product pr
INNER JOIN all_models allm
ON
	pr.model = allm.model
GROUP BY
	pr.maker