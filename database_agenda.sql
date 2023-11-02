CREATE DATABASE agenda
GO

USE agenda;

CREATE TABLE contactos (
	id_contacto INTEGER IDENTITY(10,2) CONSTRAINT PK_id_contacto PRIMARY KEY,
	nombre VARCHAR(25),
	apellidos VARCHAR(50),
	dni CHAR(10),
	telefono CHAR(12),
	ecorreo VARCHAR(50),
	fechacumple DATE NULL CONSTRAINT CK_fechacumple CHECK (fechacumple < '01-01-2010'),
	direccion VARCHAR(50),
	poblacion VARCHAR(50),
	provincia INTEGER,
	codpostal CHAR(5) CONSTRAINT DF_codpostal DEFAULT (38700), 
	categoria CHAR(4),
	
	CONSTRAINT FK_categoria FOREIGN KEY (categoria) REFERENCES categorias(categoria)
);

CREATE TABLE categorias (
	
	categoria CHAR(4) CONSTRAINT PK_categoria PRIMARY KEY,
	descripcion VARCHAR(50),
);

CREATE TABLE provincias (
	
	provincia INTEGER IDENTITY(0,5),
	nombreprovincia VARCHAR(40) CONSTRAINT UK_nombreprovincia UNIQUE,
	tamanoprovincia DECIMAL(10,2) CONSTRAINT CK_tamanoprovincia CHECK (tamanoprovincia > 100)
);

ALTER TABLE contactos
ALTER COLUMN dni CHAR(10)

ALTER TABLE contactos
ALTER COLUMN telefono CHAR(12)

EXEC sp_rename 'contactos.codpostal', 'CodigoPostal'

ALTER TABLE contactos
ALTER COLUMN nombre VARCHAR(25) NOT NULL

ALTER TABLE contactos
ALTER COLUMN apellidos VARCHAR(50) NOT NULL

ALTER TABLE contactos
ALTER COLUMN categoria CHAR(4) NOT NULL

ALTER TABLE provincias
ADD CONSTRAINT PK_provincia PRIMARY KEY (provincia)

ALTER TABLE contactos
ADD CONSTRAINT FK_provincia FOREIGN KEY (provincia) REFERENCES provincias(provincia)

EXEC sp_rename 'provincias.tamanoprovincia', 'metrosProvincia'
ALTER TABLE provincias
ADD CONSTRAINT DF_tamanoprovincia DEFAULT (200) for tamanoprovincia
