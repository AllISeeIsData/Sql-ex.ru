/*
Exercise: 16
Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i).
Result set: model with the bigger number, model with the smaller number, speed, and RAM.
*/

SELECT
	DISTINCT pc.model,
	pcpc.model,
	pc.speed,
	pc.ram
FROM
	PC AS pc
INNER JOIN PC AS pcpc
ON
	pc.model != pcpc.model
WHERE
	pc.speed = pcpc.speed
	AND pc.ram = pcpc.ram
	AND pc.model > pcpc.model
