-- Ejercicio 6

SELECT
	a.name AS NomProduct
	, b.Name AS NomSubCate
FROM
	Production.Product AS a
	LEFT JOIN Production.ProductSubcategory AS b 
		ON a.ProductSubcategoryID = b.ProductSubcategoryID
ORDER BY
	b.Name DESC