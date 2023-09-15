# Apuntes curso SQL Sección 12 13 14

## Sección 12 video 1

INSERT INTO
Sirve para insertar datos en una tabla, indicando el orden de los valores de cada columna. Se pueden añadir varias lineas de tal manera que separas los parentesis con una coma. De esta manerea se colocan los datos en orden respecto a las columnas de la tabla.
Ejemplo:
~~~
INSERT INTO Table_Personal VALUES (3, 'Alex', 2, 1), (4, 'Samuel', 2, 1)
~~~
Si Quieres añadir los valores desordenados, sería asi:
~~~
INSERT INTO Table_Personal (Nombre, Id_Tel, Cedula, Id) VALUES ('Javier', 3, 5, 5), ('Jefferson', 2, 6, 6)
~~~
En el siguiente ejemplo, se indican los datos que se van a introducir a la tabla, pero no se van a rellenar todas las columnas, la base de datos nos va a colocar valores NULL.
Ejemplo:
~~~
INSERT INTO Table_Personal (Id, Cedula, Id_Tel) VALUES(7, 7, 2)
~~~
Para insertar valores de una consulta de otra tabla en una tabla nueva con INTO, pero si la tabla existe no nos dejará. Solo sirve para crear una nueva tabla.
Ejemplo:
~~~
SELECT
	*
INTO TableEjemplo
FROM
	Person.Person AS a
WHERE
	a.EmailPromotion = 1
~~~
En el siguiente ejemplo, siempre inserta los valores:
~~~
INSERT INTO TableEjemplo
SELECT
	*
FROM
	Person.Person AS a
WHERE
	a.EmailPromotion = 1
~~~
Si añadiesemos delante truncate table, vaciariamos primero la tabla y la añadiriamos de nuevo:
~~~
TRUNCATE TABLE TableEjemplo
INSERT INTO TableEjemplo
SELECT
	*
FROM
	Person.Person AS a
WHERE
	a.EmailPromotion = 1
~~~
## Sección 12 video 2

MERGE
Merge se utiliza para insertar datos en una tabla, actualizar o eliminar. Si quieres insertar valores de una tabla a otra pero existen esos valores en ambas tablas, los obvia de tal manera que no se creen valores duplicados. Al final de la expresión tiene que llevar un ; para evitar errores.
Ejemplo de creación de tablas para hacer el merge:
~~~
SELECT
	CONCAT_WS(' ', b.FirstName, b.MiddleName, b.LastName) AS Nombre
	, a.NationalIDNumber
	, a.BirthDate
	, a.HireDate
INTO ##baseEmleados
FROM
	HumanResources.Employee AS a
	INNER JOIN Person.Person AS b
		ON a.BusinessEntityID = b.BusinessEntityID
WHERE
	a.HireDate BETWEEN '2008-01-01' AND '2008-06-30'
ORDER BY
	a.HireDate
~~~
Ahora creamos una segunda tabla:
~~~
SELECT
	*
INTO #base2
FROM
	##baseEmleados AS a
~~~
Y por último aplicamos un MERGE, indicando primero la tabla destino, y con USING indicamos la tabla de origen. Hay que tener en cuenta que las tablas tienen que existir. Con ON indicamos en que columna va a fijarse para hacer el merge, y hay que indicarle cuando no encuentre coincidencias que hacer:
~~~
MERGE #Base1 AS a
USING #base2 AS b
	ON a.NationalIdNumber = b.NationalIdNumber
WHEN NOT MATCHED THEN
	INSERT VALUES (b.Nombre, b.NationalIdNumber, b.BirthDate, b.HireDate);
~~~
Si se ejecuta varias veces, coinciden registros y no va a insertar nada nuevo.

## Sección 12 video 3

