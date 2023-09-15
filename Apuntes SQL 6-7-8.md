# Apuntes curso SQL Sección 6 7 8

Si seleccionas el nombre de una tabla y haces alt+f1 puedes ver los tipos de datos de la tabla. Ejemplo: Production.Product lo seleccionas y alt + f1

## Sección 6 video 1.

CAST() conversión de tipos de datos

En el ejemplo seleccionamos una columna y queremos mostrarla como fecha, no como fecha y hora:
~~~
SELECT
	CAST(a.ModifiedDate AS date) AS Fecha
FROM
	Production.Product AS a
~~~
Otro ejemplo:
~~~
SELECT
	CAST(a.ModifiedDate AS date) AS Fecha
	, CAST(a.MakeFlag AS VARCHAR) AS 'New value'
	, CAST(a.StandardCost AS INT) AS 'New INT'
FROM
	Production.Product AS a
WHERE
	a.ProductID = 514
~~~
Ultimo ejemplo: (La coluna a.ModifiedDate va a traer solo las que coinciden con la fecha y las va a convertir a DATE)
~~~
SELECT
	CAST(a.ModifiedDate AS date) AS Fecha
FROM
	Production.Product AS a
WHERE
	CAST(a.ModifiedDate AS date) = '2014-02-08'
~~~
## Sección 6 video 2.

CONVERT() y PARSE()

CONVERT() convierte de un tipo de dato a otro pero al darle el tipo de dato es distinto del CAST, ejemplo: CONVERT(DATE, a.ModifiedDate)

Ejemplo Convert():
~~~
SELECT
	CONVERT(DATE, a.ModifiedDate)
	, CONVERT(varchar, a.MakeFlag) AS NuevoValor 
	, CONVERT(bigint, a.StandardCost) 
FROM
	Production.Product AS a
~~~
Ejemplo Parse(), el parse se utiliza solo para convertir de cadena a fecha:
~~~
SELECT PARSE('Friday, 14 December 2018' AS date)
~~~
## Sección 7 video 1

GETDATE() y DATEADD()

Para obtener la fecha actual con GETDATE(), ejemplo1:
~~~
SELECT GETDATE()
~~~
Ejemplo2: traería solo la fecha por el CAST()
~~~
SELECT CAST(GETDATE() AS date)
~~~
Para modificar campos de fecha por ejemplo para restarle un mes a la fecha actual sería con GETDATE():
Se indica si es dia, mes, año, horas..., después la cantidad a añadir, y por ultimo a que fecha que en este caso es la actual.
~~~
SELECT DATEADD(MONTH, -1, GETDATE())AS date
SELECT DATEADD(YEAR, 1, GETDATE())AS date
SELECT DATEADD(MINUTE, 10, GETDATE())
~~~
Para filtrar una tabla por los valores entre 2 fechas. Ojo!! que he tenido que meter un CAST en el DATEADD que en los videos no está:
~~~
SELECT
	*
FROM
	Production.Product AS a
WHERE
	CAST(a.SellStartDate AS date) BETWEEN '2012-05-30' AND DATEADD(YEAR, 1, CAST('2012-05-30' AS date))
~~~
## Sección 7 video 2

DATENAME() y DATEPART()

### DATENAME() retorna un valor especifico de fecha en tipo STRING, es decir VARCHAR.

En el ejemplo 1 vemos como trae el año actual:
~~~
SELECT DATENAME(YEAR, GETDATE()) AS Año
SELECT DATENAME(MONTH, GETDATE()) AS Mes
SELECT DATENAME(DAY, GETDATE()) AS Dia
SELECT DATENAME(HOUR, GETDATE()) AS Hora
SELECT DATENAME(WEEKDAY, GETDATE()) AS 'Dia de la semana'


SET LANGUAGE ENGLISH                -- Si se coloca el SET encima puede convertirlo de idioma 
SELECT DATENAME(MONTH, GETDATE())   -- Retorna el mes escrito: Agosto

SELECT
	a.Name
	, a.SellStartDate
	, DATENAME(MONTH, a.SellStartDate) AS Mes
FROM
	Production.Product AS a
WHERE
	DATENAME(MONTH, a.SellStartDate) = DATENAME(MONTH, GETDATE())
~~~
### DATEPART() se encarga de devolver una parte especifica de la fecha que será devuelto en un valor entero.

Ejemplo:
~~~
SELECT DATEPART(MONTH, GETDATE()) AS Mes
~~~
## Sección 7 video 3

DAY(), MONTH(), YEAR() retornan el valor númerico en INT
~~~
SELECT DAY(GETDATE())
SELECT MONTH(GETDATE())
SELECT YEAR(GETDATE())
~~~
## Sección 8 video 1

CONCAT(), CONCAT_WS(), LEN()

En el ejemplo, la diferencia de los concat es que el WS en su primer parametro le dices el caracter separador y en el otro tienes que intercalarlo manualmente:
Ejemplo:
~~~
SELECT
	a.Title
	, a.FirstName
	, a.MiddleName
	, a.LastName
	, CONCAT(a.Title, ' ', a.FirstName, ' ', a.MiddleName, ' ', a.LastName) AS Nombres
	, CONCAT_WS(' ', a.Title, a.FirstName, a.MiddleName, a.LastName) AS Nombres_WS
	, a.Title+a.FirstName+a.MiddleName+a.LastName AS sumas -- De esta manera si hay valores null, el resultado es null
FROM
	Person.Person AS a
~~~
LEN() es para la longitud de un string.
Ejemplo:
~~~
SELECT
	 CONCAT_WS(' ', a.Title, a.FirstName, a.MiddleName, a.LastName) AS Nombres_WS
	,LEN(CONCAT_WS(' ', a.Title, a.FirstName, a.MiddleName, a.LastName)) AS longitud
FROM
	Person.Person AS a
~~~
## Sección 8 video 2

LEFT(), RIGHT()

Extrae trozos de strings desde la izquierda o desde la derecha:
Ejemplo:
~~~
--LEFT
SELECT
	LEFT(a.EmailAddress, 2) AS new
FROM
	Person.EmailAddress AS a

-- RIGHT

SELECT DISTINC --Para ver el número de dominios distintos de los mails 
	RIGHT(a.EmailAddress, 20) AS new
FROM
	Person.EmailAddress AS a
~~~
## Sección 8 video 3

LTRIM(), RTRIM()
Quita los espacios por delante o por detras de la string.
Ejemplo mio:
~~~
SELECT
	LTRIM(CONCAT(a.Title, ' ', a.FirstName, ' ', a.MiddleName, ' ', a.LastName)) AS Nombres
FROM
	Person.Person AS a

Ejemplo con subconsulta:

SELECT
	LTRIM(a.Nombres) AS Nueva
FROM(
	SELECT
		CONCAT(a.Title, ' ', a.FirstName, ' ', a.MiddleName, ' ', a.LastName) AS Nombres
	FROM
		Person.Person AS a) AS a
~~~
## Sección 8 video 4

REPLACE(), STUFF()
Replace reemplaza todas las apariciones de una cadena de caracteres por otra.
Ejemplo:
~~~
SELECT
	a.EmailAddress
	, REPLACE(a.EmailAddress, '@adventure-works.com', '@gmail.com') AS new
FROM
	Person.EmailAddress AS a
~~~
STUFF nos permite eliminar un trozo de columna para insertar una nueva.
El primer parámetro es la columna o string, el segundo la distancia desde el inicio que empieza, la longitud y la string nueva.
Ejemplo:
~~~
SELECT 'Hola Mundo'
SELECT STUFF('Hola Mundo', 6, 5, 'Nuevo Curso')
~~~