--1. Visualiza todas las residencias y los nombres de las universidades en la que se encuentra cada una ordenada por nombre de universidades
SELECT residencias.*, nomuniversidad FROM residencias inner join universidades on residencias.codUniversidad = universidades.codUniversidad order by nomUniversidad 

--2. Visualiza todas las residencias y los nombres de las universidades en la que se encuentra 
-- cada una ordenada por nombre de universidades, pero solo aquellas que pertenezcan a la universidad con nombre X
SELECT residencias.*, nomuniversidad FROM residencias inner join universidades on residencias.codUniversidad = universidades.codUniversidad
WHERE nomUniversidad like 'Universidad de Barcelona' order by nomUniversidad 

-- 3. Visualiza todas las residencias y los nombres de las universidades en la que se encuentra
-- cada una, pero solo aquellas residencias que tengan mas de 100 plazas ordenado por nombre residencia.
SELECT residencias.*, nomUniversidad from residencias inner join universidades on residencias.codUniversidad=universidades.codUniversidad 
where cantidadPLazas > 100 order by nomResidencia 

-- 4. Visualiza la residencia , el nombre de la residencia, la cantidad de plazas y nombre de la
-- universidad , pero solo quiero ver las que menos plazas tienen.
SELECT top 1 with ties residencias.*, nomUniversidad from residencias inner join universidades on residencias.codUniversidad=universidades.codUniversidad order by cantidadPlazas asc 

--5. Visualiza todos los datos de las residencias y todas las estancias que tiene cada una ordenado por nombre de residencias
SELECT residencias.*, estancias.*  FROM residencias inner join estancias on residencias.codResidencia = estancias.codEstudiante ORDER BY nomResidencia

-- 6. Visualiza todos los datos de los estudiantes y todas las estancias de cada uno , pero solo aquellos cuya fecha inicio sea en el año X
SELECT estudiantes.*, estancias.* FROM estudiantes inner join estancias on estudiantes.codEstudiante = estancias.codEstudiante WHERE YEAR(fechaInicio) = 2027
SELECT estudiantes.*, estancias.* FROM estudiantes inner join estancias on estudiantes.codEstudiante = estancias.codEstudiante WHERE YEAR(estancias.fechaInicio) = 2027

--7. Visualiza los nombre de las universidades y las cantidades de residencias que tiene cada universidad
SELECT nomuniversidad, COUNT(codResidencia) as 'Número de residencias' FROM universidades inner join residencias on universidades.codUniversidad = residencias.codResidencia
GROUP BY nomUniversidad, universidades.codUniversidad

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
--1. Visualiza el nombre del estudiante , el nombre de la residencia y las fechas en las cuales los
--   estudiantes realizan sus estancias ordenado por nombre de estudiante
SELECT estudiantes.nomestudiante, residencias.nomResidencia, estancias.fechainicio, estancias.fechaFin FROM estudiantes inner join estancias on estudiantes.codEstudiante = estancias.codEstudiante
inner join residencias on residencias.codResidencia = estancias.codResidencia ORDER BY nomEstudiante

-- 2. Visualiza el nombre del estudiante , el nombre de la universidad y las fechas en las cuales
-- los estudiantes realizan sus estancias ordenado por nombre de universidad.
SELECT nomestudiante , nomuniversidad , fechainicio , fechafin FROM estudiantes 
inner join estancias on estancias.codEstudiante = estudiantes.codEstudiante 
inner join residencias on residencias.codResidencia = estancias.codResidencia
inner join universidades on universidades.codUniversidad = residencias.codUniversidad
ORDER BY nomUniversidad 

--3. Visualiza el sexo y la cantidad de estudiantes de cada uno de los sexos que han realizado estancias.
SELECT sexo, COUNT(estancias.codEstudiante) as 'Cantidad de Estancias por sexo' FROM estudiantes
inner join estancias on estudiantes.codEstudiante = estancias.codEstudiante
GROUP BY sexo

--4. Queremos conocer el nombre de la universidad, el genero de la residencia y la cantidad de
--  estancias que hay de cada universidad y genero ordenado por nombre de universidad
SELECT nomuniversidad as 'Universidad', genero, COUNT(estancias.codresidencia) as 'Cantidad de estancias' FROM universidades
inner join residencias on universidades.codUniversidad = residencias.codUniversidad
inner join estancias on residencias.codResidencia = estancias.codResidencia
GROUP BY genero, nomUniversidad, universidades.codUniversidad ORDER BY nomUniversidad

--5 Cual es el nombre de la universidad y genero con mas estancias
SELECT TOP 1 nomuniversidad, genero, COUNT(codresidencia) as 'Número de estancias' FROM universidades
inner join residencias on universidades.codUniversidad = residencias.codUniversidad
GROUP BY nomUniversidad, genero, universidades.codUniversidad ORDER BY [Número de estancias]

--6. Visualiza todas las universidades y los nombres de las residencias que tiene cada una
-- incluidas aquellas universidades que no tengan ninguna residencia
SELECT nomuniversidad, nomresidencia FROM universidades 
left join residencias on universidades.codUniversidad = residencias.codUniversidad

--7. Visualiza las universidades que no tienen ninguna residencia
SELECT nomuniversidad, nomresidencia FROM universidades 
left join residencias on universidades.codUniversidad = residencias.codUniversidad 
WHERE codResidencia is NULL

--8. Cuantas universidades no tienen ninguna residencia
SELECT COUNT(universidades.codUniversidad) as 'Número de universidades sin residencia' FROM universidades 
left join residencias on universidades.codUniversidad = residencias.codUniversidad 
WHERE codResidencia is NULL 

--9 Visualiza los estudiantes que no han realizado ninguna estancias
SELECT nomestudiante, codResidencia FROM estudiantes
left join estancias on estudiantes.codEstudiante = estancias.codEstudiante
WHERE codResidencia is NULL

--10 De los estudiantes con sexo X, cuantos no han realizado ninguna estancia
SELECT COUNT(sexo) as 'Número de estudiantes de sexo x sin residencia', codresidencia FROM estudiantes 
left join estancias on estudiantes.codEstudiante = estancias.codEstudiante
WHERE codResidencia IS NULL and sexo = 'M'
GROUP BY sexo, codResidencia

SELECT COUNT(sexo) as 'Número de estudiantes de sexo x sin residencia' FROM estudiantes 
left join estancias on estudiantes.codEstudiante = estancias.codEstudiante
WHERE codResidencia IS NULL and sexo = 'M' --mejor sin GROUP BY

--INSERTS
insert into estudiantes (codestudiante, nomestudiante, dni, telefonoestudiante, email, sexo) values (12, 'Pablo Morín', '23921721', 772598271, NULL, 'M')
insert into estudiantes (codestudiante, nomestudiante, dni, telefonoestudiante, email, sexo) values (15, 'Agustín Hernández', '12021721', 733598271, NULL, 'M')

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
-- Visualiza el nombre de la universidad, el nombre de la residencia y lo que se ha pagado en cada una de las estancias realizadas. 
SELECT nomuniversidad, nomresidencia, preciopagado FROM universidades
inner join residencias on universidades.codUniversidad = residencias.codUniversidad
inner join estancias on residencias.codResidencia = estancias.codResidencia
