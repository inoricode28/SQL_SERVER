use ASPEAR_2021
DECLARE @Description AS nvarchar(400),
		@precio as decimal(8,2)
DECLARE ProdInfo CURSOR SCROLL FOR SELECT Descripcion,precio FROM Tbl_Productos_Servicios
OPEN ProdInfo

FETCH FIRST FROM ProdInfo INTO @Description,@precio
PRINT 'FECTH FIRST --- '+Rtrim(@Description)+'----'+convert(varchar,@precio)

FETCH NEXT FROM ProdInfo INTO @Description,@precio
PRINT 'FECTH NEXT --- '+Rtrim(@Description)+'--2--'+convert(varchar,@precio)

FETCH ABSOLUTE 4 FROM ProdInfo INTO @Description,@precio
PRINT 'FECTH ABSOLUTE (X) --- '+Rtrim(@Description)+'--2--'+convert(varchar,@precio)

FETCH RELATIVE 5 FROM ProdInfo INTO @Description,@precio
PRINT 'FECTH RELATIVA (X) --- '+Rtrim(@Description)+'--2--'+convert(varchar,@precio)

FETCH LAST FROM ProdInfo INTO @Description,@precio
PRINT 'FECTH LAST --- '+Rtrim(@Description)+'--6--'+convert(varchar,@precio)

CLOSE ProdInfo
DEALLOCATE ProdInfo

--Select * from Tbl_Productos_Servicios