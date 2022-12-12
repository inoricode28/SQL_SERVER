--Implementar un curso donde se imprima
--en forma de reporte a los registros de la tabla PASAJERO

DECLARE @idpasajero char(8),
		@pasajero char(20),
		@pais char(10),
		@documento char(12)

DECLARE C_TBL_PASAJERO CURSOR
FOR 
SELECT PAS.IDPASAJERO,
	   NOM_APELLIDOS=PAS.apaterno+' '+PAS.amaterno+' '+PAS.nombre, 
	   PAIS=PAIS.nombre,PAS.num_documento
FROM PASAJERO PAS 
INNER JOIN PAIS
ON PAS.idpais=PAIS.idpais

OPEN C_TBL_PASAJERO
FETCH NEXT FROM C_TBL_PASAJERO INTO @idpasajero,@pasajero,@pais,@documento

PRINT'CODIGO         PASAJERO               PAIS           DOCUMENTO'
PRINT'-------------------------------------------------------------------'

WHILE @@FETCH_STATUS=0
BEGIN
	
	PRINT @idpasajero+SPACE(5)+@pasajero+SPACE(5)+@pais+SPACE(5)+@documento
	FETCH NEXT FROM C_TBL_PASAJERO INTO @idpasajero,@pasajero,@pais,@documento
END
CLOSE C_TBL_PASAJERO
DEALLOCATE C_TBL_PASAJERO

