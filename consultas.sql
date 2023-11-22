USE residencias_escolares

--Visualiza todas las residencias que tengan más de 100 plazas ordenado por número de plazas descendente
SELECT *FROM residencias WHERE cantidadPlazas >100 ORDER BY cantidadPlazas desc 

--Visualiza el código y nombre de todas las residencias que tengan más de 100 plazas y género mixto ordenado por género y número de plazas ascendente
select codresidencia, nomresidencia from residencias where cantidadPlazas > 100 and genero = 'mixto' order by genero, cantidadplazas asc

--3. Visualiza nombre, cantidad de plazas y precio de todas las residencias que tengan entre 100  y 200 plazas
select nomresidencia, cantidadPlazas, precioMensual from residencias where cantidadPlazas between 100 and 200 order by precioMensual desc

--4. Visualiza todas las residencias que admitan genero masculino ordenado por cantidad de  plazas
select *from residencias where genero = 'masculino' order by cantidadPlazas 

--5. Visualiza nombre y director de todas las residencias que el director sea X 
select nomresidencia, nombreDirector from residencias where nombreDirector = 'Julián Díaz'

--6. Visualiza nombre, genero, comedor y nombre de director de todas las residencias que admitan genero masculino y femenino ordenado por nombre residencias 
select nomresidencia, genero, comedor, nombredirector from residencias where genero ='masculino' or genero = 'femenino' order by nomResidencia
select nomresidencia, genero, comedor, nombredirector from residencias where genero in('masculino', 'femenino')
select nomresidencia, genero, comedor, nombredirector from residencias where genero != 'mixto'

--7 Visualiza código, nombre, universidad de todas las residencias de la universidad "x", en la visualización deberán aprecer en la cabecera código, nombre, universidad
SELECT codResidencia AS 'Código',nomResidencia as 'Nombre',codUniversidad as 'Universidad' FROM residencias WHERE codUniversidad = 3 

--8. Visualiza todas las residencias con comedor y género mixto ordenado por precio
SELECT *FROM residencias WHERE comedor = 1 and genero ='mixto' ORDER BY precioMensual

--9. Visualiza código, nombre y universidad de todas las residencias de la universidad cuyo código comience en 1
SELECT codResidencia, nomResidencia, codUniversidad FROM residencias WHERE codResidencia like '1%'

--10. Visualiza todas las residencias cuyo nombre finalice en A.
SELECT *FROM residencias WHERE nomResidencia like '%a'

--11. Visualiza todas las residencias cuyo nombre comience en "x" y finalice en A.
SELECT *FROM residencias WHERE nomResidencia like 'L%a'

--12. Visualiza todas las residencias cuyo nombre contenga la letra A.
SELECT *FROM residencias WHERE nomResidencia like '%a%'

--13. Visualiza todas las residencias cuyo nombre comience por A y contenga "er".
SELECT *FROM residencias WHERE nomResidencia like 'a%ec%'
 
--14. Visualiza todas las residencias cuyo nombre comience en A y su cuarta letra sea A.
SELECT *FROM residencias WHERE nomResidencia like '[a%]__a%'

--15. Visualiza todas las residencias que no pertenezcan a la universidad x.
SELECT *FROM residencias WHERE codUniversidad !=4
SELECT *FROM residencias WHERE not codUniversidad =4
SELECT *FROM residencias WHERE codUniversidad <> 4

--16. Visualiza todas las residencias que su precio sea null
SELECT *FROM residencias WHERE precioMensual is NULL

--17. Visualiza todas las residencias que su director este a null y el precio este entre 500 y 2000
SELECT *FROM residencias WHERE nombreDirector is NULL and precioMensual between 500 and 2000
SELECT *FROM residencias WHERE nombreDirector is NULL and precioMensual >= 500 and precioMensual <= 2000

--18. Visualiza las universidades que tienen alguna residencia, por lo tanto los codigos de universidades que están en la tabla residencias.
SELECT codUniversidad FROM residencias 

--19. Igual al anterior pero que no aparezcan repetidas
SELECT DISTINCT coduniversidad FROM residencias 

--20. Visualiza los codigos de las residencias que tienen alguna estancia. Sin que se repitan estos códigos. Ordenado por el codigo en orden descendente 
SELECT DISTINCT codResidencia FROM estancias ORDER BY codResidencia desc

--21. Visualiza todo los diferentes precios que tienen las residencias. Solo queremos ver los precios, ordenado en orden descendente.
SELECT precioMensual FROM residencias ORDER BY precioMensual desc

