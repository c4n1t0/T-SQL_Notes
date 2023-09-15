Todos los caminos conducen a roma (dicen por ahí), por ende, tu lógica será muy distinta a la de los demás e incluso que la mía, la idea es que llegues sin importar cómo y veras que poco a poco iremos puliendo los demás aspectos.

Puede que te encuentres con ciertas preguntas (simples) que no estén en la actualidad en el curso, pero de eso se trata de que indagues y generes recordación, de igual manera si vez que es importante o idóneo el incluirlo en el curso no dudes en escribirme y con gusto lo preparare.

IMPORTANTE:

Por favor adjunta el query (puedes copiarlo del management studio y pegarlo en la sección de respuestas o envió) desarrollado para la solución del punto acompañado de una imagen con la solución dada (toma un print de pantalla del query generado en el management studio).

Personalmente revisare las soluciones dadas evidenciando puntos de mejora y demás temas relevantes, dichas notas llegaran como mensaje personal.

**Talleres incompletos o sin imágenes no serán tenidos en cuenta para calificación individual**

NOTA: Encontraras un recurso descargable el cual es un word con información mas detallada del taller, mi recomendación es descargarlo.

Preguntas de esta tarea
Importante:

En los recursos encontraras un word en el cual encontraras información mas detallada del taller, mi recomendación es descargarlo.



Genere una consulta de la tabla [Person]. [Address] que permita visualizar la cantidad de ciudades (campo City), el campo que indica la cantidad debe tener el nombre CantidadCiudades, genere un ordenamiento de la ciudad que tenga mayor participación en la base a la menor.

Nota: Deberá aparecer la ciudad acompañado de la cantidad (2 campos en total).

Genere una consulta que permita obtener la edad en años de los empleados contenidos en la tabla [HumanResources]. [Employee], para el ejercicio anterior utilice el campo BirthDate. La consulta resultante solo debe tener los campos JobTitle y el nuevo campo llamado EdadEmpleado.

Realice una consulta de la tabla [Production].[Product] que cuente con las siguientes columnas: Name, ProductNumber, MakeFlag, Color, SellStartDate, SellEndDate. Una vez cuente con esta información realice lo siguiente:

a. El campo MakeFlag contiene unos y ceros, cambie estos valores de la siguiente manera, cuando sea 0 coloque “El producto se compra” y cuando sea 1 coloque “El producto se fabrica en la empresa”.

b. Cuando sea NULL el campo Color colocar “No Color” de lo contrario dejar el nombre del color con el que cuenta la tabla.

c. El campo SellStartDate cuenta con un tipo de dato DATETIME (YYYY-MM-DD HH:MM:SS), para el ejercicio convierta el campo tipo DATE (YYYY-MM-DD).

Genere una consulta que permita obtener el nombre de la persona seguido de su número telefónico. Para esta consulta utilice la tabla [Person]. [Person] y [Person]. [PersonPhone].

Mejore la consulta anterior uniendo el nombre del empleado en una sola columna, a esta nueva columna llámela Nombre.

Dificultad Intermedia – Alta:

Realice una consulta que permita obtener el nombre del producto seguido del nombre de la subcategoría asignando los nombres NomProduct y NomSubCate respectivamente (mantenga toda la estructura de la primera tabla para validar las no coincidencias), por último, ordene la consulta por el nombre de la subcategoría descendentemente. Para esta consulta utilice las tablas [Production]. [Product] y [Production]. [ProductSubcategory].

Dificultad Intermedia – Alta:

De la consulta resultante del punto 6 realice lo siguiente: Desarrolle un query que permita obtener las cantidades del campo NomSubCate, por favor coloque el campo NomSubCate y su respectiva cantidad (incluyendo los nulos), por último, ordene el campo cantidad de mayor a menor.

Dificultad Intermedia – Alta:

Realice un query que permita obtener las ventas totales del campo (SalesYTD) por personal, el query debe contener el FirstName y el nuevo campo (asignando el nombre de total). Para esta consulta utilice las tablas [Sales]. [SalesPerson] y [Person]. [Person].

Dificultad Intermedia – Alta:

Realce una consulta que permita obtener todas las personas cuya venta del campo (SalesLastYear) sea mayor al promedio, solo liste el campo FirstName y SalesLastYear. Para esta consulta utilice las tablas [Sales]. [SalesPerson] y [Person]. [Person].

Dificultad Intermedia – Alta:

Genere un query que permita saber cuál es el producto con mayor cantidad de inventario, el resultado final solo deberá mostrar el nombre del producto seguido de la cantidad (campo Quantity), tenga en cuenta que solo se desea tener una única fila (valor con mayor cantidad de inventario). Para esta consulta utilice las tablas [Production]. [Product] y [Production]. [ProductInventory].