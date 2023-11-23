USE residencias_escolares

--1.  Visualiza las 3 residencias con precios mas caros
SELECT TOP 3 *FROM residencias ORDER BY precioMensual desc

--2. Visualiza todas las residencias que estén entre los 3 precios más caros.
SELECT TOP 3 with ties *FROM residencias ORDER BY precioMensual desc

--3. Visualiza la estancia que tiene un preciopagado menor
SELECT TOP 1 *FROM estancias ORDER BY precioPagado asc

--4. Visualiza todas las estancias que se pague el menor precio
SELECT TOP 1 with ties *FROM estancias ORDER BY precioPagado asc

--5. Visualiza el 10% de las estancias que mas se ha pagado, visualiza todos los datos
SELECT TOP 10 percent *FROM estancias ORDER BY preciopagado desc

--6. Visualiza cuántas residencias tenemos en total
SELECT COUNT(codResidencia) as 'Número de residencias' FROM residencias

--7. Visualiza cuantas residencias tenemos de la universidad con codigo X
SELECT COUNT(codResidencia) 'Número de residencias con código x' FROM residencias WHERE codUniversidad = 3

--8. Visualiza el sumatorio de los precios pagados en las estancias de la residencia X
SELECT SUM(preciopagado) as 'Precio pagado total' FROM estancias WHERE codResidencia = 2
SELECT *FROM estancias

--9. Visualiza cuantas estancias tenemos de la residencia X
SELECT COUNT(codResidencia) as 'Número de residencias' FROM estancias WHERE codResidencia = 4

--10. Cuál es la estancia que más se ha pagado
SELECT TOP 1 *FROM estancias ORDER BY precioPagado desc

--11. La que menos
SELECT TOP 1 *FROM estancias ORDER BY precioPagado asc
	
--12. Cuántas estancias han habido en total
SELECT COUNT(*) as 'Número de estancias' FROM estancias

--13. Cuántas estancias de la residencia X han habido en total
SELECT COUNT(codResidencia) 'Número de estancias' FROM estancias WHERE codResidencia = 2

--14. Cuántas residencias diferentes han tenido alguna estancias. Me refiero que cada residencia solo se cuente una vez
SELECT COUNT(DISTINCT codResidencia) as 'Número de residencias' FROM estancias
SELECT *FROM estancias

--15. Cuántos alumnos diferentes han tenido estancias
SELECT COUNT(codEstudiante) 'Número de estudiantes' FROM estancias 
