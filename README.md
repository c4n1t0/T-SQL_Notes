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

-   __CONCAT()__
    -   Es una función utilizada para combinar cadenas de texto en una sola cadena. Por ejemplo, CONCAT('Hola, ', 'mundo') devuelve "Hola, mundo".
-   __CONCAT_WS()__
    -   Es una función que concatena valores de columna o cadenas de texto con un separador especificado, excluyendo automáticamente valores NULL.
-   __LEN()__
    -   Es una función que devuelve la longitud (cantidad de caracteres) de una cadena de texto. Se utiliza para medir la longitud de cadenas, incluyendo texto en columnas de una tabla.
-   __LEFT()__
    -   Se utiliza para extraer una cantidad específica de caracteres desde el principio de una cadena de texto. Por ejemplo, LEFT('Ejemplo', 3) devolverá 'Eje'.
-   __RIGHT()__
    -   Se utiliza para extraer una cantidad específica de caracteres desde el extremo derecho de una cadena de texto.
-   __LTRIM()__
    -   Es una función que elimina espacios en blanco iniciales (izquierda) de una cadena de texto.
-   __RTRIM()__
    -   Es una función que elimina espacios en blanco y caracteres de relleno desde el lado derecho (final) de una cadena de texto.
-   __REPLACE()__
    -   Se utiliza para reemplazar todas las ocurrencias de un texto específico dentro de una cadena con otro texto dado.
-   __STUFF()__
    -   Se utiliza para reemplazar una parte de una cadena con otra. Es útil para modificar datos en una columna de texto.

## Operadores lógicos                   
__Apuntes SQL 9-10-11__

-   __AND__
    -    Sirve para combinar condiciones en una consulta, devolviendo resultados que cumplen con ambas condiciones simultáneamente. También se utiliza en lógica para denotar una conjunción entre dos afirmaciones o condiciones.
-   __OR__
    -   Permite seleccionar registros que cumplan al menos una de varias condiciones en una consulta SQL. Se utiliza para filtrar datos de manera inclusiva.
-   __BETWEEN__
    -   Es un operador utilizado para seleccionar filas en un rango de valores, inclusivo en ambos extremos, en función de una condición de comparación. Por ejemplo, columna BETWEEN valor1 AND valor2 selecciona filas donde "columna" se encuentra dentro del rango de "valor1" y "valor2".
-   __LIKE__
    -   Es un operador en SQL utilizado para buscar patrones en texto, donde '%' representa cero o más caracteres y '_' representa un único carácter.
-   __NOT__
    -   Es un operador lógico utilizado para negar una condición o expresión booleana.

## Creación de objetos tipo tabla       
__Apuntes SQL 9-10-11__

-   __CREATE TABLE__
    -   Se utiliza para crear una nueva tabla en una base de datos, especificando la estructura de columnas y sus tipos de datos.
-   __CREATE TABLE LOCAL__
    -   Una tabla local en SQL Server es una tabla temporal definida en el ámbito de una conexión o sesión y se utiliza para almacenar datos temporalmente durante la ejecución de un procedimiento o consulta.
-   __CREATE TABLE GLOBAL__
    -   Una tabla global en SQL Server es una tabla temporal que puede ser accedida por múltiples sesiones de usuario durante toda la duración de su conexión. Se utiliza para compartir datos entre sesiones en un entorno multiusuario.

## Eliminación de objetos tipo tabla    
__Apuntes SQL 9-10-11__

-   __DROP TABLE__
    -   Es una sentencia utilizada para eliminar una tabla de una base de datos en SQL Server. La eliminación de una tabla también elimina todos sus datos y estructura de la base de datos.
-   __TRUNCATE TABLE__
    -   Elimina todos los registros de una tabla sin registrar las eliminaciones individuales y es más rápido que DELETE.
-   __DELETE TABLE__
    -   DELETE elimina filas de una tabla en SQL; puedes especificar condiciones para eliminar filas específicas o eliminar todas las filas sin condiciones.

