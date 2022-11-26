USE ASPEAR_2021
GO

/*
CASO Nº 003 – CONSULTA DE INFORMACION.
*/
-- 1.- Listar los clientes que vivan en surco
SELECT * FROM TBL_CLIENTE
WHERE DIRECCION LIKE '%Surco%'
GO
-- 2.- Listar aquellos productos cuyo stock sean <= a 556
SELECT * FROM TBL_PRODUCTOS_SERVICIOS
WHERE STOCK <= 556 AND TIPO = 'Producto'
GO

-- 3.- Listar aquellos servicios cuyo precio sean < a 99.99
SELECT * FROM TBL_PRODUCTOS_SERVICIOS
WHERE PRECIO < 99.99 AND TIPO = 'Servicio'
GO

-- 4.- Listar aquellos mecánicos cuya especialidad sea “Electricidad” y “Mecanica”
SELECT * FROM TBL_MECANICO
WHERE ESPECIALIDAD IN ('Electricidad', 'Mecanica')
GO
-- 5.- Listar aquellos mecánicos que este disponibles
SELECT * FROM TBL_MECANICO
WHERE DISPONIBILIDAD = 'SI'
GO
-- 6.- Listar aquellos autos que ingresaron durante el mes de Octubre del 2022 (utilizar funciones de fecha)
SELECT * FROM TBL_RT_VEHICULO
WHERE FHingreso BETWEEN '2022-10-01' AND '2022-10-31'
GO
