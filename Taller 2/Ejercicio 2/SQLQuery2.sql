-- Ejercicio 2

SELECT
	a.JobTitle,
	DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, a.BirthDate) AS EdadEmpleado
FROM
	HumanResources.Employee AS a
