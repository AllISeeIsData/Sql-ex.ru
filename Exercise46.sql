/*
Exercise: 46
For each ship that participated in the Battle of Guadalcanal, get its name, displacement, and the number of guns.
*/

Select
	DISTINCT o.ship,
	c.displacement,
	c.numGuns
FROM
	Classes c
LEFT JOIN ships s
ON
	c.class = s.class
RIGHT JOIN Outcomes o
ON
	s.name = o.ship
	OR c.class = o.ship
WHERE
	o.battle = 'Guadalcanal'