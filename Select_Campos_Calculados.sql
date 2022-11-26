--Seleccionar la BD Northwind
USE Northwind
GO -------------------------------------------------------------------------
--El código del empleado y su nombre completo (el nombre completo no existe en la tabla)
select * FROM Employees
SELECT E.EmployeeID As 'Código',
Empleado = E.LastName + Space(1) + E.FirstName
FROM Employees As E
GO -------------------------------------------------------------------------
--Otra forma
SELECT E.EmployeeID As 'Código',
E.LastName + Space(1) + E.FirstName As 'Empleado'
FROM Employees As E
GO -------------------------------------------------------------------------
--Empleado y su edad (en la tabla hay fecha de nacimiento)
SELECT E.EmployeeID As 'Código',
E.LastName + Space(1) + E.FirstName As 'Empleado',
Edad = Datediff(yy,E.BirthDate,GetDate())
FROM Employees As E
GO -------------------------------------------------------------------------
--Los productos y el valor del Stock (Precio * Stock)
SELECT P.ProductName As 'Producto', P.ProductID As 'Código',
[Valor del Stock] = P.UnitPrice * P.UnitsInStock,
P.UnitPrice As 'Precio', P.UnitsInStock As 'Stock'
FROM Products As P
GO -------------------------------------------------------------------------
--Productos y las unidades de compra urgente. 
--Existen unidades para comprar urgente 
--Cuando el stock es menor a las unidades en orden
SELECT P.ProductID,P.ProductName As 'Producto',
P.UnitsInStock As 'Stock', P.UnitsOnOrder As 'En Orden',
[Por comprar] = iif(P.UnitsOnOrder > P.UnitsInStock,P.UnitsOnOrder - P.UnitsInStock,0)
FROM Products As P
WHERE P.UnitsOnOrder > P.UnitsInStock
order by producto,stock