--22. Visualiza el nombre de la residencia y el precio. Ordenado por precio descendente y nombre  ascendente
SELECT nomresidencia, preciomensual FROM residencias ORDER BY precioMensual desc, nomresidencia asc

--INTRODUCIR REGISTROS 
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('Zaphire', 4, DEFAULT, 0, DEFAULT, NULL, DEFAULT)
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('Cambridge', 9, DEFAULT, 1, DEFAULT, NULL, DEFAULT)
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('Rubí', 8, DEFAULT, 0, DEFAULT, NULL, DEFAULT)
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('Castañas', 6, DEFAULT, 1, DEFAULT, NULL, DEFAULT)
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('Garajonay', 5, DEFAULT, 0, DEFAULT, NULL, DEFAULT)
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('San Andrés', 3, DEFAULT, 1, DEFAULT, NULL, DEFAULT)
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('Los Wiwis', 2, DEFAULT, 1, DEFAULT, NULL, DEFAULT)
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('Sierra Nevada', 1, DEFAULT, 0, DEFAULT, NULL, DEFAULT)
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('Antártica', 7, DEFAULT, 1, DEFAULT, NULL, DEFAULT)

-- 23. Visualiza todas las residencias que tengan comedor, sean de sexo mixto o femenino y el precio sea menor de 1000 ordenado por precio de menor a mayor

SELECT *FROM residencias WHERE comedor = 1 and genero = 'Mixto' or genero = 'Femenino' and precioMensual <= 1000 ORDER BY precioMensual asc

--24. Visualiza todas las residencias que tengan no tengan comedor , tengan mas de 100 plazas y el precio sea menor de 1000 ordenado por plazas de menor a mayor
SELECT *FROM residencias WHERE comedor = 0 and cantidadPlazas > 100 and precioMensual < 1000 ORDER BY cantidadPlazas asc

--25. Visualiza todas las residencias que el precio mensual esté entre 400 y 900, tengan comedor, sean de sexo mixto o femenino y pertenezcan a la universidad X, Y o Z ordenado por precio de menor a mayor.
SELECT *FROM residencias WHERE precioMensual between 400 and 900 and (comedor = 1) and (genero = 'Mixto' or genero = 'Femenino') and (codUniversidad = 3) ORDER BY precioMensual desc

--26. Visualizar los nombres de residencias, codigos, universidad y directores de aquellas residencias cuyo nombre del director comience por M o por N y contenga una a, ordenado por nombre de director en orden descendente ,
--	  en las cabecera de los campos mostradosvisualizar ‘Nombre Residencia, código de Residencia, código de la universidad a la que pertenece y nombre del director’ 
SELECT nomResidencia as 'Nombre Residencia', codResidencia as 'Código de Residencia', codUniversidad as 'Código de la universidad', nombreDirector as 'Nombre del Director'
FROM residencias 
WHERE nombreDirector like 'm%' or nombreDirector like 'n%' and nombreDirector like '%a%' ORDER BY nombreDirector desc
-- otro modo --
SELECT nomResidencia as 'Nombre Residencia', codResidencia as 'Código de Residencia', codUniversidad as 'Código de la universidad', nombreDirector as 'Nombre del Director'
FROM residencias 
WHERE nombreDirector like '[MN]%a%'

--27. En la tabla estudiante visualiza todos los estudiantes su nombre y dni cuyo dni no cumpla con el siguiente formato -Z siendo el 9 cualquier digito y Z cualquier letra.
SELECT nomEstudiante, dni FROM estudiantes WHERE dni != '[1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9][1-9]-[A-Z]'

--28. Visualiza el nombre y email de los estudiantes Femeninos cuyo email tenga el formato varioscaracteres@educacion.tres caracteres alfabéticos ordenado por email
SELECT nomEstudiante, email FROM estudiantes WHERE sexo = 'F' and email like '%@%correo.[a-z][a-z][a-z]' ORDER BY email

--29. Visualiza el nombre y email de los estudiantes cuyo teléfono comienza por 68 o por 69 y el dni contiene los números 1, 2, y 3
SELECT nomEstudiante, email FROM estudiantes WHERE (telefonoEstudiante like '68%' or telefonoEstudiante like '69%') and dni like '%1%' and dni like '%2%' and dni like '%3%'
SELECT nomEstudiante, email FROM estudiantes WHERE telefonoEstudiante like '6[8-9]%' and dni like '%1%' and dni like '%2%' and dni like '%3%'
SELECT *FROM estudiantes

