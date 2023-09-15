# Apuntes curso SQL Sección 9 10 11

## Sección 9 video 1

AND, OR
Ejemplo AND:
~~~
SELECT
	*
FROM
	Production.Product AS a
WHERE
	a.Color = 'Black' AND a.Size = '58' AND a.StandardCost < 350
~~~
Ejemplo OR:
~~~
SELECT
	*
FROM
	Production.Product AS a
WHERE
	(a.Color = 'Grey' OR a.Color = 'Red') AND a.MakeFlag = 1
~~~
## Sección 9 video 2

BETWEEN
Ejemplo:
~~~
SELECT
	*
FROM
	Production.Product AS a
WHERE
	(a.ReorderPoint BETWEEN 300 AND 500) AND
	CAST(a.SellStartDate AS DATE) BETWEEN '2008-04-30' AND '2012-12-31'
~~~
## Sección 9 video 3

LIKE, NOT

LIKE sirve para una comparación de que una cadena de caracteres sea igual a otra.
### Cuando se indica '% %' se indica que contenga la cadena lo que haya entre los %
El NOT niega las condiciones que le pongamos.

Ejemplos:
~~~
SELECT
	*
FROM
	Person.Person AS a
WHERE
	a.FirstName LIKE 'Terri'
--------------
SELECT
	*
FROM
	Production.Product AS b
WHERE
	b.Name LIKE '%Hex Nut%'
---------------
SELECT
	*
FROM
	Production.Product AS c
WHERE
	c.Name LiKE 'HEX NuT%'
---------------
SELECT
	*
FROM
	Production.Product AS d
WHERE
	d.Name LIKE '%_ace' --Compara palabras que empiecen de cualquier manera pero acabe en ace

SELECT
	*
FROM(
	SELECT 'Race' AS Nombre
	UNION ALL
	SELECT 'Gace' AS Nombre
	UNION ALL
	SELECT 'Gase' AS Nombre) AS a
WHERE
	a.Nombre LIKE '%_ace'
---------------------
SELECT
	*
FROM(
	SELECT 'Race' AS Nombre
	UNION ALL
	SELECT 'Gace' AS Nombre
	UNION ALL
	SELECT 'Gase' AS Nombre) AS a
WHERE
	a.Nombre NOT LIKE '[R_G]ace' -- Los corchetes sirve para las palabras que empiecen por R o G y acaben en ace
~~~
## Sección 10 video 1

Create table (Tablas fisicas)
Si creamos una tabla apuntando a una base de datos, esa tabla va a quedar registrada en la base de datos.

-- Se crea una tabla que hay que indicar la primary key.
~~~
CREATE TABLE Tabla_Telefono (Id_Tel INT PRIMARY KEY, Numero INT NULL)
~~~
/* Esta tabla crea una tabla en la que el primer dato hay que indicar la primary key, se indican los nombres de las columnas y el tipo de dato,
para crear una relación entre tablas: se indica el mismo nombre de la columna, el tipo de dato, que es clave foranea a la tabla que va a apuntar y la columna. */
CREATE TABLE Tabla_Personal (Id INT PRIMARY KEY, Nombre VARCHAR(100), DNI INT NOT NULL, Id_Tel INT FOREIGN KEY REFERENCES Tabla_Telefono(Id_Tel))

## Sección 10 video 2

CREATE TABLE LOCAL - GLOBAL
Las tablas temporales se crean pero se eliminan despues de su utilización con lo cual liberan memoria. Estas tablas se almacenan en las TEMPDB. Estas tablas no se pueden indexar. Las tablas globales se pueden trabajar en varias instancias, mientras que la local solo en la instancia actual. Para la creación tiene la misma estructura que las anteriores, pero en la creación antes del nombre se le coloca una #. Con una # es local y si se colocan ## es para global.

Ejemplos:
~~~
CREATE TABLE #Tabla_Telefono (Id_Tel INT PRIMARY KEY, Numero INT NULL)
CREATE TABLE ##Tabla_Personal (Id INT PRIMARY KEY, Nombre VARCHAR(100), DNI INT NOT NULL, Id_Tel INT FOREIGN KEY REFERENCES Tabla_Telefono(Id_Tel))

SELECT
	*
FROM
	##Tabla_Personal
~~~
-----------------

En este ejemplo estamos buscando las tablas dentro de la tempdb
~~~
SELECT
	*
FROM
	tempdb.sys.objects AS a
WHERE
	a.name LIKE '%Tabla_Telefono%' OR a.name LIKE '%Tabla_Personal'
~~~

##  Sección 11 video 1

DROP TABLE
Sirve para eliminar una tabla, pero DROP se puede usar para eliminar bases de datos, vistas, indices, procedimientos... Sirve también para eliminar tablas temporales locales y globales solo añadiendo la # para local o ## para global

Con este ejemplo elimina la tabla y si actualizas el explorer desaparece, ejmplo:
~~~
DROP TABLE [dbo].[Tabla_Telefono]
~~~

## Sección 11 video 2

TRUNCATE TABLE
Sirve para vaciar todo el contenido de la tabla incluyendo los indices, de tal manera que solo respeta las columnas. Si intentas truncar una tabla que esta referenciada por otra tabla te va a dar un error de que se está usando en otra tabla, sin embargo si eliminas la primera, ya puedes eliminar la segunda.

Para el ejemplo en sources hay un Query de creación de tablas, ejemplo:
~~~
TRUNCATE TABLE Table_Personal
~~~

## Sección 11 video 3

DELETE TABLE
Nos permite eliminar 1 o más filas de una tabla. Si se usa sin usar ninguna condición funciona igual que el TRUNCATE. En el DELETE no se pueden dejar alias.
Ejemplo de eliminación de una fila:
~~~
DELETE
FROM 
	Table_Personal
WHERE
	Id_Tel = 2
~~~
