# Funciones SQL

## El orden de ejecución de un Query es:
__Apuntes SQL 3-4-5__

-   1 FROM
-   2 ON
-   3 JOIN
-   4 WHERE
-   5 GROUP BY
-   6 WITH
-   7 HAVING
-   8 SELECT
-   9 DISTINCT
-   10 ORDER BY
-   11 TOP

## Selección de objetos:    
__Apuntes SQL 3-4-5__

-   __SELECT__
    -   Es una instrucción utilizada para recuperar datos de una base de datos, permitiendo especificar qué columnas y filas se desean obtener.
-   __WHERE__
    -   Es una cláusula utilizada para filtrar registros en una consulta, permitiendo establecer condiciones que deben cumplir las filas seleccionadas.
-   __GROUP BY__
    -   Se utiliza para agrupar filas en un conjunto de resultados basado en los valores de una o más columnas, lo que permite realizar operaciones de agregación como SUM, COUNT, AVG, etc., en grupos de filas relacionadas.
-   __HAVING__
    -   Es una cláusula que se utiliza junto con GROUP BY para filtrar grupos de filas resultantes de una consulta basada en condiciones específicas que se aplican a las funciones de agregación, como SUM, COUNT, AVG, etc., en lugar de a las filas individuales.
-   __ORDER BY__
    -   Se utiliza para ordenar los resultados de una consulta en función de una o más columnas en orden ascendente (ASC) o descendente (DESC).
-   __TOP__
    -   Es una cláusula que limita el número de filas devueltas por una consulta.
-   __DISTINCT__
    -   Es una cláusula que se utiliza para eliminar duplicados de los resultados de una consulta.

## Unión de tablas:         
__Apuntes SQL 3-4-5__

[Tipos de Join's](https://ingenieriadesoftware.es/tipos-sql-join-guia-referencia/)

-   __INNER JOIN__
    -    Combina registros de dos o más tablas basándose en una condición especificada, mostrando solo los registros que tienen coincidencias en ambas tablas.
-   __LEFT JOIN__
    -   Combina registros de dos o más tablas basándose en una condición especificada y muestra todos los registros de la tabla izquierda, incluyendo aquellos que no tienen coincidencias en la tabla derecha.
-   __RIGHT JOIN__
    -   Combina registros de dos o más tablas basándose en una condición especificada y muestra todos los registros de la tabla derecha, incluyendo aquellos que no tienen coincidencias en la tabla izquierda.
-   __FULL JOIN__
    -   Combina registros de dos o más tablas basándose en una condición especificada y muestra todos los registros de ambas tablas, incluyendo aquellos que no tienen coincidencias en la otra tabla.

## Funciones agregación:     
__Apuntes SQL 3-4-5__

-   __SUM()__
    -   Es una función de agregación que suma los valores de una columna numérica en un conjunto de resultados, proporcionando un valor total.
-   __COUNT()__
    -   Es una función de agregación que cuenta el número de filas o elementos en un conjunto de resultados, brindando el total de elementos.
-   __AVG()__
    -   Es una función de agregación que calcula el promedio de valores numéricos en una columna de un conjunto de resultados.
-   __MAX()__
    -   Es una función de agregación que encuentra el valor máximo en una columna de un conjunto de resultados, devolviendo el valor más alto.
-   __MIN()__
    -   Es una función de agregación que devuelve el valor mínimo (el más pequeño) de una columna en un conjunto de resultados.

## Funciones de conversión          
__Apuntes SQL 6-7-8__

-   __CAST()__
    -   Se utiliza para convertir un valor de un tipo de dato a otro tipo de dato específico en una consulta, permitiendo realizar operaciones con tipos de datos diferentes.
-   __CONVERT()__
    -   Se utiliza para cambiar el tipo de datos de una expresión o valor a otro tipo de datos específico en una consulta.
-   __PARSE()__
    -   Se utiliza para convertir una cadena de texto en un tipo de dato específico, como fecha o número, de acuerdo con un formato definido.

## Funciones de Fecha y Hora        
__Apuntes SQL 6-7-8__

-   __GETDATE()__
    -   Es una función que devuelve la fecha y hora actuales del sistema en el formato de fecha y hora de la base de datos.
-   __DATEADD()__
    -   Es una función que permite agregar o restar una cantidad específica de tiempo a una fecha, devolviendo una nueva fecha calculada.
-   __DATENAME()__
    -   Se utiliza para extraer el nombre de un componente de fecha, como el día de la semana o el mes, a partir de una fecha dada en un conjunto de resultados.
-   __DATEPART()__
    -   Es una función que extrae una parte específica (como año, mes, día, etc.) de una fecha o marca de tiempo en una columna de un conjunto de resultados.
-  __DAY()__
    -   Es una función que extrae el día de una fecha, devolviendo un valor numérico entre 1 y 31, según el día de la fecha especificada.
-   __MONTH()__
    -   Es una función que extrae el número de mes (1 al 12) a partir de una fecha, permitiendo analizar y agrupar datos por mes en consultas.
-   __YEAR()__
    -   Es una función que extrae el año de una fecha, permitiendo obtener la parte de año de una columna de fecha o una fecha específica en una base de datos.

## Funciones cadenas de carácteres  
__Apuntes SQL 6-7-8__

-   CONCAT()
-   CONCAT_WS()
-   LEN()
-   LEFT()
-   RIGHT()
-   LTRIM()
-   RTRIM()
-   REPLACE()
-   STUFF()

## Operadores lógicos                   
__Apuntes SQL 9-10-11__

-   AND
-   OR
-   BETWEEN
-   LIKE
-   NOT

## Creación de objetos tipo tabla       
__Apuntes SQL 9-10-11__

-   CREATE TABLE
-   CREATE TABLE LOCAL
-   CREATE TABLE GLOBAL

## Eliminación de objetos tipo tabla    
__Apuntes SQL 9-10-11__

-   DROP TABLE
-   TRUNCATE TABLE
-   DELETE TABLE

## Insersión de información             
__Apuntes SQL 12-13-14__

-   INSERT INTO
-   MERGE
-   BULK INSERT

## Declaraciones generales              
__Apuntes SQL 12-13-14__

-   UPDATE
-   SUBCONSULTAS
-   ROW_NUMBER()
-   FIRST_VALUE()

## Creación de usuarios                 
__Apuntes SQL 12-13-14__

-   SCHEMA
-   Creación de usuario Transac-SQL

## Creación de objetos tipo vista
__Apuntes SQL 15-16-17__

-   VIEW
-   Parámetros
-   CREATE PROCEDURE solicitando parámetros
-   CREATE PROCEDURE sin solicitar parámetros
-   CREATE PROCEDURE (SET NOCOUNT ON)

## Uso de transacciones
__Apuntes SQL 15-16-17__

-   WITH NOLOCK
-   TRANSACTION
-   Ejemplo TRANSACTION
