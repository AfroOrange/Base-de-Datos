USE residencias_escolares;

--Tabla universidades
ALTER TABLE universidades add Sede CHAR(60);
ALTER TABLE universidades add telefono CHAR(9) CHECK (telefono like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

--Tabla Residencias
ALTER TABLE residencias	
ADD CONSTRAINT DF_preciomensual DEFAULT '900' for preciomensual

ALTER TABLE residencias	
ADD CONSTRAINT CK_preciomensual CHECK (preciomensual > 50 AND preciomensual < 2000)

ALTER TABLE residencias
ADD CONSTRAINT DF_comedor DEFAULT 0 for comedor

ALTER TABLE residencias add cantidadPlazas INT NOT NULL

ALTER TABLE residencias
ADD CONSTRAINT CK_cantidadPlazas CHECK (cantidadPlazas > 1 AND cantidadPlazas < 1000)

ALTER TABLE residencias add nombreDirector VARCHAR(40) NULL

ALTER TABLE residencias add genero CHAR(9) CONSTRAINT DF_genero DEFAULT ('Mixto')

ALTER TABLE residencias
ADD CONSTRAINT CK_genero CHECK (genero in('Mixto', 'Masculino', 'Femenino'))

--Tabla Estudiantes
ALTER TABLE estudiantes
ADD CONSTRAINT UK_dni  UNIQUE (dni)

ALTER TABLE estudiantes
ADD CONSTRAINT CK_dni CHECK (dni IS NOT NULL)

ALTER TABLE estudiantes
ADD CONSTRAINT UK_telefonoEstudiante UNIQUE (telefonoEstudiante)

ALTER TABLE estudiantes
ADD CONSTRAINT CK_telefonoEstudiante CHECK (telefonoEstudiante IS NOT NULL)

--ALTER TABLE estudiantes 
--ADD CONSTRAINT V

ALTER TABLE estudiantes add correo VARCHAR(30)

ALTER TABLE estudiantes add direccion VARCHAR(60) NULL

ALTER TABLE estudiantes 
ADD sexo CHAR(1) 
CONSTRAINT CK_sexo CHECK (sexo IN('M', 'F'))

--Tabla estancias
ALTER TABLE estancias add observaciones TEXT NULL

ALTER TABLE estancias add numHabitacion INT CONSTRAINT DF_numHabitacion DEFAULT '0'

--Eliminar tabla estudiantes
AlTER TABLE estudiantes
DROP COLUMN direccion

--Modifica el nombre del campo sede de la tabla universidades por dirección
EXEC sp_rename 'universidades.Sede', 'direccion', 'COLUMN';

--Elimina el campo dirección de la tabla universidades
AlTER TABLE universidades
DROP COLUMN direccion

--Modifica el nombre del campo correo de la tabla estudiantes por email
EXEC sp_rename 'estudiantes.correo', 'email', 'COLUMN';
