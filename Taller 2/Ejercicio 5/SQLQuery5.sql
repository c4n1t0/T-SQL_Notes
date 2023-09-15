-- Ejercicio 5

SELECT
	LTRIM(CONCAT(a.FirstName, ' ', (a.MiddleName + ' '), a.LastName)) AS Nombre
	, b.PhoneNumber AS PhoneNumber
FROM
	Person.Person AS a
	INNER JOIN Person.PersonPhone AS b 
		ON a.BusinessEntityID = b.BusinessEntityID