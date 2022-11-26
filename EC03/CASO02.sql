USE ASPEAR_2021
GO

/*
2.1.- Teniendo la información de las tablas realizar los siguientes requerimientos dentro de la tabla clientes
        1.-Agregar 2 clientes, pero sin telefono.
        2.-Actualizar aquellos clientes cuyo apellido sea Perez por tu apellido materno.
        3.-Eliminar registro cuyo dni sea el 45813210 (Jose Torrealba alba) */

INSERT INTO TBL_CLIENTE VALUES ('70556932', 'Roberto Gomez Bolaños', 'Av. Primavera 1536 - Santiago de Surco', NULL),
							   ('48269600', 'Alan García Perez', 'Av. La Encalada 795 - Miraflores', NULL)
GO
SELECT * FROM TBL_CLIENTE

UPDATE TBL_CLIENTE
SET NOMBRES = 'Pepe Akiro Gonzales Ramos'
WHERE DNI = '44854610'
GO

DELETE FROM TBL_CLIENTE
WHERE DNI = '45813210'
GO

/*----------------------------------------------------------------
2.2.- Teniendo la información de las tablas realizar los siguientes requerimientos dentro de la tabla productos/servicios
        1.- Actualizar el precio Cambio de aceite Auto Sedan a nuevo valor de 129.99.
        2.- Actualizar aquellos productos con un incremento de 10 soles.
        3.- Insertar 2 productos y 2 servicios
        4.- Insertar 2 registro de ingreso a taller datos del auto y la fecha de ingreso de Octubre 2021.
*/

UPDATE TBL_PRODUCTOS_SERVICIOS
SET PRECIO = '129.99'
WHERE CODIGO = '3'
GO

UPDATE TBL_PRODUCTOS_SERVICIOS
SET PRECIO = PRECIO + 10
WHERE TIPO = 'Producto'
GO



INSERT INTO TBL_PRODUCTOS_SERVICIOS VALUES ('Lavado y pulido de autos', '0', '50.00', 'Servicio'),
										   ('Mantenimiento 10,000 KMs de auto marca Porsche ', '0', '2500.00', 'Servicio'),
										   ('Llantas con Aro 16"', '155', '89.90', 'Producto'),
										   ('Espejo para camionetas Nissan', '100', '45.50', 'Producto')
GO



INSERT INTO TBL_RT_VEHICULO VALUES ('AWS-458', '90000200', '70556932', 'Porsche', 'Dorado', '2022-10-15 15:30:00'),
								   ('VAN-322', '98765432', '48269600', 'Jaguar', 'Azul', '2022-10-20 10:33:00')
GO


/*
2.3.- Contando con una base de datos funcional ingresar una transacción (venta/servicio) en las tablas según corresponda.
        1.-Debes tener en cuenta la información recientemente ingresada en productos / servicios.
        2.-Considerar la integridad referencia dentro de las tablas.
*/

INSERT INTO TBL_HOJA_DE_PARTE VALUES ('3', '0.00', '458.19', '2500.00')
GO
SELECT * FROM TBL_HOJA_DE_PARTE

INSERT INTO TBL_PS_HP VALUES ('3', '90000200', '8', '1', '2500.00')
GO
SELECT * FROM TBL_PS_HP

INSERT INTO TBL_FACTURA VALUES ('3', '0.00', '458.19', '2500.00', '4.10', '609.76')
GO
SELECT * FROM TBL_FACTURA

INSERT INTO TBL_DETALLE_FACTURA VALUES ('3', '8', '1', '2500.00', '2500.00')
GO
SELECT * FROM TBL_DETALLE_FACTURA


