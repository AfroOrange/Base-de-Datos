USE agenda;

ALTER TABLE contactos
ADD CONSTRAINT CK_CodigoPostal CHECK (CodigoPostal like '[0-9][0-9][0-9][0-9][0-9]')

ALTER TABLE contactos
ADD CONSTRAINT CK_telefono CHECK (telefono like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

ALTER TABLE contactos 
ADD deuda DECIMAL (7,2) CONSTRAINT DF_deuda DEFAULT(0)

ALTER TABLE contactos 
ADD CONSTRAINT CK_deuda CHECK (deuda >= 0)

--INSERTAR 5 REGISTROS EN PROVINCIAS
INSERT INTO provincias (nombreprovincia, tamanoprovincia) VALUES ('Santa Cruz de Tenerife', 100.5)
INSERT INTO provincias (nombreprovincia, tamanoprovincia) VALUES ('Las Palmas de Gran Canaria', 235.2)
INSERT INTO provincias (nombreprovincia, tamanoprovincia) VALUES ('Madrid', 418.9)
INSERT INTO provincias (nombreprovincia, tamanoprovincia) VALUES ('Cataluña', 358.3)
INSERT INTO provincias (nombreprovincia, tamanoprovincia) VALUES ('Galicia', 521.3)

SELECT *FROM provincias

--INSERTAR 5 REGISTROS EN CATEGORÍAS
INSERT INTO categorias (categoria, descripcion) VALUES ('Amig', 'Aquí van los datos de mis amigos')
INSERT INTO categorias (categoria, descripcion) VALUES ('Fami', 'Aquí van los datos de mis familiares')
INSERT INTO categorias (categoria, descripcion) VALUES ('Trab', 'Aquí van los datos de mis compañeros de trabajo')
INSERT INTO categorias (categoria, descripcion) VALUES ('Gym', 'Aquí van los datos de mis compañeros del gimnasio')
INSERT INTO categorias (categoria, descripcion) VALUES ('Viaj', 'Aquí van los datos que voy a necesitar para viajar')

SELECT *FROM categorias

--INSERTAR 5 REGISTROS EN CONTACTOS
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria) VALUES ('Marta', 'Gómez', '9320484282', '926232781', 'margom@correo.com', '07-06-98', 'Avenida Trinidad', 'La Laguna', 15, '38202', 'Amig')
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria) VALUES ('Javier', 'Martínez', '9320484282', '926232781', 'javmar@correo.com', '28-08-92', 'Calle Miguel Méndez', 'Jinamar', 25, '90218', 'Fami')
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria) VALUES ('Nicolás', 'Ramírez', '9320484282', '926232781', 'nicram@correo.com', '11-02-82', 'Camino Bajo', 'Vigo', 40, '67231', 'Trab')
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria) VALUES ('Sabrina', 'Gutiérrez', '6820484282', '926230161', 'sabgut@correo.com', '10-12-96', 'Urbanización Monte Alto', 'Vallecas', 30, '82713', 'Gym')
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria) VALUES ('Ana', 'García', '7326684282', '926233191', 'anagar@correo.com', '15-09-99', 'Calle Ciprés', 'Barcelona', 35, '72512', 'Viaj')

SELECT *FROM contactos

--INSERTAR DATO ERRÓNEO
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria) VALUES ('Ana', 'García', '7326684282', '926233191', 'anagar@correo.com', '15-09-99', 'Calle Ciprés', 'Barcelona', 35, 'a1234', 'Viaj')

--INSERTAR CONTACTO CON DEUDA NEGATIVA (NO SE PUEDE)
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria, deuda) VALUES ('Ana', 'García', '7326684282', '926233191', 'anagar@correo.com', '15-09-99', 'Calle Ciprés', 'Barcelona', 35, '72512', 'Viaj', -100)

--INSERTAR CONTACTO CON VALOR DEUDA POR DEFECTO
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria, deuda) VALUES ('Miguel', 'García', '7326684282', '926233191', 'miggar@correo.com', '15-09-99', 'Calle Roble', 'Girona', 35, '42512', 'Viaj', DEFAULT)

