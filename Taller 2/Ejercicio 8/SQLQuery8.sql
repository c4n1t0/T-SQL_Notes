-- Ejercicio 8

SELECT
	a.FirstName
	, b.SalesYTD AS Total
FROM
	Person.Person AS a
	INNER JOIN Sales.SalesPerson AS b ON a.BusinessEntityID = b.BusinessEntityID
ORDER BY
	a.FirstName
