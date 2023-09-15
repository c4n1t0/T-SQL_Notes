-- Ejercicio 1

SELECT
	a.City AS Ciudades,
	COUNT(a.City) AS CantidadCiudades
FROM
	Person.Address AS a
GROUP BY
	a.city
ORDER BY
	CantidadCiudades DESC