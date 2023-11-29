USE residencias_escolares

--1. Visualiza todas las residencias con comedor ordenas por nombre
SELECT *FROM residencias WHERE comedor = 1 ORDER BY nomresidencia

--2. Cuantas residencias tienen comedor
SELECT COUNT(codResidencia) as 'Residencias con comedor' FROM residencias WHERE comedor = 1
SELECT COUNT(codResidencia) FROM residencias WHERE comedor = 1 

--3. De las residencias con comedor Cuantas pertenecen a la universidad x
SELECT *FROM residencias WHERE comedor = 1 and codUniversidad = 3

--4. Cuantas residencias con comedor y pertenecen a la universidad x
SELECT COUNT(codResidencia) as 'Residencias con comedor' FROM residencias WHERE comedor = 1 and codUniversidad = 3

--5. De las residencias con comedor, ¿cual tiene más plazas?
SELECT TOP 1 nomResidencia, cantidadPlazas FROM residencias WHERE comedor = 1 ORDER BY cantidadPlazas desc

--6 De las residencias con comedor, ¿cuáles son las 3 residencias que tienen más plazas?
SELECT TOP 3 nomResidencia, cantidadPlazas FROM residencias WHERE comedor = 1 ORDER BY cantidadPlazas desc

--7. De las residencias con comedor, ¿cuáles son las residencias que tienen más plazas, las 3 mayores cantidad de plazas?
SELECT TOP 3 with TIES nomResidencia, cantidadPlazas FROM residencias WHERE comedor = 1 ORDER BY cantidadPlazas desc

--8. De la universidad x cual es el total de plazas que hay , contando las de todas las residencias de dicha universidad
SELECT *FROM residencias WHERE codUniversidad = 3
SELECT SUM(cantidadPlazas) as 'Cantidad de Plazas' FROM residencias WHERE codUniversidad = 3 
SELECT SUM(cantidadPlazas) as 'Cantidad de Plazas', codUniversidad FROM residencias WHERE codUniversidad = 3 GROUP BY codUniversidad

SELECT *FROM residencias WHERE codUniversidad = 2
SELECT SUM(cantidadPlazas) as 'Cantidad de Plazas' FROM residencias WHERE codUniversidad = 2 
SELECT SUM(cantidadPlazas) as 'Cantidad de Plazas', codUniversidad FROM residencias WHERE codUniversidad = 2 GROUP BY codUniversidad

--9. De las residencias mixtas y con comedor, cuanto es el total de plazas que hay
SELECT SUM(cantidadPlazas) as 'Cantidad de Plazas' FROM residencias WHERE genero = 'mixto' and comedor = 1
SELECT SUM(cantidadPlazas) as 'Cantidad de Plazas', codUniversidad FROM residencias WHERE genero = 'mixto' and comedor = 1 GROUP BY codUniversidad

--10. Que residencias contienen en su nombre ‘ca’ ordenalas por nombre descendente
SELECT *FROM residencias WHERE nomResidencia like '%ca%' ORDER BY nomResidencia asc

--11. Cuantas residencias hay que no son mixtas
SELECT COUNT(codResidencia) as 'Residencias no mixtas' FROM residencias WHERE genero != 'mixto' 

--12. Visualiza de cada universidad (codigo universidad ) el total de plazas que oferta en sus residencias.
SELECT SUM(cantidadPlazas) as 'Cantidad de Plazas', codUniversidad FROM residencias GROUP BY codUniversidad

--13. Cual es la universidad o universidades que más plazas ofertan
SELECT TOP 1 with TIES SUM(cantidadPlazas) as 'Cantidad de Plazas', codUniversidad 
FROM residencias
GROUP BY codUniversidad 
ORDER BY [Cantidad de Plazas] desc

--14. Cual es la universidad o universidades que ofertan en total tienen mas de 100 plazas
SELECT TOP 1 with TIES SUM(cantidadPlazas) as 'Cantidad de Plazas', codUniversidad 
FROM residencias
GROUP BY codUniversidad 
HAVING SUM(cantidadPlazas) > 100
ORDER BY [Cantidad de Plazas] desc

--15. Cual es la universidad o universidades que ofertan más plazas de genero mixto
SELECT TOP 1 with TIES SUM(cantidadPlazas) as 'Cantidad de Plazas', codUniversidad 
FROM residencias
WHERE genero = 'Mixto'
GROUP BY codUniversidad 
ORDER BY [Cantidad de Plazas] desc

--16. Cual es la universidad o universidades que ofertan más plazas de genero mixto y en total tienen mas de 100 plazas
SELECT TOP 1 with TIES SUM(cantidadPlazas) as 'Cantidad de Plazas', codUniversidad 
FROM residencias
WHERE genero = 'Mixto'
GROUP BY codUniversidad 
HAVING SUM(cantidadPlazas) > 100
ORDER BY [Cantidad de Plazas] desc

--17. Visualiza las residencias (su código) y la cantidad de estancias que tienen
SELECT *FROM estancias 
SELECT codResidencia FROM estancias GROUP BY codResidencia

--18. Visualiza de las estancias el código de la residencia y cuantos estudiantes diferentes ha tenido cada una
SELECT codResidencia, COUNT(DISTINCT codEstudiante) as 'Número de estudiantes' FROM estancias GROUP BY codResidencia 

--19. Visualiza todas las estancias , todos sus datos y además la cantidad de días de cada una de las estancias. Para ello utiliza el comando datediff
SELECT codEstudiante, codResidencia, fechainicio, fechafin, preciopagado, observaciones, numHabitacion, DATEDIFF(DD, fechainicio, fechaFin) as 'Diferencia de días' FROM estancias 
