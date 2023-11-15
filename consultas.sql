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

--23. Visualiza el nombre de la residencia y el precio. Ordenado por precio descendente y nombre  ascendente
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
