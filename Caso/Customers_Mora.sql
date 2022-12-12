--GENERAR EL SGTE REPORTE
-------------------------------------------------------
--CODIGO      NOMBRE       MONTO VENTA        MORA
-------------------------------------------------------
--SI ES MENOR A 500 MORA SERA EL 10% DE LA DEUDA
--SI ES MAYOR A 500 Y MENOR A 2000 MORA SERA EL 15% DE LA DEUDA
--SI ES MAYOR A 2000 MORA SERA EL 20% DE LA DEUDA
GO
USE Northwind
DECLARE CURSOR_DEUDA CURSOR FOR
SELECT C.CustomerID,C.CompanyName,Deuda=sum(OD.UnitPrice*OD.Quantity) 
FROM Customers C JOIN Orders O ON C.CustomerID=O.CustomerID
	   JOIN [Order Details] OD ON O.OrderID=OD.OrderID
GROUP BY C.CustomerID,C.CompanyName
DECLARE @V_codigo nchar(5),@V_nombre nvarchar(40),@V_deuda money
OPEN CURSOR_DEUDA 
FETCH CURSOR_DEUDA INTO @V_codigo,@V_nombre,@V_deuda
---GENERAR BANDA DE TITULOS
PRINT REPLICATE('-',100)
PRINT SPACE(6)+'CODIGO'+SPACE(20)+'NOMBRE'+SPACE(20)+'MONTO_VENTA'+SPACE(20)+'MORA'
PRINT REPLICATE('-',100)
-----------------------------
WHILE @@FETCH_STATUS=0
BEGIN
	DECLARE @V_mora money
	IF @V_deuda<=500 
		set @V_mora = @V_deuda*0.10
	ELSE IF @V_deuda<=2000 
		set @V_mora = @V_deuda*0.15
		ELSE
			set @V_mora = @V_deuda*0.20

	PRINT SPACE(6)+@V_codigo+SPACE(20)+LEFT(LTRIM(RTRIM(@V_nombre)),15)+SPACE(20)+LTRIM(STR(@V_deuda))+SPACE(20)+LTRIM(STR(@V_mora))

	FETCH CURSOR_DEUDA INTO @V_codigo,@V_nombre,@V_deuda
END

CLOSE CURSOR_DEUDA
DEALLOCATE CURSOR_DEUDA
GO