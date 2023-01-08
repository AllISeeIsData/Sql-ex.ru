/*
Exercise: 33
Get the ships sunk in the North Atlantic battle.
Result set: ship.
*/

SELECT
	o.ship
FROM
	Outcomes o
WHERE
	o.battle IN (
	SELECT
		b.name
	FROM
		Battles b
	WHERE
		b.name = 'North Atlantic')
	AND o.result = 'sunk'