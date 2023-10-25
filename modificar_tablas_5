USE residencias_escolares

ALTER TABLE residencias
ADD CONSTRAINT DF_cantidadPlazas DEFAULT (100) FOR cantidadPlazas;

-- Inserta un registro en residencias con precioMensual y genero sus valores por defecto
INSERT INTO residencias (nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero) VALUES ('Las Margaritas', 4, 190, 0, DEFAULT, 'Ernesto Gutierrez', DEFAULT)
SELECT *FROM residencias

--Inserta un estudiante con sexo por defecto
INSERT INTO estudiantes (codEstudiante, nomEstudiante, dni, telefonoEstudiante, email, sexo) VALUES (6, 'Daniel Martín', '29328388', '922401202', 'danielmar@correo.com', DEFAULT)
SELECT *FROM estudiantes

--Haz una copia de la tabla residencias con "select into" en una nueva tabla llamada residencias_copia
SELECT codResidencia, nomResidencia, codUniversidad, precioMensual, comedor, cantidadPlazas, nombreDirector, genero
INTO residencia_copia
FROM residencias

--Haz una copia de la tabla estancias con select into en una nueva tabla llamada estancias_copia
SELECT codEstudiante, codResidencia, fechaInicio, fechaFin, precioPagado, observaciones, numHabitacion
INTO estancias_copia
FROM estancias

--En la tabla residencias_copia elimina la ultima residencia insertada
SELECT *FROM residencia_copia 
DELETE FROM residencia_copia WHERE codResidencia=17

--Enlaza con claves foraneas estas dos tablas creadas
ALTER TABLE residencia_copia
ADD CONSTRAINT PK_codResidencia_copia PRIMARY KEY (codResidencia)

ALTER TABLE estancias_copia
ADD CONSTRAINT PK_estancias_copia PRIMARY KEY(codEstudiante, codResidencia, fechaInicio)

ALTER TABLE estancias_copia
ADD CONSTRAINT FK_codResidencia_copia FOREIGN KEY (codResidencia) REFERENCES residencia_copia(codResidencia)

--En la tabla residencias_copia intenta eliminar una residencia que esté en estancias
SELECT *FROM residencia_copia
DELETE FROM residencia_copia WHERE codResidencia=8

--Elimina de estancias_copia todos los registros, hazlo de dos modos
SELECT *FROM estancias_copia
DELETE FROM estancias_copia

INSERT INTO estancias_copia (codEstudiante, codResidencia, fechaInicio, fechaFin, precioPagado, observaciones, numHabitacion) VALUES (1, 3, '3-3-23', '2-5-12', 340, 'Sin ningún problema', DEFAULT)
INSERT INTO estancias_copia (codEstudiante, codResidencia, fechaInicio, fechaFin, precioPagado, observaciones, numHabitacion) VALUES (3, 2, '3-3-23', '2-5-12', 340, 'Sin ningún problema', DEFAULT)
INSERT INTO estancias_copia (codEstudiante, codResidencia, fechaInicio, fechaFin, precioPagado, observaciones, numHabitacion) VALUES (5, 3, '3-3-23', '2-5-12', 340, 'Sin ningún problema', DEFAULT)
SELECT *FROM estancias_copia
DELETE FROM estancias_copia	WHERE codEstudiante=1 OR codEstudiante=3 OR codEstudiante=5

--Inserta a la tabla estancias_copia todos los registros que están en la tabla estancias_copia
INSERT INTO estancias_copia (codEstudiante, codResidencia, fechaInicio, fechaFin, precioPagado, observaciones, numHabitacion)
SELECT codEstudiante, codResidencia, fechaInicio, fechaFin, precioPagado, observaciones, numHabitacion
FROM estancias

SELECT *FROM estancias_copia

--Modifica el nombre residencia a la residencia con codigo X en la tabla residencias_copia
SELECT *FROM residencia_copia
UPDATE residencia_copia
SET nomResidencia = 'El océano'
WHERE nomResidencia = 'Las estrellas';

--En la tabla residencias_copia incrementa en 10 el precio a todas las residencias
SELECT *FROM residencia_copia
UPDATE residencia_copia
SET precioMensual = precioMensual + 100

--En la tabla residencias_copia incrementa el precio a todas las residencias en un 10%
SELECT *FROM residencia_copia
UPDATE residencia_copia
SET precioMensual = precioMensual * 1.1;

--En la tabla residencias_copia incrementa el precio en 15 a todas las residencias de genero masculino
SELECT *FROM residencia_copia
UPDATE residencia_copia
SET precioMensual = precioMensual + 15 WHERE genero = 'Masculino'

--Modifica el precio a la residencia con codigo x en residencias_copia
SELECT *FROM residencia_copia
UPDATE residencia_copia
SET precioMensual = 350
WHERE precioMensual = 396;

-- Modifica el precio en la tabla estancias_copia a la residencia x , estudiante X y fecha de inicio X
SELECT *FROM estancias_copia
UPDATE estancias_copia
SET codEstudiante =  7, fechainicio = '26-11-28'
WHERE codEstudiante = 1 and fechainicio = '28-11-27'

--Incrementa el precio en 5 a todas las estancias de la residencia x
SELECT *FROM residencias
UPDATE residencias
SET precioMensual = precioMensual + 5
WHERE codResidencia = 4

--Decrementa el precio en 10 a todas las estancias del estudiante x
SELECT *FROM estancias
UPDATE estancias
SET precioPagado = precioPagado - 10
WHERE codEstudiante = 4
