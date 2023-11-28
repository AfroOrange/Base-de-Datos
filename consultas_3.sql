USE residencias_escolares

--1. Visualiza todos los estudiantes de sexo M
SELECT *FROM estudiantes WHERE sexo ='M'

--2. Visualiza cuantos estudiantes hay de sexo M+
SELECT COUNT(codEstudiante) as 'Número de estudiantes M' FROM estudiantes WHERE sexo = 'M'

--3. Visualiza todos los sexos y las cantidades de estudiantes que hay de cada sexo. 
SELECT sexo as 'Sexo del estudiante', COUNT(codEstudiante) as 'Cantidad de estudiantes'
FROM estudiantes 
GROUP BY sexo

--4. Visualiza todos los sexos y las cantidades de estudiantes que hay de cada sexo, de aquellos estudiantes que su dni contenga el 4
SELECT sexo as 'Sexo del estudiante', COUNT(codEstudiante) as 'Cantidad de estudiantes'
FROM estudiantes
WHERE dni like '%4%'
GROUP BY sexo

--5. Visualiza los codigos de las universidades y la cantidad de residencias que tiene cada universidad ordenado por la cantidades 
SELECT codUniversidad, COUNT(codResidencia) as 'Cantidad de residencias'
FROM residencias
GROUP BY codUniversidad
ORDER BY 'cantidad de residencias' asc

-- Ordenar por Universidad
SELECT codUniversidad, COUNT(codResidencia) as 'Cantidad de residencias'
FROM residencias
GROUP BY codUniversidad
ORDER BY codUniversidad desc

--6. visualiza los codigos de las universidades y la cantidad de residencias de la universidad que tenga una menor cantidad de residencias,
--   si hay varias universidades con la misma cantidad de plazas también se deberán visualizar. 
SELECT TOP 1 with TIES codUniversidad, COUNT(codResidencia) as 'Cantidad de residencias'
FROM residencias
GROUP BY codUniversidad
ORDER BY 'cantidad de residencias' asc

SELECT *FROM residencias ORDER BY codUniversidad

--7. Visualiza el 10 porciento de las universidades (sus códigos) con la cantidad de residencias que tiene cada uno pero aquellas que mas residencias tengan 
SELECT TOP 10 PERCENT coduniversidad, COUNT(codResidencia) as 'Cantidad de residencias'
FROM residencias
GROUP BY codUniversidad
ORDER BY 'Cantidad de residencias' desc

--8. Visualiza las universidades (codigo) y la cantidad de residencias de cada una pero solo de aquellas que tengan mas de 1 residencia 
SELECT codUniversidad, COUNT(codResidencia) as 'Cantidad de residencias'
FROM residencias
GROUP BY codUniversidad
HAVING COUNT(codResidencia) > 1
ORDER BY 'cantidad de residencias' asc

--wiwi
SELECT coduniversidad, COUNT(codResidencia) as 'Cantidad de residencias con comedor'
FROM residencias
WHERE genero = 'mixto'
GROUP BY codUniversidad
HAVING COUNT(codResidencia) > 1
ORDER BY 'Cantidad de residencias con comedor' desc

--9. Visualiza las universidades (codigo) y la cantidad de residencias de cada una pero solo de aquellas que tengan comedor 
SELECT coduniversidad, COUNT(codResidencia) as 'Cantidad de residencias con comedor'
FROM residencias
WHERE comedor = 1 
GROUP BY codUniversidad
ORDER BY 'Cantidad de residencias con comedor' desc

--10. Visualiza las universidades (codigo) y la cantidad de residencias de cada una , la media de su precio, pero solo de aquellas que tengan comedor,
--    su precio sea menor o igual a 1000 ordenado por universidad
SELECT coduniversidad, COUNT(codResidencia) as 'Cantidad de residencias con comedor', AVG(preciomensual) as 'Media del precio'
FROM residencias
WHERE comedor = 1 and precioMensual <= 1000
GROUP BY codUniversidad
ORDER BY 'Cantidad de residencias con comedor' desc
