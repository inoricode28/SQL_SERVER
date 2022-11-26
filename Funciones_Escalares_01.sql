USE Northwind
/*Funciones escalares*/
--1. Creacion de funcion escalar
GO------------------------------------------------------------------------
CREATE FUNCTION DBO.UFN_SumaDosNumeros
	(
	@intNumero1 int,
	@intNumero2 int
	)
RETURNS int
AS
BEGIN
	RETURN @intNumero1+@intNumero2
END
GO------------------------------------------------------------------------
--Consultar una funcion escalar
SELECT DBO.UFN_SumaDosNumeros(100,23)
GO------------------------------------------------------------------------
--Consultar una funcion en un set de resultados
DECLARE @tblNumeros TABLE (intNumero1 int, intNumero2 int)
INSERT INTO @tblNumeros
VALUES (1,2),(2,3),(3,4),(5,6)
--SELECT * FROM @tblNumeros
SELECT intNumero1, intNumero2,dbo.UFN_SumaDosNumeros(intNumero1, intNumero2) as 'sumaTotal'
FROM @tblNumeros
GO------------------------------------------------------------------------