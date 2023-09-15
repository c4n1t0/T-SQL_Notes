# Apuntes curso SQL Sección 15 16 17

## Sección 15 video 1

VIEW
Es una tabla virtual generada a partir de una consulta. Las características de las vistas es que pueden ser indexadas, además su número máximo de columnas es 1024. Las vistas sirven para dar seguridad sobre la base de datos ya que con un usuario limitado solo a vistas, no podría tocar las fuentes originales de la base de datos. En caso de eliminar una vista tan solo tendríamos que regenerarla.

En el ejemplo vamos a hacer una consulta a una tabla:
~~~
SELECT
	*
FROM
	Sales.SalesPerson AS a
WHERE
	a.Bonus = 0
~~~
Nos muestra el valor de 3 líneas. Ahora vamos a crear una vista con esa consulta:
~~~
CREATE VIEW vw_SalesPerson AS

SELECT
	*
FROM
	Sales.SalesPerson AS a
WHERE
	a.Bonus = 0
~~~
Si haces la consulta de una vista creada, seria:
~~~
SELECT
	*
FROM
	vw_SalesPerson
~~~
Si queremos modificar la VIEW, vamos a la base de datos / vamos a vistas / buscamos la vista y hacemos click derecho, script view as, alter to, new Query. Nos mostrará algo así:
~~~
USE [AdventureWorks2017]
GO

