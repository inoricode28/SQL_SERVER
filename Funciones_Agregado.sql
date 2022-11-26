--FUNCIONES DE AGREGADO
--Usando Northwind
USE Northwind
GO----------------------------------------------------------------------------

--El promedio de Precios de los productos
select AVG(P.UnitPrice) As Promedio from Products as P
GO----------------------------------------------------------------------------
--El Precio mas alto de los productos
select Max(P.UnitPrice) As 'Precio mayor' from Products as P
GO----------------------------------------------------------------------------

--El Precio mas bajo de los productos
select Min(P.UnitPrice) As 'Precio menor' from Products as P
GO----------------------------------------------------------------------------

--Cantidad de Productos
select Count(*) As 'Cantidad de Productos' from Products as P
GO----------------------------------------------------------------------------

--Cantidad de Productos en Stock
select Sum(P.UnitsInStock) As 'Productos en Stock' from Products as P
GO----------------------------------------------------------------------------

--Valor total de los Productos en Stock
select Sum(P.UnitsInStock * P.UnitPrice) As 'Productos en Stock' from Products as P
GO----------------------------------------------------------------------------

--Monto total vendido en el año 1997 y la cantidad de órdenes
select Sum(O.Freight) As 'Monto total', COUNT(O.OrderID) As 'Cantidad'
from Orders As O where YEAR(O.OrderDate) = 1997
GO----------------------------------------------------------------------------

--Stock mas alto y mas bajo de productos
select Max(P.UnitsInStock) As 'Cantidad mas alta de Productos en Stock',
Min(P.UnitsInStock) As 'Cantidad mas baja de Productos en Stock'
from Products as P
GO----------------------------------------------------------------------------

--Cantidad vendida del producto con código 23
select sum(Od.Quantity) As 'Unidades Producto 23'
from [Order Details] As OD where ProductID = 888888
GO----------------------------------------------------------------------------

--Cantidad de órdenes generadas y monto total vendido del Empleado con código 3
select Count(O.OrderID) As 'Cantidad', SUM(O.Freight) As 'Monto Total'
from Orders As O where EmployeeID = 3