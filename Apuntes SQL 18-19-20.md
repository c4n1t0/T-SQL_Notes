# Apuntes curso SQL Sección 18 19 20

## Sección 18

Es un curso anterior y es un repaso de lo aprendido.

### Video 8

Sintaxis de modificación de tablas:

-   ALTER TABLE table_name
    ADD column_name dataype;
-   ALTER TABLE table_name
    DROP COLUMN column_name;
-   ALTER TABLE table_name
    ALTER COLUMN column_name datatype;

## Sección 20

Es un curso anterior donde volvemos a ver todo lo visto hasta ahora.

### Video 5

En los WHERE por ejemplo, se puede usar IN () y dentro puedes indicarle varios valores que coincidan y te los filtra. Ejemplo:
~~~
SELECT
	*
FROM
	[dbo].[BaseClientes]
WHERE
	CodigoCiudad IN (12, 13, 25)
~~~


### Video 14

FULL JOIN sirve para traer todos los campos de ambas tablas y los que no existen en una los rellena con NULL.

### Video 15, 16 y 17

TRIGGERS son usados para que cuando realices cierta acción sobre la tabla que le indiques, por ejemplo insertar información, el trigger saltará con las acciones programadas. Es decir por ejemplo mandar a la consola que se ha introducido información.