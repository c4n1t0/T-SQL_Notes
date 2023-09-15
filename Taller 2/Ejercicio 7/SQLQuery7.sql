-- Ejercicio 7

SELECT
	b.Name AS NomSubCate
	, COUNT(a.Name) AS Cantidad
FROM
	Production.Product AS a
	LEFT JOIN Production.ProductSubcategory AS b 
		ON a.ProductSubcategoryID = b.ProductSubcategoryID
GROUP BY
	b.Name
ORDER BY
	Cantidad DESC

