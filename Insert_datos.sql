-- tabla paises
INSERT INTO paises (codpais, nomPais) VALUES (1, 'España')
INSERT INTO paises (codpais, nomPais) VALUES (2, 'Francia')
INSERT INTO paises (codpais, nomPais) VALUES (3, 'Alemania')
INSERT INTO paises (codpais, nomPais) VALUES (4, 'Bélgica')

SELECT FROM paises

--tabla provincias
INSERT INTO provincias (codProvincia, nomProvincia, pais) VALUES (1, 'ALMERÍA',1)
INSERT INTO provincias (codProvincia, nomProvincia, pais) VALUES (2, 'MADRID', 1)
INSERT INTO provincias (codProvincia, nomProvincia, pais) VALUES (3, 'ZARAGOZA', 1)
INSERT INTO provincias (codProvincia, nomProvincia, pais) VALUES (4, 'LAS PALMAS DE GRAN CANARIA', 1)
INSERT INTO provincias (codProvincia, nomProvincia, pais) VALUES (5, 'SANTA CRUZ DE TENERIFE', 1)

SELECT FROM provincias

--tabla clientes
INSERT INTO clientes (nomCliente, telefono, codProvincia, categoria) VALUES ('Jaime', 922239223, 3, 'c')
INSERT INTO clientes (nomCliente, telefono, codProvincia, categoria) VALUES ('Laura', 922459223, 3, 'a')
INSERT INTO clientes (nomCliente, telefono, codProvincia, categoria) VALUES ('Marta', 922492223, 3, 'b')
INSERT INTO clientes (nomCliente, telefono, codProvincia, categoria) VALUES ('Celia', 922499523, 3, 'c')
INSERT INTO clientes (nomCliente, telefono, codProvincia, categoria) VALUES ('Alberto', 922499213, 3, 'a')

SELECT FROM clientes

--tabla prestamos 
INSERT INTO prestamos (codPrestamo, cantidadTotalPrestada, fechaInicio, FechaFin, cuotaMensual, prestamoPagado) VALUES (1, 3000, '20-02-82', '30-09-82', 250, 0)
INSERT INTO prestamos (codPrestamo, cantidadTotalPrestada, fechaInicio, FechaFin, cuotaMensual, prestamoPagado) VALUES (2, 30520, '2-02-86', '30-06-88', 250, 1)
INSERT INTO prestamos (codPrestamo, cantidadTotalPrestada, fechaInicio, FechaFin, cuotaMensual, prestamoPagado) VALUES (3, 16600, '20-10-02', '7-08-05', 250, 1)
INSERT INTO prestamos (codPrestamo, cantidadTotalPrestada, fechaInicio, FechaFin, cuotaMensual, prestamoPagado) VALUES (4, 3500, '9-04-82', '12-09-84', 250, 1)
INSERT INTO prestamos (codPrestamo, cantidadTotalPrestada, fechaInicio, FechaFin, cuotaMensual, prestamoPagado) VALUES (5, 24000, '10-02-59', '30-09-60', 250, 1)

SELECT FROM prestamos

--tabla pagos
INSERT INTO pagos (codPrestamo, fechaPago, cantidadPagada) VALUES (1, '5-12-89', 1740)
INSERT INTO pagos (codPrestamo, fechaPago, cantidadPagada) VALUES (2, '30-06-88', 30520)
INSERT INTO pagos (codPrestamo, fechaPago, cantidadPagada) VALUES (3, '7-08-05', 16600)
INSERT INTO pagos (codPrestamo, fechaPago, cantidadPagada) VALUES (4, '12-09-84', 3500)
INSERT INTO pagos (codPrestamo, fechaPago, cantidadPagada) VALUES (5, '30-09-60', 24000)

SELECT FROM pagos
