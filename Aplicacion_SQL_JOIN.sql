USE TestJoin
GO
SELECT * FROM Empleados;
SELECT * FROM Departamentos;
GO
-----------------------------------------------------
--Estructura
--SELECT <Columnas o *>
--FROM <Tablas o vistas>
--JOIN / INNER JOIN / LEFT JOIN / RIGHT JOIN / FULL JOIN
--ON <Campos en comun (tipo y longitud)>
-- ....

--Cl�usula INNER JOIN O TAMBIEN LLAMADO JOIN
SELECT * 
FROM Empleados E
JOIN Departamentos D
ON E.DepartamentoId = D.Id


GO ----------------------------------------------
--Cl�usula LEFT JOIN O TAMBIEN LLAMADO JOIN

--Cl�usula RIGHT JOIN O TAMBIEN LLAMADO JOIN

--Cl�usula FULL JOIN O TAMBIEN LLAMADO JOIN