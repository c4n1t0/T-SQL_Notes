# Apuntes curso SQL Sección 3 4 5

## Sección 3 video 1.

Ejemplo:
~~~
SELECT 
	a.BusinessEntityID,
	a.PersonType,
	a.NameStyle-- Seleccion de la tabla
FROM 
	[Person].[Person] AS a -- con AS creas un alias para llamar a partes de la tabla en vez de [Person].[Person]
~~~
El SELECT siempre tiene que ir acompañado de uno de los siguientes:
~~~
1.- FROM
2.- ON
3.- JOIN
4.- WHERE
5.- GROUP BY
6.- WITH
7.- HAVING
8.- SELECT
9.- DISTINCT
10.- ORDER BY
11.- TOP
~~~
La comprobación de las sentencias van buscando en ese orden.

## Sección 3 video 2

Cuando tienes una tabla [Person].[Person] por ejemplo, si quieres ver la información relevante de la tabla es con alt+f1
Cuando trabajas condicionantes, el && o || se establece como AND o OR

Ejemplo:
~~~
SELECT 
	*
FROM
	[Person].[Person] AS a
WHERE
	a.LastName = 'Sánchez'
	AND a.EmailPromotion = 1

Otro ejemplo con fecha date, en el video no, pero yo he tenido que agregar la T para arreglar un error:

WHERE
	A.ModifiedDate='2007-12-30T00:00:00.000'
~~~
## Sección 3 video 3

EL comando GROUP BY no permite usar alias AS dentro.

Ejemplo:
~~~
SELECT
	a.Color,
	a.Name,
	SUM (a.ListPrice) AS Suma
FROM
	Production.Product AS a
GROUP BY
	a.Color,
	a.Name
~~~
Las columnas que se seleccionan si no se está operando con ellas como la tercera, tenemos que agruparlas para evitar el error del Query.

## Sección 3 video 4

El HAVING es usado para filtrar en este caso por valores ya que con un WHERE no se podría realizar, da error.

Ejemplo:
~~~
SELECT
	a.Color,
	SUM(a.ListPrice) AS Total
FROM
	Production.Product AS a
GROUP BY
	a.Color
	HAVING SUM(a.ListPrice) > 10000
~~~
## Sección 3 video 5

ORDER BY sirve para ordenar las columnas de tal forma que, ejemplo:
~~~
SELECT
	a.Color,
	SUM(a.ListPrice) AS Total
FROM
	Production.Product AS a
GROUP BY
	a.Color
	HAVING SUM(a.ListPrice) > 10000
ORDER BY
	SUM(a.ListPrice) DESC, -- Las palabras ASC y DESC son reservadas para odenar, creo que se podría sustituir a.ListPrice por Total y funciona
	a.Color -- Se pueden ordenar varias columnas, pero tiene prioridad la superior
~~~
## Sección 3 video 6

El TOP sirve para limitarl lo que voy a mostrar. En un SELECT, el TOP siempre va a continuación, y si le dices un número te muestra esa cantidad de líneas, también puedes decirle detrás
PERCENT y te muestra ese tanto porciento del total de líneas de la tabla, si el porcentaje es por ejemplo 10,1 siempre va a redondear hacia arriba, mostraría 11.

Ejemplo:
~~~
SELECT TOP 1 PERCENT
	*
FROM
	Production.Product AS a
~~~

## Sección 3 video 7

El DISTINCT se coloca al lado del SELECT para filtrar los valores de una tabla de tal manera que solo muestre los valores únicos para que no se repitan. 
En el siguiente ejemplo con un GROUP BY se podría hacer igual, pero para que la base de datos trabaje mejor, es preferible DISTINCT.

Ejemplo 1:
~~~
SELECT DISTINCT
	a.JobTitle
FROM
	HumanResources.Employee AS a
--GROUP BY
--	a.JobTitle
ORDER BY
	a.JobTitle
~~~
Ejemplo 2, en este ejemplo puede haber valores duplicados de JobTitle porque puede haber un masculino y un femenino: 
~~~
SELECT DISTINCT
	a.JobTitle,
	a.Gender
