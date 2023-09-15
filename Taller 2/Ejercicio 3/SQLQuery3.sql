-- Ejercicio 3

SELECT
	a.Name
	, a.ProductNumber
	, REPLACE(REPLACE(a.MakeFlag, '1', 'El producto se fabrica en la empresa'), '0', 'El producto se compra') AS MakeFlag
	, ISNULL(a.Color, 'No Color') AS Color
	, CAST(a.SellStartDate AS date) AS SellStartDate
	, a.SellEndDate
FROM
	Production.Product AS a