BULK INSERT
Sirve para importar un .txt o .csv a una tabla. La tabla hay que crearla con las mismas columnas que trae el archivo. Si no se define bien la tabla, la importación puede ser completa en VARCHAR y no se puede operar con algunos datos después.
~~~
CREATE TABLE #Tabla_EjercicioBulk (Id_Cliente INT, Nom_Cliente VARCHAR(100), Fecha_Nac DATE, Sexo VARCHAR(50), Meses_En_Empresa FLOAT)
~~~
El Bulk insert primero se indica destino, luego la ruta del archivo. El WITH es una palabra reservada para indicar como quieres hacer el bulk, en este caso le vamos a indicar FIRSTROW=2 para indicarle que la importación tiene que realizarla desde la segunda fila evitando la primera que son los encabezados del archivo [Syntax From Microsoft](https://learn.microsoft.com/en-us/sql/t-sql/statements/bulk-insert-transact-sql?view=sql-server-ver16):
~~~
SET DATEFORMAT dmy

BULK INSERT
	#Tabla_EjercicioBulk
FROM
	'D:\EjercicioBulk.txt'
WITH
	(FIRSTROW=2)
~~~
## Sección 13 video 1

UPDATE
Se utiliza para actualizar valores existentes en una tabla. En el ejemplo se van a actualizar los datos de la columna PersonType que tengan el BusinessEntityID igual a 2, 701, 1699.
Ejemplo:
~~~
UPDATE TableEjemplo SET PersonType = 'SP' WHERE BusinessEntityID IN (2, 701, 1699)
~~~
La consulta de comprobación sería:
~~~
SELECT
	*
FROM
	TableEjemplo AS a
WHERE
	a.BusinessEntityID IN (2, 701, 1699) -- Se indica así para localizar los valores 2, 701, 1699
~~~
Es buena práctica comprobar lo que se quiere actualizar, previamente haciendo una selección.

## Sección 13 video 2

SUBCONSULTAS
Son consultas dentro de otras consultas. Estas consultas pueden realizarse dentro de un WHERE, UPDATE, DELETE. Solo podras utilizar ORDER BY en un subquery si va acompañado de la palabra TOP, de lo contrario nos dará un error.
Ejemplo, tenemos una elección dentro del FROM:
~~~
SELECT
	*
FROM
(
	SELECT
		a.BusinessEntityID
		, a.FirstName
		, a.MiddleName
		, a.LastName
	FROM
		Person.Person AS a
	WHERE
		a.PersonType = 'EM'
) AS a
~~~
En el siguiente ejemplo, filtramos con una subconsulta de otra tabla que coincidan los BusinesEntityID:
~~~
SELECT
	*
FROM
	Person.Person AS a
WHERE
		a.BusinessEntityID IN (
			SELECT 
				BusinessEntityID
			FROM
				sales.SalesPerson
		)
~~~
## Sección 13 video 3

ROW_NUMBER() - FIRST_VALUE()
Nos permiten realizar particiones y ordenamientos sobre un consulto de filas.
En el ejemplo estamos creando una selección en una columna nombre con una serie de nombres. Con row number estamos indicando como tiene que numerar en una fila contador el número de veces que se repiten los nombres:
~~~
SELECT
	ROW_NUMBER () OVER (PARTITION BY a.nombre ORDER BY a.nombre) AS Contador
	, a.nombre
FROM
	(
		SELECT 'JAVI' AS nombre
		UNION ALL
		SELECT 'JAVI' AS nombre
		UNION ALL
		SELECT 'JAVI' AS nombre
		UNION ALL
		SELECT 'ALEX' AS nombre
		UNION ALL
		SELECT 'ALEX' AS nombre
	) AS a
~~~
En el siguiente ejemplo se busca el mayor BusinesEntitID con la mayor venta del año pasado:
~~~
SELECT
	*
FROM
(
	SELECT
		ROW_NUMBER () OVER (ORDER BY a.SalesYTD DESC) AS contador
		,a.BusinessEntityID
		, a.SalesYTD
	FROM
		Sales.SalesPerson AS a
) AS a
WHERE
	a.contador = 1
~~~
En el siguiente ejemplo se realiza lo mismo pero con el FIRST_VALUE() que retorna el primer valor de un conjunto de valores ordenados:
~~~
SELECT
	a.BusinessEntityID
	, a.SalesYTD
FROM
	Sales.SalesPerson AS a
WHERE
	a.BusinessEntityID = 
	(
		SELECT DISTINCT
			FIRST_VALUE (a.BusinessEntityID) OVER (ORDER BY a.SalesYTD DESC) AS contador
		FROM
			Sales.SalesPerson AS a
	)
~~~
## Sección 14 video 1

SCHEMA
Es una especie de contenedor con nombres de objetos de datos. SQL tiene 10 esquemas predefinidos, que pueden ser usados para darle seguridad a la base de datos, es decir dar acceso a usuarios a según que esquema. Para ver los esquemas que existen en la base de datos, incluidos los predefinidos:
~~~
SELECT
	*
FROM
	sys.schemas
~~~
Si creamos una tabla sin indicar a que esquema, no la crea en el dbo.:
~~~
CREATE TABLE Prueba1 (ID INT)
~~~
Si queremos añadirla a un esquema especifico:
~~~
CREATE TABLE Person.Prueba1 (ID INT)
~~~
Si queremos modificar el esquema de una tabla "Prueba1" que se encuentra en la dbo al esquema "Production":
~~~
ALTER SCHEMA Production TRANSFER Prueba1
~~~
## Sección 14 video 2

Creación de usuarios en MANAGEMENT STUDIO
Creamos un esquema para añadir un usuario por defecto y que sus tablas por defecto tengan ese esquema:
~~~
CREATE SCHEMA schema2
~~~
Para la creación del usuario ver el vídeo.

## Sección 14 video 3

Creación de usuarios en Transac-SQL
Ejemplo:
~~~
CREATE LOGIN UsuarioJavi WITH PASSWORD = 'Goitek2020.' -- Crea usuario en el servidor

USE AdventureWorks2017 --Marcamos la base de datos sobre la que vamos a asignar permisos

CREATE USER UsuarioJavi FOR LOGIN UsuarioJavi WITH DEFAULT_SCHEMA = shema2 -- Añadimos el usuario a la base de datos y un schema

GRANT SELECT ON [HumanResources].[Department] TO UsuarioJavi -- Le damos permiso a ver solo una tabla

GRANT CONTROL ON SCHEMA :: shema2 TO UsuarioJavi -- Permiso de control de Schema

GRANT CREATE TABLE TO UsuarioJavi -- Pernisos de creación de tabla

GRANT DELETE ON [HumanResources].[Department] TO UsuarioJavi -- Permisos para usar delete sobre [HumanResources].[Department]

REVOKE SELECT ON [HumanResources].[Department] TO UsuarioJavi -- Elimina permisos de selección sobre [HumanResources].[Department]
~~~

