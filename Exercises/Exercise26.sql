/*
Exercise: 26
Find out the average price of PCs and laptops produced by maker A.
Result set: one overall average price for all items.
*/

WITH pc_and_laptop AS (
SELECT
	model,
	price
FROM
	PC
UNION ALL
SELECT
	model,
	price
FROM
	Laptop),

pc_and_laptop_maker_A AS (
SELECT
	model,
	price
FROM
	pc_and_laptop
WHERE
	model IN (
	SELECT
		model
	FROM
		Product
	WHERE
		maker = 'A'))

SELECT
	AVG(price)
FROM
	pc_and_laptop_maker_A
