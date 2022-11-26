USE Northwind
GO------------------------------------------------------------------------------
--1.Creacion de Funciones Escalares
CREATE FUNCTION ImpuestoVentaGeneral(@Cantidad money)
RETURNS money
AS
BEGIN
Declare @Igv money
Set  @Igv=@Cantidad*.12
Return(@Igv)
END
GO------------------------------------------------------------------------------ 
--2.Revisar la funcion debe de escribirse el nombre con dos partes
Select OrderID,ProductID,unitprice, dbo.ImpuestoVentaGeneral(unitprice) as 'IGV' from [order details]
GO------------------------------------------------------------------------------ 
--3.borrar la funcion
drop function ImpuestoVentaGeneral
GO------------------------------------------------------------------------------  
--4.Otro ejemplo de funcion
CREATE Function Comision(@valor money)
RETURNS money
AS
BEGIN
Declare @Resultado money
if @valor>=15
    BEGIN
         SET @RESULTADO= @VALOR * 1.10
    END
ELSE
    BEGIN
         SET @RESULTADO=@VALOR
    END
RETURN @RESULTADO
END
GO------------------------------------------------------------------------------  
--ejecutar la funcion
 
SELECT UNITPRICE, 'Comision_Venta'=DBO.Comision(UNITPRICE) FROM [ORDER DETAILS]
GO------------------------------------------------------------------------------  
 
/* en una funcion no se pueden usar estas funciones no determiniestas
@@ERROR FORMATMESSAGE    IDENTITY     USER_NAME
@@IDENTITY   GETANSINULL NEWID    @@ERROR
@@ROWCOUNT   GETDATE PERMISSIONS @@IDENTITY
@@TRANCOUNT GetUTCDate   SESSION_USER     @@ROWCOUNT
APP_NAME     HOST_ID STATS_DATE   @@TRANCOUNT
CURRENT_TIMESTAMP         HOST_NAME     SYSTEM_USER
CURRENT_USER     IDENT_INCR   TEXTPTR
DATENAME     IDENT_SEED   TEXTVALID
*/
GO------------------------------------------------------------------------------   
--5.Una función con valores de tabla de varias instrucciones es una combinación de una vista y un procedimiento almacenado.

CREATE FUNCTION LISTAPORPAIS(@PAIS VARCHAR(50))
RETURNS @CLIENTES TABLE
(
	Codigo         VARCHAR(10), 
	NombreCompania VARCHAR(50),
	Contacto       VARCHAR(50) ,
	Pais           VARCHAR(50)
)
AS
BEGIN
INSERT @CLIENTES SELECT CustomerID,CompanyName,ContactName,Country FROM Customers
WHERE Country=@PAIS
RETURN
END
GO------------------------------------------------------------------------------   
--7.EJECUCION DE FUNCION
SELECT * FROM LISTAPORPAIS('Germany')
GO------------------------------------------------------------------------------    
--8.Ejemplo de una función con valores de tabla en línea
CREATE FUNCTION DETALLEPEDIDO_FECHA(@INICIO DATETIME, @FIN DATETIME)
RETURNS TABLE
AS
RETURN
(
SELECT O.ORDERID,O.ORDERDATE,P.PRODUCTID, P.PRODUCTNAME,(OD.UNITPRICE * OD.QUANTITY) AS TOTAL
FROM ORDERS AS O INNER JOIN [ORDER DETAILS] AS OD
ON O.ORDERID=OD.ORDERID INNER JOIN PRODUCTS AS P
ON OD.PRODUCTID=P.PRODUCTID
WHERE O.ORDERDATE BETWEEN @INICIO AND @FIN
)
GO------------------------------------------------------------------------------    
--Ejecutar la funcion

SELECT * FROM DBO.DETALLEPEDIDO_FECHA('1998-01-01','1998-31-12')
GO------------------------------------------------------------------------------   