CREATE DATABASE VIPASA2 -- creacion de la bd Vipasa2
GO
USE VIPASA2 -- selecciono 
GO
---Creacion del objeto Tabla

CREATE TABLE TBL_PRODUCTO(
	CODIGO int IDENTITY(1,1) NOT NULL,
	DESCRIPCION varchar(60),
	MARCA varchar(50),
	CATEGORIA varchar(50),
	STOCK int,
	PRECIO money,
	FINGRESO date,
	CONSTRAINT codigo_producto PRIMARY KEY(codigo)
)
GO
DROP TABLE TBL_PRODUCTO

select * from TBL_PRODUCTO
insert into TBL_PRODUCTO values('producto1','marca1','categoria',12,12.99,'2020-12-12')
go

BULK INSERT TBL_PRODUCTO
FROM 'G:\data_2020\LIBRO1.csv'  -- Ruta archivo
WITH ( FIRSTROW =2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', TABLOCK)   
PRINT 'Proceso culmino SATISFACTORIAMENTE!!!'
GO

SELECT * FROM TBL_PRODUCTO
WHERE MARCA='ASUS'

GO
--CREAR UN STORE PROCEDURE QUE ME PERMITA INSERTAR UN REGISTRO
--EN BASE A UNA SERIE DE CRITERIOS
--INSERT INTO

--CREATE PROCEDURE <Nombre del procedimiento> (@variable(s)  tipo de dato)
--AS
--INSERT INTO (Dominios de la tabla) VALUES( Valores a insertar)
----------------------------------------------------------------------------
--EXECUTE <Nombre del procedimiento> (Valores a insertar)
----------------------------------------------------------------------------
CREATE PROCEDURE SP_INSERTAR_REGISTRO (@DESCRIPCION varchar(60),@MARCA varchar(50),	
									   @CATEGORIA varchar(50),@STOCK int,@PRECIO money,
									   @FINGRESO date)
AS
INSERT INTO TBL_PRODUCTO VALUES( @DESCRIPCION,@MARCA,@CATEGORIA,@STOCK,@PRECIO,@FINGRESO)
----------------------------------------------------------------------------
EXECUTE SP_INSERTAR_REGISTRO 'Mouse Gaming','Logitech','Mouse',2500,60.99,'2020-02-01'

SELECT *FROM TBL_PRODUCTO


GO

--CREAR UN STORE PROCEDURE QUE ME PERMITA ACTUALIZAR UN REGISTRO
--EN BASE A UNA SERIE DE CRITERIOS
--UPDATE <Nombre Tabla> SET  Dominios=Nuevos valores WHERE <Condicion>

--CREATE PROCEDURE <Nombre del procedimiento> (@variable(s)  tipo de dato)
--AS
--UPDATE <Nombre Tabla> SET  Dominios=Nuevos valores WHERE <Condicion>
----------------------------------------------------------------------------
--EXECUTE <Nombre del procedimiento> (Valores a insertar)
----------------------------------------------------------------------------
GO
CREATE PROCEDURE SP_ACTUALIZAR_INGRESO_STOCK(@CODIGO int,@STOCK int)
AS
UPDATE TBL_PRODUCTO SET  STOCK=STOCK+@STOCK WHERE CODIGO=@CODIGO
----------------------------------------------------------------------------
EXECUTE SP_ACTUALIZAR_INGRESO_STOCK 42,1000
----------------------------------------------------------------------------
SELECT * FROM TBL_PRODUCTO WHERE CODIGO=42

DELETE FROM TBL_PRODUCTO WHERE CODIGO=10
truncate table tbl_producto
GO
--CREAR UN STORE PROCEDURE QUE ME PERMITA ELIMINAR UN REGISTRO
--EN BASE A UNA SERIE DE CRITERIOS
--DELETE FROM <Nombre Tabla> WHERE <Condicion>

CREATE PROCEDURE SP_ELIMINAR_REGISTRO(@CODIGO int)
AS
DELETE FROM TBL_PRODUCTO WHERE CODIGO=@CODIGO
----------------------------------------------------------------------------
EXECUTE SP_ELIMINAR_REGISTRO 20
----------------------------------------------------------------------------
GO
--CREAR UN STORE PROCEDURE QUE ME PERMITA BUSCAR UN REGISTRO
--EN BASE A UNA SERIE DE CRITERIOS
--SELECT FROM <Nombre Tabla> WHERE <Condicion>

CREATE PROCEDURE SP_BUSCAR_PRODUCTO_DESCRIPCION(@DES varchar(60))
AS
SELECT * FROM TBL_PRODUCTO WHERE DESCRIPCION LIKE '%'+ @DES +'%'
----------------------------------------------------------------------------
EXECUTE SP_BUSCAR_PRODUCTO_DESCRIPCION 'cla'
----------------------------------------------------------------------------

SELECT *FROM TBL_PRODUCTO WHERE DESCRIPCION LIKE '%IMPRE%'