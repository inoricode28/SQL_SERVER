--Usando Northwind
USE Northwind
GO--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--FDU que retorne los productos con tengan mas Unidades en Orden que Stock actual
Create function fduProductoCompraUrgente () returns Table
As
Return (select * from Products where UnitsOnOrder > UnitsInStock)
GO-------------------------------------------------------------------------------------------
--Para usar la funci�n creada
select * from fduProductoCompraUrgente()
GO-------------------------------------------------------------------------------------------

--Listar de Pedidos de un cliente, escribir el nombre del cliente
--Primero: buscar el c�diGO------------------------------------------------------------------------------------------- del cliente.
--Ejemplo �Universidad SQL�
select CustomerID from Customers  where CompanyName = �Universidad SQL�
GO-------------------------------------------------------------------------------------------
--Se comprueba que no existe el cliente
--Para el cliente �Antonio Moreno Taquer�a�
select CustomerID from Customers  where CompanyName = �Antonio Moreno Taquer�a�
GO-------------------------------------------------------------------------------------------
--Resultado: ANTON

--Para las �rdenes del Cliente se puede usar una sub consulta. (Ver Sub consultas)
SELECT * FROM Orders  where   CustomerID = (select CustomerID from Customers
where CompanyName = �Antonio Moreno Taquer�a�)
GO-------------------------------------------------------------------------------------------

--En una FDU
Create function fduOrdenesPorCliente(@Cliente nvarchar(40)) Returns Table
As
Return (SELECT * FROM Orders
where CustomerID = (select CustomerID from Customers
where CompanyName =@Cliente ))
GO-------------------------------------------------------------------------------------------

--Usando la FDU anterior, las �rdenes para �Antonio Moreno Taquer�a�
select * from fduOrdenesPorCliente(�Antonio Moreno Taquer�a�)
GO-------------------------------------------------------------------------------------------

--Productos con precio mayor a valor ingresado
Create function fduProductosPrecioHaciaArriba(@Precio Numeric(9,2)) Returns Table
As
Return (select * from Products where UnitPrice > @Precio)
GO-------------------------------------------------------------------------------------------
--Usar la FDU
select * from fduProductosPrecioHaciaArriba(80)
GO-------------------------------------------------------------------------------------------

--Pedidos de un cliente en un rango de fechas
Create function fduOrdenesPorClienteRangoFechas(@Cliente nvarchar(40), @FechaInicial Date,
@FechaFinal Date) Returns Table
As
Return (SELECT * FROM Orders
where CustomerID = (select CustomerID from Customers where CompanyName =@Cliente )
and (OrderDate >= @FechaInicial and OrderDate <= @FechaFinal)
)
GO-------------------------------------------------------------------------------------------
--Usar la FDU fduOrdenesPorClienteRangoFechas
select * from fduOrdenesPorClienteRangoFechas('Antonio Moreno Taquer�a','01/06/1997','31/12/1997')
GO-------------------------------------------------------------------------------------------

--Listado de las categor�as y el valor del Stock de cada una
--Valor del Stock para la categoria 1
select SUM(UnitPrice * UnitsInStock) from Products where CategoryID = 1
GO-------------------------------------------------------------------------------------------
--La FDU para calcular el valor del stock
Create function fduValorStockPorCategoria(@CodigoCategoria int)
Returns Numeric(9,2)
As
Begin
-- Variable para capturar el Valor
Declare @ValorTotalStock Numeric(9,2)
set @ValorTotalStock = (select SUM(UnitPrice * UnitsInStock)
from Products where CategoryID = @CodigoCategoria )
Return @ValorTotalStock
End
GO-------------------------------------------------------------------------------------------
--Usar la FDU fduValorStockPorCategoria
select C.CategoryID As 'C�digo', C.CategoryName As 'Categor�a',
dbo.fduValorStockPorCategoria(C.CategoryID) As 'Valor Stock'
from Categories As C  order by [Valor Stock] desc
GO-------------------------------------------------------------------------------------------
