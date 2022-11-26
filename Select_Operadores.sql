-- Usando Northwind
USE Northwind
GO
--Listas los productos con stock igual a CERO
SELECT * FROM Products WHERE UnitsInStock = 0
GO
--Listar los clientes que son de las ciudades de Madrid, Barcelona y Sao Paulo
SELECT * FROM Customers
WHERE City = 'Madrid' or City = 'Barcelona' or City = 'Sao Paulo'
GO
--También se puede usar el operador In
SELECT * FROM Customers
WHERE City in ('Madrid','Barcelona','Sao Paulo')
GO
-- Listar los productos con precios entre 20 y 40
SELECT * FROM Products WHERE UnitPrice >= 20 AND UnitPrice <= 40
GO
-- También se puede usar el operador Between
SELECT * FROM Products WHERE UnitPrice BETWEEN 20 and 40
GO
-- Listar los empleados con 25 años o mas en el trabajo
SELECT E.EmployeeID As 'CódiGO', E.LastName as 'Apellido',
E.FirstName As 'Nombre' , Años = DATEDIFF(yy, HireDate, GetDate())
from EMPLOYEES As E WHERE DATEDIFF(yy, HireDate, GetDate()) >= 25
GO
-- Listar los Productos descontinuados con unidades en Stock
SELECT * FROM Products
WHERE Discontinued = 1 AND UnitsInStock >0
GO
-- Listar los productos cuya descripción inicial con la letra C
SELECT * FROM Products
WHERE ProductName Like 'C%'
GO
-- Listar los clientes cuyo contacto sea el Manager.
SELECT * FROM Customers WHERE ContactTitle LIKE '%Manager%'
GO
-- Listar los Empleados de la ciudad de Seattle en el país USA
SELECT * FROM Employees
WHERE City = 'Seattle' AND Country = 'USA'
GO
-- Listar los proveedores (Suppliers) de France que no tienen asignada una Region (Null)
SELECT * FROM Suppliers WHERE Country = 'France' AND Region is Null
GO

