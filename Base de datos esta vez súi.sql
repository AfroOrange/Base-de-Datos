CREATE DATABASE bdd_prestamos3;
GO

USE bdd_prestamos3;

CREATE TABLE provincias (
    codProvincia SMALLINT CONSTRAINT PK_provincias PRIMARY KEY,
    nomProvincia VARCHAR(50) NOT NULL
);

CREATE TABLE clientes (
    codCliente INT IDENTITY(1,1) CONSTRAINT PK_clientes PRIMARY KEY, 
    nomCliente VARCHAR(30) NOT NULL,
    telefono CHAR(11),
    codProvincia SMALLINT,
    categoria CHAR(1)
	CONSTRAINT DF_categoria DEFAULT 'A',
	CONSTRAINT CK_categoria CHECK (categoria = 'A' or categoria = 'B' or categoria = 'C'),
    CONSTRAINT FK_clientesProvincias FOREIGN KEY (codProvincia) REFERENCES provincias(codProvincia)
    
);

CREATE TABLE prestamos (
    codPrestamo CHAR(10) CONSTRAINT PK_prestamo PRIMARY KEY,
    codCliente INT,
    cantidadTotalPrestada BIGINT,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    cuotaMensual INT NOT NULL,
    prestamoPagado BIT DEFAULT 0,
    CONSTRAINT FK_PrestamosClientes FOREIGN KEY (codCliente) REFERENCES clientes(codCliente)
);

CREATE TABLE pagos (
    codPrestamo CHAR(10),
    fechaPago DATE,
    cantidadPagada INT NOT NULL,
    CONSTRAINT PK_pagos PRIMARY KEY (codPrestamo, fechaPago), 
    CONSTRAINT FK_pagosPrestamos FOREIGN KEY (codPrestamo) REFERENCES prestamos(codPrestamo),
    CONSTRAINT CK_cantidadpagada CHECK(cantidadPagada > 0) 
);
