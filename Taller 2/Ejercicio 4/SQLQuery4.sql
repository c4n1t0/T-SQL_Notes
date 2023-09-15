-- Ejercicio 4

SELECT
	LTRIM(CONCAT(a.FirstName, ' ', (a.MiddleName + ' '), a.LastName, ' ', b.PhoneNumber)) AS NombreTelefono
FROM
	Person.Person AS a
	INNER JOIN Person.PersonPhone AS b 
		ON a.BusinessEntityID = b.BusinessEntityID