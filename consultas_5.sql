USE residencias_escolares

--1. Visualiza los codigos de las universidades y el precio mensual medio de cada universidad
SELECT *FROM universidades 
SELECT codUniversidad, AVG(preciomensual) as 'Precio medio mensual' FROM residencias GROUP BY codUniversidad

--2 Visualiza los codigos de las universidades y el precio mensual medio de cada universidad ,
-- pero no contabilizar aquellas residencias que no tienen director , ordenalo por la media del preciomensual
SELECT codUniversidad, AVG(preciomensual) as 'Precio medio mensual' FROM residencias WHERE nombreDirector is not null GROUP BY codUniversidad ORDER BY [Precio medio mensual] 

--3. Visualiza los codigos de las universidades y el precio mensual medio de cada universidad pero solo aquellas universidades que su precio mensual es menor de 500
SELECT codUniversidad, AVG(preciomensual) as 'Precio medio mensual' FROM residencias WHERE precioMensual < 500
GROUP BY codUniversidad ORDER BY [Precio medio mensual] 

--4  Visualiza los codigos de las universidades y el precio mensual medio de cada universidad ,
--	pero no contabilizar aquellas residencias que no tienen director ni tampoco cuando la media
--	de su precio mensula sea menos de 500, ordenalo por la media del preciomensual
SELECT codUniversidad, AVG(preciomensual) as 'Precio medio mensual' FROM residencias 
WHERE precioMensual < 500 and nombreDirector is not null
GROUP BY codUniversidad ORDER BY [Precio medio mensual] 

-- 5 Cual es la universidad que su media de los preciomensual de sus residencias sea la mayor
SELECT TOP 1 codUniversidad, AVG(preciomensual) as 'Precio medio mensual' FROM residencias 
GROUP BY codUniversidad ORDER BY [Precio medio mensual] desc

-- 6. Cual es la universidad que su media de los preciomensual de sus residencias sea la mayor, si hay varias con el mismo precio mayor también visualizarlas
SELECT TOP 1 with TIES codUniversidad, AVG(preciomensual) as 'Precio medio mensual' FROM residencias 
GROUP BY codUniversidad ORDER BY [Precio medio mensual] desc

-- 7 Visualiza cuantos generos diferentes hay en las residencias
SELECT COUNT(DISTINCT genero) as 'Géneros distintos de las residencias' FROM residencias 

-- 8 Visualiza cuantas residencias hay con comedor, genero mixto y precio mensual mayor de 400
SELECT COUNT(codresidencia) as 'Número de residencias con las condiciones' FROM residencias WHERE comedor = 1 and genero = 'Mixto' and precioMensual > 400

--9  Cuantas residencias su nombre comienza por R
SELECT COUNT(codresidencia) as 'Número de residencias con las condiciones' FROM residencias WHERE nomResidencia = 'R%'

--10 Cuantas estancias hay en el año actual. Utiliza la funcion getdate() para obtener el dia actual y year() para obtener el año de una fecha determinada
SELECT COUNT(codresidencia) as 'Número de residencias con las condiciones' FROM estancias WHERE YEAR(fechaInicio) = YEAR(GETDATE())

--11. cuantas residencias hay en cada universidad, queremos saber la cantidad de residencias con comedor y sin comedor
SELECT COUNT(codResidencia) as 'Número de residencias en cada universidad' FROM residencias 
WHERE comedor = 1 and comedor = 0
GROUP BY codUniversidad -- no he entendido el enunciado
 
-- 12. Cuantas residencias hay por universidades y genero
SELECT COUNT(codResidencia) as 'Número de residencias en cada universidad' FROM residencias 
GROUP BY genero, codUniversidad

--13  Cuantas plazas hay por universidad y genero. Ordenado por cantidad de plazas
SELECT genero, SUM(cantidadPlazas) as 'Número de plazas en cada universidad' FROM residencias 
GROUP BY genero, codUniversidad
ORDER BY [Número de plazas en cada universidad]
