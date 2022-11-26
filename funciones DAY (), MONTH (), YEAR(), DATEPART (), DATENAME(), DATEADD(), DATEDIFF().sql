--DAY (), MONTH (), YEAR(), DATEPART (), DATENAME(), DATEADD(), DATEDIFF().

select getdate();
select day(getdate());
select datepart(month,getdate());
select datename(month,getdate());
Select dateadd(day,3,'1980/11/02');
--retorna "1980/11/05", agrega 3 días.
 select dateadd(month,3,'1980/11/02');
--retorna "1981/02/02", agrega 3 meses.
 select dateadd(hour,2,'1980/11/02');
--retorna "1980/02/02 2:00:00", agrega 2 horas.
 select dateadd(minute,16,'1980/11/02');
--retorna "1980/02/02 00:16:00", agrega 16 minutos.
 select datediff (day,'2005/10/28','2006/10/28');
--retorna 365 (días).
 select datediff(month,'2005/10/28','2006/11/29');
--retorna 13 (meses).
--day(fecha): retorna el día de la fecha especificada. Ejemplo:
 select day(getdate());
--month(fecha): retorna el mes de la fecha especificada. Ejemplo:
 select month(getdate());
-- year(fecha): retorna el año de la fecha especificada. Ejemplo:
 select year(getdate());


