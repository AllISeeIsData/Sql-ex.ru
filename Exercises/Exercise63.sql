/*
Exercise: 63
Find the names of different passengers that ever travelled more than once occupying seats with the same number.
*/

SELECT
	pas.name
FROM
	Passenger pas
WHERE
	pas.ID_psg IN (
	SELECT
		pit.ID_psg
	FROM
		Pass_in_trip pit
	GROUP BY
		pit.place,
		ID_psg
	HAVING
		COUNT(ID_psg) >= 2)
