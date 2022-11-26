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

--Cláusula INNER JOIN O TAMBIEN LLAMADO JOIN
SELECT * 
FROM Empleados E
JOIN Departamentos D
ON E.DepartamentoId = D.Id


GO ----------------------------------------------
--Cláusula LEFT JOIN O TAMBIEN LLAMADO JOIN

--Cláusula RIGHT JOIN O TAMBIEN LLAMADO JOIN

--Cláusula FULL JOIN O TAMBIEN LLAMADO JOIN