SELECT *FROM contactos

--ASIGNAR AL CP UN VALOR POR DEFECTO
ALTER TABLE contactos
DROP CONSTRAINT DF_codpostal

ALTER TABLE contactos 
ADD CONSTRAINT DF_CodigoPostal DEFAULT (38000) for CodigoPostal

--Inserta un contacto con fecha de cumple 10/10/2010
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria) VALUES ('Francisco', 'Díaz', '7321984282', '926233001', 'frandia@correo.com', '10/10/2010', 'Calle Almudena', 'Tarragona', 35, DEFAULT, 'Amig')

--Inserta un contacto poniendo la fecha del cumple el día actual, para ello utiliza la función getdate()
INSERT INTO contactos (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria) VALUES ('Francisco', 'Díaz', '7321984282', '926233001', 'frandia@correo.com', GETDATE(), 'Calle Almudena', 'Tarragona', 35, DEFAULT, 'Amig')

ALTER TABLE contactos
DROP CONSTRAINT CK_fechacumple

--Modifica al contacto x la fecha de cumple
SELECT *FROM contactos
UPDATE contactos 
SET fechacumple = '10-02-1994'
WHERE id_contacto = 16

--Modíficale al contacto x la provincia , la categoría y el código postal
UPDATE contactos
SET provincia = 30, categoria = 'Gym', CodigoPostal = DEFAULT 
WHERE id_contacto = 28

--A todos los contactos de la categoría X descuéntales la deuda en un 20 %, pero solo a los que tengan alguna deuda, si la deuda es 0 a esos no le descuentes nada
UPDATE contactos 
SET deuda = deuda - 2.2 
WHERE deuda > 0 

--Crea la tabla contactos_copia que tendrá la misma estructura que la tabla contactos y no tendrá ningún registro
SELECT id_contacto, nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria, deuda
INTO contactos_copia 
FROM contactos

SELECT *FROM contactos_copia
TRUNCATE TABLE contactos_copia

--Insertale los contactos que están en la tabla contactos los que no tengan deuda
INSERT INTO contactos_copia (nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria, deuda)
SELECT nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria, deuda 
FROM contactos
WHERE deuda = 0

--Visualiza de la tabla contactos_copia aquellos que pertenezcan a la categoria x o y. Para ello usa la sentencia select * from tabla where 
SELECT *FROM contactos_copia WHERE categoria = 'Amig'

--Elimina de la tabla contactos _copia aquellos que pertenezcan a la categoria x o y
DELETE FROM contactos_copia WHERE categoria = 'Amig' or categoria = 'Trab'

--Visualiza de la tabla contactos_copia aquellos que pertenezcan a la categoria x e y. Para ello usa la sentencia select * from tabla where ….
SELECT *FROM contactos_copia WHERE categoria = 'Gym' or categoria = 'Viaj'

--Elimina de la tabla contactos _copia aquellos que pertenezcan a la categoria x e y
DELETE FROM contactos_copia WHERE categoria = 'Gym' and categoria = 'Viaje'

--Visualiza de la tabla contactos_copia aquellos que no pertenezcan a la categoria x. Para ello usa la sentencia select * from tabla where …
SELECT *FROM contactos_copia WHERE categoria != 'Trab'

--Elimina de la tabla contactos _copia aquellos que no pertenezcan a la categoria x
DELETE FROM contactos_copia WHERE categoria != 'Gym'

--Inserta un registro en la tabla contactos_copia
INSERT INTO contactos_copia(nombre, apellidos, dni, telefono, ecorreo, fechacumple, direccion, poblacion, provincia, CodigoPostal, categoria) VALUES ('Julián', 'Marrero', '7321984282', '926233001', 'frandia@correo.com', GETDATE(), 'Calle Almudena', 'Tarragona', 35, DEFAULT, 'Amig')
SELECT *FROM contactos_copia