## Insersión de información             
__Apuntes SQL 12-13-14__

-   __INSERT INTO__
    -   Se utiliza para agregar datos a una tabla existente. Puedes insertar filas con valores específicos o seleccionar datos de otra fuente y agregarlos a la tabla.
-   __MERGE__
    -   Es una declaración que combina operaciones INSERT, UPDATE y DELETE en una sola sentencia, permitiendo actualizar o insertar registros en una tabla de destino según una condición. Se utiliza para sincronizar datos entre dos tablas o actualizar registros existentes y agregar nuevos registros si no existen.
-   __BULK INSERT__
    -   Es un comando que permite la carga masiva de datos desde un archivo externo a una tabla en una base de datos SQL Server. Se utiliza para insertar grandes cantidades de datos de manera eficiente.

## Declaraciones generales              
__Apuntes SQL 12-13-14__

-   __UPDATE__
    -   Se utiliza para modificar los registros existentes en una tabla según una condición especificada.
-   __SUBCONSULTAS__
    -   Son consultas SQL anidadas dentro de otras consultas, utilizadas para obtener datos específicos o realizar operaciones dentro de un contexto más amplio. Ayudan a simplificar y organizar consultas complejas.
-   __ROW_NUMBER()__
    -   Es una función analítica que asigna un número secuencial a cada fila en un conjunto de resultados basado en una ordenación específica. Se utiliza comúnmente para enumerar filas en consultas y para realizar paginación.
-   __FIRST_VALUE()__
    -   Es una función de ventana que devuelve el valor de la primera fila en un conjunto de resultados ordenado según una columna específica. Se utiliza comúnmente para acceder al primer valor en un grupo de filas.

## Creación de usuarios                 
__Apuntes SQL 12-13-14__

-   __SCHEMA__
    -   Un "schema" es una estructura organizativa que define la relación y disposición de las tablas, vistas y otros objetos dentro de una base de datos. También se utiliza para establecer permisos y separar diferentes conjuntos de datos.
-   __Creación de usuario Transac-SQL__
    -   Crear usuarios a la base de datos metiante Query, y especificando sus permisos.

## Creación de objetos tipo vista
__Apuntes SQL 15-16-17__

-   __VIEW__
    -   Una vista en SQL es una consulta almacenada que se comporta como una tabla virtual, permitiendo a los usuarios consultar datos complejos sin acceder directamente a las tablas subyacentes.
-   __Parámetros__
    -   Los parámetros son valores que se pasan a una función o procedimiento para su procesamiento en programación. Ayudan a personalizar y controlar la ejecución de código.
-   __CREATE PROCEDURE solicitando parámetros__
    -   Crea un nuevo procedimiento almacenado que puede aceptar parámetros como entrada para realizar operaciones en la base de datos.
-   __CREATE PROCEDURE sin solicitar parámetros__
    -   Puedes crear un procedimiento sin solicitar parámetros utilizando CREATE PROCEDURE NombreDelProcedimiento AS para definir la lógica del procedimiento sin parámetros requeridos.
-   __CREATE PROCEDURE (SET NOCOUNT ON)__
    -   "SET NOCOUNT ON" se utiliza para deshabilitar los mensajes que informan el número de filas afectadas por las instrucciones SQL dentro del procedimiento.

## Uso de transacciones
__Apuntes SQL 15-16-17__

-   __WITH NOLOCK__
    -   La cláusula WITH NOLOCK permite lecturas no bloqueantes en SQL, lo que significa que las consultas pueden acceder a los datos sin esperar a que otros procesos de escritura terminen, pero puede resultar en lecturas no consistentes en entornos concurrentes.
-   __TRANSACTION__
    -   Una transacción en SQL es un grupo de operaciones de bases de datos que se ejecutan de manera indivisible y garantizan la integridad de los datos, permitiendo confirmar o deshacer las operaciones en caso de error.
