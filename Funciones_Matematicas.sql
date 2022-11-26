--Calcular el valor en radianes de 2 PI()
SELECT 'El valor de PI*2 en radianes es: ' + CONVERT(varchar, DEGREES((PI()*2)))
go

--Ejercicio 2
--Calcular el valor del arco coseno de -1
SELECT 'El Arco Coseno de -1 es: ' + CONVERT(varchar, ACOS(-1))
go

--Ejercicio 3
--Hallar el valor exponencial de 2. La constante e (2,718281…) es la base de los logaritmos naturales.
SELECT 'El valor de e elevado al cuadrado es: ' + Convert(nvarchar,EXP(2))
go

--Ejercicio 4
--Redondear los valores 345.6763 en 3 decimales y 2348.56983 en 2 decimales
SELECT ROUND(345.6763, 3), ROUND(2348.56983, 2);
go

--Ejercicio 5
--Calcular el valor del Arco Seno de -1
Select 'El ASIN de 1 es is: ' + CONVERT(varchar, ASIN(1))
go

--Ejercicio 6
--Reportar el mayor entero de 25.86, -45.96 y $12.02
Select FLOOR(25.86), FLOOR(-45.96), FLOOR($12.02)
go

--Ejercicio 7
--Mostrar los signos de los números desde -2 hasta 2
DECLARE @Valor real
SET @Valor = -2
WHILE @Valor <= 2
BEGIN
SELECT SIGN(@Valor)
SELECT @Valor = @Valor + 1
END
go

--Ejercicio 8
--Calcular el arco tangente de -50 y -100
Select 'El ATAN of -50 es: ' + CONVERT(varchar, ATAN(-50))
Select 'El ATAN of -100 es: ' + CONVERT(varchar, ATAN(-100))
go

--Ejercicio 9
--Calcular el valor de logaritmo de 10
Select 'El Logaritmo de 10 es: ' + CONVERT(varchar, LOG(10))
go

--Ejercicio 10
--Calcular el seno de 50
Select 'El Seno de 50 es: ' + CONVERT(varchar,SIN(50))
go

--Ejercicio 11
--Calcular el arco tangente de 35.5 y 130
Select 'El arco tangente del angulo es: ' + CONVERT(varchar,ATN2(35.5,130 ))
go

--Ejercicio 12
--Calcular el valor de logaritmo en base 10 de 50
Select 'El Logaritmo en base 10 de 50 es: ' + CONVERT(varchar,LOG10(50))
go

--Ejercicio 13
--Hallar la raíz cuadrada de 50
SELECT SQRT(50)
go

--Ejercicio 14
--Reportar el menor entero de 25.86, -45.96 y $12.02
Select CEILING(25.86), CEILING(-45.96), CEILING($12.02)
go

--Ejercicio 15
--Hallar el conseno de 89
SELECT 'El Coseno de 89 es: ' + CONVERT(varchar,COS(89))
go

--Ejercicio 16
--Hallar el valor de 25 elevado a la cuarta
SELECT POWER(25, 4)
go

--Ejercicio 17
--Hallar la tangente de PI entre 6
SELECT TAN(PI()/6)
go

--Ejercicio 18
--Hallar la cotangente de 150
Select 'La cotangente de 150 es: ' + CONVERT(varchar,COT(150))
go

--Ejercicio 19
--Hallar el valor en radiantes de 90
SELECT 'El valor en RADIANES de 90 es: ' + CONVERT(varchar, RADIANS(90))
go

