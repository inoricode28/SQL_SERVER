-- Para crear variables utilizamos la clausula DECLARE
-- Numeros int, money, decimal ...etc.
-- Texto   char, varchar ...etc
-- Fecha y hora   date, datetime ...etc.
---------------------------------------------------------
-- DECLARE [@Nombre de la varibale][tipo dato][longitud]
---------------------------------------------------------
-- DECLARE @Nombre Varchar(20)
---------------------------------------------------------
-- Declare una variable llamada "@valor" de tipo "int" y vea su contenido:
declare @valor int
select @valor;

-- Declare una variable llamada "@nombre" de tipo "varchar(20)", 
-- asígnele un valor y vea su contenido:
declare @nombre varchar(20)
set @nombre='Juan Perez';
select @nombre;
GO

-- EMPLEO DE ALGUNAS VARIABLES PÚBLICAS.
Print 'Version: '+ @@version
Print 'Lenguaje: '+ @@language
Print 'Servidor: '+ @@servername
Print 'Conexiones: '+ str(@@max_connections)
GO

--Declaracion de variables
Declare @mensaje varchar(60),
		@error varchar(60)
Set @mensaje='Hola mundo'
Set @error='Error, mensaje vacio'
--Proceso para solucionar el problema
if len(@mensaje)>0
	begin
		set @error=@mensaje
	end
else
	begin
		set @error=@error
	end
--Respuesta a la solucion
print @error