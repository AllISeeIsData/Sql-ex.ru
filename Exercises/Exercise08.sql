/*
Exercise: 8
Find the makers producing PCs but not laptops.
*/

SELECT
	pr.maker
FROM
	Product pr
WHERE
	pr.type = 'PC'
EXCEPT
SELECT
	pr.maker
FROM
	Product pr
WHERE
	pr.type = 'Laptop'