--30. Visualiza todas las estancias cuyo fechaFin sea mayor al día actual. Utiliza getdate()
SELECT *FROM estancias WHERE fechaFin > GETDATE()

--31. Visualiza todas las estancias el código del estudiante, el código de residencia , fecha de inicio y fecha fin así como la cantidad de días desde la fecha inicio a la fecha fin. Para ello utiliza la función datediff(dd,fechainicio,fechafin), pon alias a esta columna.
SELECT codEstudiante, codResidencia, fechaInicio, fechaFin, DATEDIFF(DD, fechaInicio,fechaFin) as 'Diferencia de días' FROM estancias

--32. Igual al anterior y además visualiza la diferencia entre esas fecha en meses, y también en años.
SELECT codEstudiante, codResidencia, fechaInicio, fechaFin, DATEDIFF(DD, fechaInicio,fechaFin) as 'Diferencia de días', DATEDIFF(MM, fechaInicio,fechaFin) as 'Diferencia de meses', DATEDIFF(YY, fechaInicio,fechaFin) as 'Diferencia de años' FROM estancias

--33. Visualiza todas las estancias y la cantidad de días de cada una desde su fecha de fin hasta el día actual, ordenado por este ultimo campo.
SELECT codEstudiante, codResidencia, fechaInicio, fechaFin, DATEDIFF(DD, fechaInicio,GETDATE()) as 'Diferencia de días' FROM estancias ORDER BY DATEDIFF(DD, fechainicio, GETDATE()) 

--34. Visualiza las estancias cuya fecha de inicio sea en el año actual, usa la funcion year.
SELECT *FROM estancias WHERE YEAR(fechainicio) = YEAR(GETDATE())

--35. Visualiza las estancias de menos de 2 meses desde su fecha de inicio a fin ordenado por código de estudiante y cuyo precio pagado sea menor de 1000
SELECT *FROM estancias WHERE DATEDIFF(MM, fechaInicio, fechaFin) < 25 and precioPagado < 4000 ORDER BY codEstudiante 

--36. Visualiza todas las estancias del estudiante con código X y del estudiante con código Y, con observaciones vacías y el comienzo de la estancia sea en los meses 9 o 10 Ordenado por código estudiante y fecha inicial
SELECT *FROM estancias WHERE (codEstudiante = 2 or codEstudiante = 4) and (observaciones IS NOT NULL) and MONTH(fechainicio) in (9,19) ORDER BY codEstudiante, fechainicio 
SELECT *FROM estancias WHERE (codEstudiante = 2 or codEstudiante = 4) and (observaciones IS NOT NULL) and MONTH(fechainicio) = 10 or MONTH(fechainicio) = 9 ORDER BY codEstudiante, fechainicio 

--37. Queremos conocer en la residencia con código X, Y o Z cuales son los codigos de los estudiantes que han estado en esas residencias, ordenado por código de residencia
SELECT codEstudiante FROM estancias WHERE (codResidencia = 4 or codResidencia = 2 or codResidencia = 3) ORDER BY codEstudiante

--38. Visualiza el código de residencia, del estudiante, la fecha inicio, el preciopagado y el precio pagado incrementado en 10% del precio pagado siempre y cuando el precio pagado esté entre 500 y 1000
SELECT codresidencia, codestudiante, fechaInicio, precioPagado, precioPagado * 1.1 as 'Precio incrementado en 10%' FROM estancias WHERE precioPagado between 500 and 1000
SELECT codresidencia, codestudiante, fechaInicio, precioPagado, precioPagado * 1.1 as 'Precio incrementado en 10%' FROM estancias WHERE precioPagado between 2000 and 4000

--39. Visualiza todos los datos de las estancias de las habitaciones con numero 100, 1, 50, 2 y 5. ordenado por numhabitacion.
SELECT *FROM estancias WHERE numHabitacion = 100 or numHabitacion = 1 or numHabitacion = 50 or numHabitacion = 2 or numHabitacion = 5 ORDER BY numHabitacion

--40. Visualiza todas las estancias con fecha de inicio entre el 1-6-2022 y el 1-10-2022 y la fecha de fin estaría entre el 1-6-2023 y el 1-9-2023
SELECT *FROM estancias WHERE fechaInicio between '1-6-2022' and '1-1-2029' and fechaFin between '1-6-2023' and '1-9-2029'

--41. Visualiza todas las estancias que no tengan su fecha de inicio entre el 1-1-2022 y el 1-9-2022
SELECT *FROM estancias WHERE (fechaInicio not between '1-1-2027' and '1-9-2028')
