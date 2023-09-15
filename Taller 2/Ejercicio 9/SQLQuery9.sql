-- Ejercicio 9

SELECT
	a.FirstName
	, b.SalesLastYear
FROM
	Person.Person AS a
	INNER JOIN Sales.SalesPerson AS b ON a.BusinessEntityID = b.BusinessEntityID
WHERE
	b.SalesLastYear > 
		(
			SELECT
				AVG(b.SalesLastYear)
			FROM 
				Sales.SalesPerson AS b
		)