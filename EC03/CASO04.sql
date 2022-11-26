USE ASPEAR_2021
GO

/*
CASO N� 004 � REPORTES USANDO JOINS.
    1.- la organizaci�n necesita la informaci�n de la facturaci�n de mes de Noviembre 2022 como el sgte ejemplo: para eso puedes utilizar la herramienta de vistas.
*/

SELECT C.NOMBRES, V.MATRICULA, H.NUMERO_PARTE, P.CANTIDAD, PS.DESCRIPCION, F.DESCUENTO, F.IGV, F.TOTAL_SOLES, F.TOTAL_DOLARES,
DATENAME(MONTH, V.FHingreso) AS Facturado
FROM TBL_CLIENTE C
    INNER JOIN TBL_RT_VEHICULO V ON V.DNI = C.DNI
    INNER JOIN TBL_HOJA_DE_PARTE H ON H.REGISTRO = V.REGISTRO
    INNER JOIN TBL_PS_HP P ON P.NUMERO_PARTE = H.NUMERO_PARTE
    INNER JOIN TBL_PRODUCTOS_SERVICIOS PS ON PS.CODIGO = P.CODIGO
    INNER JOIN TBL_FACTURA F ON F.NUMERO_PARTE = H.NUMERO_PARTE
WHERE MONTH(V.FHingreso) = '11'
GO