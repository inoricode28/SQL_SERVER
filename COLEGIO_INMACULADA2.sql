CREATE DATABASE Colegio_Inmaculada
GO

USE Colegio_Inmaculada
GO

CREATE TABLE Cursos
(
    Id int,
    Nombre varchar(20)
);

CREATE TABLE Docentes
(
    Nombre varchar(20),
	Apellido varchar(60),
    CursosId int
);

INSERT INTO Cursos VALUES(81, 'Calculo I');
INSERT INTO Cursos VALUES(83, 'Informatica');
INSERT INTO Cursos VALUES(84, 'Comunicacion');
INSERT INTO Cursos VALUES(85, 'Aritmetica');

INSERT INTO Docentes VALUES('Carmen','Smith Durand', 81);
INSERT INTO Docentes VALUES('Juan','Molineri Malaga', 83);
INSERT INTO Docentes VALUES('Leo Heisenberg','Quesada Noriega', 81);
INSERT INTO Docentes VALUES('Lia Molly','Peralta del Solar', 84);
INSERT INTO Docentes VALUES('Sandra Kelly','Castilla del Molino', 84);
INSERT INTO Docentes VALUES('Williams','Marticorena Iwasaki', 85);

--Procedimiento INSERTAR_REGISTRO_DOCENTE

CREATE PROCEDURE SP_INSERTAR_REGISTRO (@NOMBRE varchar(20),@APELLIDO varchar(60),	
									   @CURSOID INT)
AS
INSERT INTO Docentes VALUES(@NOMBRE, @APELLIDO, @CURSOID)

EXECUTE SP_INSERTAR_REGISTRO 'Juan','Jimenez',81

select * from Docentes

--Procedimiento ACTUALIZAR_REGISTRO_CURSO
CREATE PROCEDURE SP_ACTUALIZAR_REGISTRO_CURSO(@ID int,@NOMBRE varchar (20))
AS
UPDATE Cursos SET  Nombre = @NOMBRE WHERE Id = @ID

EXECUTE SP_ACTUALIZAR_REGISTRO_CURSO 83, 'Informatica 2'

select * from Cursos

--Procedimiento ELIMINAR_REGISTRO_CURSO

CREATE PROCEDURE ELIMINAR_REGISTRO_CURSO (@ID int)
AS
DELETE FROM Cursos WHERE  Id = @ID

EXECUTE ELIMINAR_REGISTRO_CURSO 81

SELECT * FROM Cursos

--Procedimiento RECUPERAR_JOIN_DOCENTE_CURSO

DECLARE RECUPERAR_JOIN_DOCENTE_CURSO (@CURSOS table (Id int,  Nombre varchar(20),
									 @DOCENTES table ( Nombre varchar(20),Apellido varchar(60),CursosId int)
SELECT 
FROM @CURSOS INNER JOIN @DOCENTES
    

