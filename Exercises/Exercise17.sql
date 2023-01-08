/*
Exercise: 17
Get the laptop models that have a speed smaller than the speed of any PC.
Result set: type, model, speed.
*/

SELECT DISTINCT 
	pr.type,
	lp.model,
	lp.speed
FROM
	laptop AS lp
INNER JOIN Product AS pr
ON
	lp.model = pr.model
WHERE
	lp.speed < 
(
	SELECT
		MIN(speed)
	FROM
		pc)
