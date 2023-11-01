USE bdd_prestamos3

--1 Inserta una provincia con numhabitantes con su valor por defecto, hazlo de dos maneras diferentes.
SELECT FROM provincias
INSERT INTO provincias (codProvincia, nomProvincia, pais, numHabitantes) VALUES (6, 'A Coruña', '2', DEFAULT)

--2.- Modifica el nombre de provincia y el numhabitantes de la provincia con codigo X

UPDATE provincias
SET nomProvincia = 'Málaga', numHabitantes = 150
WHERE codProvincia = 6

SELECT FROM provincias

--3.- Sumale 10 a todos los habitantes de todas las provincias del país con codigo X

UPDATE provincias
SET numHabitantes = numHabitantes + 10
WHERE pais = 1

SELECT FROM provincias

--4.- Realiza una copia de la tabla provincias con todos sus datos, llamala copia_provincias

SELECT codProvincia, nomProvincia, pais, numHabitantes
INTO copia_provincias
FROM provincias

--5.- Elimina en la tabla copia_provincias aquellos registros que tengan menos de x habitantes

DELETE FROM copia_provincias WHERE numHabitantes  115

--6.- Elimina todos los registros de la tabla copia_provincias

DELETE FROM copia_provincias

--7.- Carga la tabla copia_provincias con todos los datos que tiene la tabla provincias.

INSERT INTO copia_provincias (codProvincia, nomProvincia, pais, numHabitantes)
SELECT codProvincia, nomProvincia, pais, numHabitantes
FROM provincias

--8.- Elimina todos los registros de la tabla copia_provincias de otra forma. 
--Vuelve a rellenar la tabla copia_provincias con todos los datos de la tabla provincias.

TRUNCATE TABLE copia_provincias 
INSERT INTO copia_provincias (codProvincia, nomProvincia, pais, numHabitantes)
SELECT codProvincia, nomProvincia, pais, numHabitantes
FROM provincias

--9.- Inserta un cliente con teléfono y categoría con valor null en la tabla clientes

INSERT INTO clientes (nomCliente, codProvincia) VALUES ('Sara Castro', 3)
INSERT INTO clientes (nomCliente, codProvincia, categoria) VALUES ('Miguel Díaz', 3, NULL)
SELECT FROM clientes

--10.- Inserta un cliente con teléfono y categoría con valor por defecto en la tabla clientes

INSERT INTO clientes (nomCliente, telefono, codProvincia, categoria) VALUES ('Leonardo Gómez', DEFAULT, 5, DEFAULT)

--11.- Modifica el nombre del cliente con codigo X

UPDATE clientes 
SET nomCliente = 'Daniel Martín'
WHERE codCliente = 2

--12.- A todos los clientes que tengan categoría null asignarles la categoría C
UPDATE clientes
SET categoria = 'C'
WHERE categoria is null

--13.- Inserta un cliente con categoría al valor null

INSERT INTO clientes (nomCliente, telefono, codProvincia, categoria) VALUES ('Talía Marrero', '752042310', 1, NULL)

--14.- Elimina todos los clientes que tengan la categoría a valor null
DELETE FROM clientes 
WHERE categoria IS NULL

--15.-En la tabla provincias descuenta a numhabitantes 5 a la provincia con codigo X

UPDATE provincias 
SET numHabitantes = numHabitantes - 5
WHERE codProvincia = 4

--16.- En la tabla provincias aumenta el 10% a numhabitantes del país con codigo X

UPDATE provincias 
SET numHabitantes = numHabitantes  1.1
WHERE codProvincia = 3

--17.- En la tabla provincias modifica el nombre de la provincia y el país a la provincia con codigo X

SELECT FROM provincias
UPDATE provincias 
SET nomProvincia = 'Cádiz', pais = 1
WHERE codProvincia = 5

--18.- En la tabla pagos modifica la cantidad pagada de un determinado préstamo y fecha de pago.

SELECT FROM pagos
UPDATE pagos 
SET cantidadPagada = 4700, fechaPago = '10-08-2010'
WHERE codPrestamo = 4
