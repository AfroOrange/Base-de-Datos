CREATE DATABASE residencias_escolares
GO

USE residencias_escolares;

--Borrar en orden inverso

IF OBJECT_ID('dbo.estancias') IS NOT NULL
DROP TABLE dbo.estancias

IF OBJECT_ID('dbo.estudiantes') IS NOT NULL
DROP TABLE dbo.estudiantes

IF OBJECT_ID('dbo.residencias') IS NOT NULL
DROP TABLE dbo.residencias

IF OBJECT_ID('dbo.universidades') IS NOT NULL
DROP TABLE dbo.universidades

--Crear las tablas

CREATE TABLE universidades (
	codUniversidad CHAR(6) CONSTRAINT PK_codUniversidad PRIMARY KEY,
	nomUniversidad VARCHAR(30)
);

CREATE TABLE residencias (
	codResidencia INT IDENTITY(1,1) CONSTRAINT PK_codResidencia PRIMARY KEY,
	nomResidencia VARCHAR(30) NOT NULL,
	codUniversidad CHAR(6),
	precioMensual INT NULL,
	comedor BIT,

	CONSTRAINT FK_codUniversidad FOREIGN KEY (codUniversidad) REFERENCES universidades(codUniversidad)
);

CREATE TABLE estudiantes (
	codEstudiante INT CONSTRAINT PK_codEstudiante PRIMARY KEY,
	nomEstudiante VARCHAR(50) NOT NULL,
	dni CHAR(9),
	telefonoEstudiante CHAR(9)
);

CREATE TABLE estancias (
	codEstudiante INT,
	codResidencia INT,
	fechaInicio DATE,
	fechaFin DATE,
	precioPagado INT

	CONSTRAINT PK_estancias PRIMARY KEY (codEstudiante, codResidencia, fechaInicio),
	CONSTRAINT FK_codEstudiante FOREIGN KEY (codEstudiante) REFERENCES estudiantes(codEstudiante),
	CONSTRAINT FK_codResidencia FOREIGN KEY (codResidencia) REFERENCES residencias (codResidencia)
)
