-- Ejercicio 10

SELECT TOP 1
	c.Name
	, MAX(c.Cantidad) AS Quantity
FROM
(
	SELECT
		b.Name AS Name
		, SUM(a.Quantity) AS Cantidad
	FROM
		Production.ProductInventory AS a
		INNER JOIN Production.Product AS b 
			ON a.ProductID = b.ProductID
	GROUP BY
		b.Name
) AS c
GROUP BY
	c.Name
ORDER BY
	Quantity DESC