FROM
	HumanResources.Employee AS a
ORDER BY
	a.JobTitle
~~~
## Sección 4 video 1

INNER JOIN (conexión entre las tablas) Nos permite traer datos de 2 o más tablas relacionadas

Ejemplo:
~~~
SELECT
	a.FirstName,  	--Esto hace referencia a una columna de la tabla a
	b.PhoneNumber,  -- Esto hace referencia a una columna de la tabla b
	c.Name			--Esto hace referencia a una columna de la tabla c
FROM
	person.Person AS a
	INNER JOIN Person.PersonPhone AS b					--Aqui es donde le decimos que nos traiga el teléfono de la tabla b siempre que:
		ON a.BusinessEntityID = b.BusinessEntityID		--aquí se cumpla las coincidencias de la tabla a y b
	INNER JOIN Person.PhoneNumberType AS c				--Aquí donde traemos el tipo de teléfono de una tercera tabla:
		ON b.PhoneNumberTypeID = c.PhoneNumberTypeID	--Buscando que coincidan los ID de la tabla b y c
~~~
## Sección 4 video 2

LEFT y RIGHT JOIN, Nos permite traer datos de 2 o más tablas pero respetando la estructura de la LEFT o RIGHT de manera que si tiene que rellenar la
segunda tabla con NULL se hace.

Ejemplo:
~~~
SELECT
	a.FirstName,
	b.JobTitle
FROM 
	Person.Person AS a -- tabla 1
	LEFT JOIN [HumanResources].[Employee] AS b
		ON a.BusinessEntityID = b.BusinessEntityID

SELECT
	*
FROM
	HumanResources.Employee AS a
	RIGHT JOIN [Person].[Person] as b
		ON a.BusinessEntityID = b.BusinessEntityID
~~~
## Sección 5 video 1

La función SUM() 

En la funcion de ejemplo en la tabla A hay unos id´s que consultamos sus nombres en la tabla B y los añadimos
con INNER JOIN y los agrupamos por nombre. La suma, suma todos los valores de la tabla A con el mismo nombre: 
~~~
SELECT
	b.name AS NombreProducto
	,SUM(a.Quantity) AS Cantidad
FROM
	[Production].[ProductInventory] AS a
	INNER JOIN Production.Product AS b
		ON a.ProductID = b.ProductID
GROUP BY
	b.name
~~~
## Sección 5 video 2

AVG(), count()
El count() retorna el número de valores encontrados e ignora los NULL aunque se puede hacer para contarlos también.

Con el ejemplo del count() hay 3 tipos de valores en una columna EmailPromotion y contamos la cantidad de cada valor hay en la columna:
~~~
SELECT
	a.EmailPromotion
	, COUNT(a.EmailPromotion) AS Cantidad
FROM
	[Person].[Person] AS a
GROUP BY
	a.EmailPromotion
~~~
En el siguiente ejemplo, si sustituyo en el count() la columna por un * me cuenta tambien los NULL:
~~~
SELECT
	a.Title
	,COUNT(*) AS Cantidad
FROM
	Person.Person AS a
GROUP BY
	a.Title
~~~
En el siguiente ejemplo con el DISTINCT dentro de la función trae la cantidad de diferentes que hay:
~~~
SELECT
	COUNT(DISTINCT a.LastName) AS Cantidad
FROM
	Person.Person AS a
~~~
Ahora toca el AVG() retorna el promedio de valores ignorando los NULL. En el ejemplo se saca el promedio de 
valor por colores:
~~~
SELECT
	a.Color
	, AVG(a.ListPrice) AS Promedio
FROM
	Production.Product AS a
GROUP BY
	a.Color
~~~
## Sección 5 video 3

MAX() - MIN()

Ejemplo:
~~~
SELECT
	MIN(a.ModifiedDate) AS Minimo
	, MAX(a.ModifiedDate) AS Maximo
FROM
	Person.Password AS a
~~~
