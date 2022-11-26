CREATE DATABASE TestJoin
GO

USE TestJoin
GO

CREATE TABLE Departamentos
(
    Id int,
    Nombre varchar(20)
);

CREATE TABLE Empleados
(
    Nombre varchar(20),
	Apellido varchar(60),
    DepartamentoId int
);

INSERT INTO Departamentos VALUES(31, 'Ventas');
INSERT INTO Departamentos VALUES(33, 'Sistemas');
INSERT INTO Departamentos VALUES(34, 'Finanzas');
INSERT INTO Departamentos VALUES(35, 'Marketing');

INSERT INTO Empleados VALUES('Rafael','Morales Duarte', 31);
INSERT INTO Empleados VALUES('Juan','Bolivar Perez', 33);
INSERT INTO Empleados VALUES('Leo Heisenberg','Gamarra Landa', 33);
INSERT INTO Empleados VALUES('Angelica Lia','Peralta Quispe', 34);
INSERT INTO Empleados VALUES('Sandra Maria','Castilla Ugarte', 34);
INSERT INTO Empleados VALUES('Williams','Marticorena Enciso', NULL);