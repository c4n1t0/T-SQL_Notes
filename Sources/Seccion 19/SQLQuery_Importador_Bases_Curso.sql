-- Sentencia para cambiar formato fecha de sql
Set dateformat dmy
-- Función que valida si la tabla existe, de ser asi elimina la tabla y la crea nuevamente, si la tabla no existe omite el drop y crea la tabla. 
If OBJECT_ID('tempdb..#TemporalClientes') is not null Drop Table #TemporalClientes
-- Creación de tabla temporal de clientes.
Create Table #TemporalClientes
(
     DocumentoCliente Varchar(1000)
	,NombreCliente Varchar(1000)
	,Sexo Varchar(1000)
	,FechaNac Varchar(1000)
	,CorreoCliente Varchar(1000)
	,DireccionCliente Varchar(1000)
	,CodigoCiudad Varchar(1000)
)

-- Sentencia de carga masiva desde txt o csv.
Bulk Insert #TemporalClientes
From 
	'C:\Curso Sql 1\BaseClientes.txt'
With
	(firstrow=2)

-- Limpiado de tabla Base Clientes.
-- IMPORTANTE: Quite el comentario de la linea truncate una vez creada la tabla Base Clientes, posterior a ello comentaree toda la sentencia de creación de tabla Base Clientes. 
-- Truncate Table BaseClientes 
-- Creación de tabla fisica Base Clientes. 

Create Table BaseClientes
(
	 DocumentoCliente int
	,NombreCliente Varchar(1000)
	,Sexo Varchar(1000)
	,FechaNac date
	,CorreoCliente Varchar(1000)
	,DireccionCliente Varchar(1000)
	,CodigoCiudad int
)
-- Inserción de información por medio de select a tabla Base Clientes.
Insert Into BaseClientes
Select 
	*
From #TemporalClientes


-----------------------------------------------------------------------------------------------------------------------------------------

Create Table BaseCiudades
(
	 CodigoCiudad int
	,NombreCiudad Varchar(1000)
	,NombreDepart Varchar(1000)
)


Bulk Insert BaseCiudades
From
	'C:\Curso Sql 1\BaseCiudades.txt'
With
	(firstrow = 2)

-----------------------------------------------------------------------------------------------------------------------------------------


Create Table BaseProductos
(
	 CodigoProducto Varchar(1000)
	,NombreProducto Varchar(1000)
	,PrecioProducto Float
)


Bulk Insert BaseProductos
From
	'C:\Curso Sql 1\BaseProductos.txt'
With
	(firstrow = 2)


-----------------------------------------------------------------------------------------------------------------------------------------
Set dateformat dmy

Create Table BasePedidos
(
	 CodigoPedido Varchar(1000)
	,DocumentoCliente Int
	,CodigoCiudad Int
	,CodigoProducto Varchar(1000)
	,CantidadProducto Int
	,FechaPedido Date
	,HoraPedido Time
)


Bulk Insert BasePedidos
From
	'C:\Curso Sql 1\BasePedidos.txt'
With
	(firstrow = 2)	

	
	



