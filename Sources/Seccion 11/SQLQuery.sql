USE AdventureWorks2017

CREATE TABLE Table_Telefono (Id_Tel	INT PRIMARY KEY, Nombre VARCHAR(100))
CREATE TABLE Table_Personal (Id INT PRIMARY KEY, Nombre VARCHAR(100), Cedula INT NOT NULL, Id_Tel INT FOREIGN KEY REFERENCES Table_Telefono (Id_Tel))

INSERT INTO [dbo].[Table_Telefono] VALUES (1, 'Celular')
INSERT INTO [dbo].[Table_Telefono] VALUES (2, 'Casa')
INSERT INTO [dbo].[Table_Telefono] VALUES (3, 'Oficina')

INSERT INTO [dbo].[Table_Personal] VALUES (1, 'Alex', 123 , 1)
INSERT INTO [dbo].[Table_Personal] VALUES (2, 'Diana', 124 , 2)
INSERT INTO [dbo].[Table_Personal] VALUES (3, 'Cristian', 125 , 3)