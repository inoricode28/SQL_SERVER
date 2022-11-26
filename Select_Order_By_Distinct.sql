USE Northwind
GO-------------------------------------------------------------------------
SELECT * FROM Orders
--Listar la cantidad de empleados que realizan pedidos en la empresa
SELECT DISTINCT (EmployeeID)
FROM Orders
GO-------------------------------------------------------------------------
----Listar los proveedores con los que trabaja la empresa
select * FROM Suppliers 
SELECT DISTINCT(Country)
FROM Suppliers order by 1
GO-------------------------------------------------------------------------
--Listar las 10 ultimas ordenes generadas
SELECT TOP 5 *
FROM Orders 
ORDER  BY ORDERID 
GO-------------------------------------------------------------------------