/****** Object:  View [dbo].[vw_SalesPerson]    Script Date: 23/08/2023 12:30:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[vw_SalesPerson] AS

SELECT 
	*
FROM
	Sales.SalesPerson AS a
WHERE
	a.Bonus = 0
GO
~~~
Ya podríamos modificar y actualizar la vista.

## Sección 15 video 2

PARAMETROS
Son datos que se intercambian entre funciones y procedimientos almacenados, además de poder usarlos en consultas y demás...

Si se hace una conslta como esta:
~~~
SELECT
	*
FROM
	sys.all_parameters
~~~
Podremos ver todos los parámetros usados por funciones y procedimientos almacenados.

Si quieres consultar un parametro si se esta usando en una función o un procedimiento almacenad:
~~~
SELECT
	*
FROM
	sys.all_objects
WHERE
	object_id = 759673754   -- Ese es el ID del parametro.
~~~
Para filtrar por la columna nombre que no esté vacía:
~~~
SELECT
	*
FROM
	sys.all_parameters
WHERE
	name <> '' --Sirve para filtrar por la columna nombre no e´sté vacía
~~~
En el siguiente ejemplo filtramos los por la columna "name" que no esté vacía y además el type sea un procedimiento almacenado:
~~~
SELECT
	*
FROM
	sys.all_objects
WHERE
	object_id IN 
	(
		SELECT DISTINCT 
			object_id
		FROM
			sys.all_parameters
		WHERE
			name <> '' AND type_desc LIKE '%STORED%'
	)
~~~
Si hacemos una consulta al id del procedimiento como en el siguiente ejemplo, averiguaremos cuantos parámetros tiene el procedimiento buscado:
~~~
SELECT
	*
FROM
	sys.all_parameters
WHERE
	object_id = -1073624922
~~~
Ahora vamos a crear un parámetro y modificarlo:
~~~
DECLARE @Parametro1 INT = 1
PRINT 'El valor original es: '
PRINT @Parametro1

-- Para modificar el parámetro

SET @Parametro1 = 2
PRINT 'Hemos modificado su valor y ahora es: '
PRINT @Parametro1
~~~
Ejemplo de uso en una consulta:
~~~
DECLARE @Parametro1 INT = 1

SELECT
	*
FROM
	Person.PersonPhone AS a
WHERE
	a.PhoneNumberTypeID = @Parametro1
~~~
## Sección 15 video 3

CREATE PROCEDURE (solicitando parámetros)
> Un procedimiento almacenado es un conjunto de instrucciones SQL que se guarda y administra en una base de datos como una entidad única. Estas instrucciones se ejecutan juntas como una unidad lógica y predefinida en el servidor de la base de datos. Los procedimientos almacenados son parte fundamental de la funcionalidad de programación en bases de datos y se utilizan para realizar operaciones específicas y repetitivas en los datos de la base de datos.

No tienen un máximo de líneas, aunque hay que tener buenas prácticas para evitar la sobrecarga sobre la base de datos. Es recomendable no hacer un SELECT *, y hacer del uso del "SET NO COUNT". Ejemplo:
~~~
SELECT
	a.BusinessEntityID
	, a.NationalIDNumber
	, a.LoginID
	, a.JobTitle
	, a.MaritalStatus
FROM
	HumanResources.Employee AS a
WHERE
	MaritalStatus = 's'
~~~
Si queremos usar esa consulta muchas veces, nos la llevamos a un procedimiento almacenado, nos vamos a la base de datos/programability/store procedure/click derecho y new:
~~~
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Javier Romero Moreno
-- Create date: 24/08/2023
-- Description:	<Filtra por marital>
-- =============================================
ALTER PROCEDURE sp_Employee

@Marital VARCHAR(10)

AS
BEGIN
	SELECT
		a.BusinessEntityID
		, a.NationalIDNumber
		, a.LoginID
		, a.JobTitle
		, a.MaritalStatus
	FROM
		HumanResources.Employee AS a
	WHERE
		MaritalStatus = @Marital
END
GO
~~~
Con ese procedimiento almacenado, le pasamos lo que queremos buscar en la columna Marital, M o S:
~~~
EXEC sp_Employee 'S'
~~~
## Sección 15 video 4

CREATE PROCEDURE (sin solicitar parámetros)
Vamos a crear un procedimiento almacenado sin pasarle parámetros, pero si que los contenga.
Partimos de la consulta:
~~~
SELECT
	*
FROM
	HumanResources.Employee AS a
WHERE
	a.HireDate = '2009-01-14'
~~~
Hemos creado el siguiente procedimiento almacenado en el que la variable adquiere valor de una fecha actual, lo que quiere decir que no siempre es igual y no se le han pasado parámetros externos:
~~~
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Javier Romero Moreno>
-- Create date: <24/08/2023>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_Employee2

AS

DECLARE @Fecha DATE
SET @Fecha = CAST(GETDATE() AS DATE)

BEGIN
	SELECT
		*
	FROM
		HumanResources.Employee AS a
	WHERE
		a.HireDate = @Fecha
END
GO
~~~

## Sección 15 video 5

CREATE PROCEDURE (SET NO COUNT ON)
Sirve sobre todo para quitar mensaje que dentro de una función va devolviendo datos de consultas que no son relevantes para el resultado final y además evita relentizar la base de datos.

En el ejemplo se va a crear un procedimiento almacenado donde va a buscar valores entre 2 fechas que le pasemos como parámetro, metiendolos en una tabla y eliminandola previamente. Se le indica el SET NO COUNT ON para ayudar al performance para que no se relentice las consultas. Ejemplo:
~~~
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Javier Romero Moreno
-- Create date: 28/08/2023
-- Description:	Buscar contenido entre 2 fechas
-- =============================================
ALTER PROCEDURE sp_Employee3 

@Fecha1 DATE,
@Fecha2 DATE

AS

SET NOCOUNT ON

BEGIN
	
	TRUNCATE TABLE Employee_Borrar
	INSERT INTO Employee_Borrar

	SELECT
		BusinessEntityID,
		NationalIDNumber,
		LoginID,
		JobTitle,
		HireDate
	FROM
		HumanResources.Employee
	WHERE
		HireDate BETWEEN @Fecha1 AND @Fecha2

END
GO
~~~
La ejecución y consulta serían:
~~~
EXEC sp_Employee3 '2009-01-14' , '2009-01-30'

SELECT 
	*
FROM
	Employee_Borrar
~~~
## Sección 15 video 6

Indicaciones de simulacro 1. (Servidor propio en Azure)

Tengo que solicitar el acceso de Azure durante 12h. Enviar mensaje personal desde Udemy solicitando el usuario y la contraseña para el acceso Azure, y el simulacro a realizar, simulacro 1.

## Sección 16 video 1

WITH NOLOCK

Existen bloqueos dentro de las bases de datos mientras se hace un update por ejemplo, mientras se está realizando se bloquean para que no haya acceso a esa tabla mientras se está actualizando para evitar mostrar información erronea. Con WITH (NOLOCK) podemos saltar esos bloqueos.

Una de las ventajas que tiene es que ayuda en el performance de la base de datos, pero una desventaja es que podemos obtener información erronea de la base de datos.
~~~
SELECT
	*
FROM
	Person.Person WITH (NOLOCK)
~~~

## Sección 16 video 2

TRANSACTION

Las transacciones sirven para actualizar una tabla por ejemplo y poder revertirla con el uso de la transacción. Pero si hacemos una transacción con el estado RollBack se pueden revertir. Pero si la cierras por commit no se puede revertir.
Partimos del ejemplo:
~~~
CREATE TABLE Prueba_Transaccíon (ID INT)

INSERT INTO Prueba_Transaccíon VALUES (1)

SELECT
	*
FROM
	Prueba_Transaccíon
~~~
Si ejecutamos lo siguiente no podremos revertirlo:
~~~
UPDATE
	Prueba_Transaccíon
SET
	ID = 2
WHERE
	ID = 1
~~~
Entonces para poder revertirlo vamos a realizar una transacción:
~~~
BEGIN TRANSACTION

	UPDATE
		Prueba_Transaccíon
	SET
		ID = 2
	WHERE
		ID = 1

ROLLBACK TRANSACTION	-- Regresar al estado inicial
~~~
Mientras se está ejecutando la transacción con ROLLBACK si consultas la tabla desde otro Query por ejemplo, no podemos acceder a ella hasta que finalicemos la transacción. Para finalizar la transacción y quedar definitiva:
~~~
BEGIN TRANSACTION

	UPDATE
		Prueba_Transaccíon
	SET
		ID = 1
	WHERE
		ID = 2

--ROLLBACK TRANSACTION	-- Regresar al estado inicial
COMMIT TRANSACTION		-- Queda tal cual a no ser que tengamos un uso de commits anidados
~~~

## Sección 16 video 3

TRANSACTION (Ejemplo) usando tambien WITH NOLOCK

Partimos de esta consulta:
~~~
SELECT
	*
FROM
	Person.Person AS a
WHERE
	a.EmailPromotion = 1
~~~
Ahora vamos a hacer un update donde emailpromotion = 1, la columna title va a ser = 'nuevo':
~~~
BEGIN TRANSACTION

UPDATE
	Person.Person
SET
	Title = 'nuevo'
WHERE
	EmailPromotion = 1
~~~
Con esa transacción sin cerrar, la tabla queda en un estado inaccesible de momento salvo que se use WITH NOLOCK:
~~~
SELECT
	*
FROM
	Person.Person WITH (NOLOCK)
WHERE
	EmailPromotion = 1
~~~
Vamos a revertir la transacción ejecutando:
~~~
ROLLBACK TRANSACTION
~~~

## Sección 17 (Curso antiguo) 

### video 1

Estructuras de información de SQL:

-	DDL (Lenguaje de definición de datos)
	-	CREATE
	-	ALTER
	-	DROP
	-	TRUNCATE
-	DML	(Lenguaje de manipulación de datos)
	-	SELECT
	-	INSET
	-	UPDATE
	-	DELETE
-	DCL	(Lenguaje control de datos)
	-	GRANT
	-	REVOKE

### Video 2

Instalación de SQL Server 2014.

### Video 3

SQL Server Management Studio.
