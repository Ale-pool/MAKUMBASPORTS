CREATE TABLE "Pais" (
	"IdPais" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR NOT NULL,
	"Activo" BOOLEAN NOT NULL,
	"Actualizar" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdPais")
);


CREATE TABLE "Departamento" (
	"IdDepartamento" UUID NOT NULL UNIQUE,
	"IdPais" UUID NOT NULL,
	"Nombre" VARCHAR NOT NULL,
	"Activo" BOOLEAN NOT NULL,
	"Actualizar" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdDepartamento")
);


CREATE TABLE "Ciudad" (
	"IdCiudad" UUID NOT NULL UNIQUE,
	"IdDepartamento" UUID NOT NULL,
	"Nombre" VARCHAR NOT NULL,
	"Açtivo" BOOLEAN NOT NULL,
	"Actualizar" TIMESTAMP NOT NULL,
	PRIMARY KEY("IdCiudad")
);


CREATE TABLE "Gimnasio" (
	"IdGimnasio" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR,
	"TipoGimnasio" VARCHAR,
	"FechaApertura" DATE,
	"NIT" INTEGER,
	"IdCiudad" UUID NOT NULL,
	PRIMARY KEY("IdGimnasio", "IdCiudad")
);


CREATE TABLE "Sede" (
	"IdSede" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR NOT NULL,
	"Telefono" INTEGER,
	"HorarioAtencion" TIMESTAMP,
	"IdGimnasio" UUID NOT NULL,
	PRIMARY KEY("IdSede", "IdGimnasio")
);


CREATE TABLE "Empleado" (
	"IdEmpleado" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR,
	"apellido" VARCHAR,
	"Cargo" VARCHAR,
	"Salario" DECIMAL,
	"IdSede" UUID NOT NULL,
	PRIMARY KEY("IdEmpleado", "IdSede")
);


CREATE TABLE "Cliente" (
	"IdCliente" UUID NOT NULL UNIQUE,
	"Nombre" VARCHAR,
	"Apellido" VARCHAR,
	"IdGenero" UUID NOT NULL,
	"IdDocumento" UUID NOT NULL,
	"IdEstadocivil" UUID NOT NULL,
	PRIMARY KEY("IdCliente", "IdDocumento", "IdEstadocivil")
);


CREATE TABLE "Documento" (
	"IdDocumento" UUID NOT NULL UNIQUE,
	"Numero" BIGINT,
	"FechaExpedicion" DATE,
	"LugarExpedicion" VARCHAR,
	"Descripcion" VARCHAR,
	PRIMARY KEY("IdDocumento")
);


CREATE TABLE "Genero" (
	"IdGenero" UUID NOT NULL UNIQUE,
	"Descripcion" VARCHAR,
	PRIMARY KEY("IdGenero")
);


CREATE TABLE "Estadocivil" (
	"IdEstadocivil" UUID NOT NULL UNIQUE,
	"FechaCambio" DATE,
	"IdTipoestadocivil" UUID NOT NULL,
	"Descripcion" VARCHAR,
	PRIMARY KEY("IdEstadocivil", "IdTipoestadocivil")
);


CREATE TABLE "Membresia" (
	"IdMembresia" UUID NOT NULL UNIQUE,
	"FechaInicio" INTERVAL NOT NULL,
	"FechaFin" INTERVAL NOT NULL,
	"IdTipomembresia" UUID NOT NULL,
	"IdCliente" UUID NOT NULL,
	PRIMARY KEY("IdMembresia", "IdTipomembresia", "IdCliente")
);


CREATE TABLE "Tipomembresia" (
	"IdTipomembresia" UUID NOT NULL UNIQUE,
	"Descripcion" VARCHAR NOT NULL,
	"Precio" MONEY NOT NULL,
	"Duracion" INTERVAL NOT NULL,
	PRIMARY KEY("IdTipomembresia")
);


CREATE TABLE "Detallemembresia" (
	"IdDetalle" INTEGER NOT NULL UNIQUE,
	"FechaPago" DATE,
	"MontoPagado" MONEY,
	"MetodoPago" VARCHAR,
	"IdMembresia" UUID NOT NULL,
	PRIMARY KEY("IdDetalle", "IdMembresia")
);


ALTER TABLE "Departamento"
ADD FOREIGN KEY("IdDepartamento") REFERENCES "Pais"("IdPais")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Ciudad"
ADD FOREIGN KEY("IdCiudad") REFERENCES "Departamento"("IdDepartamento")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Ciudad"
ADD FOREIGN KEY("IdCiudad") REFERENCES "Gimnasio"("IdGimnasio")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Sede"
ADD FOREIGN KEY("IdSede") REFERENCES "Gimnasio"("IdGimnasio")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Sede"
ADD FOREIGN KEY("IdSede") REFERENCES "Empleado"("IdEmpleado")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Genero"
ADD FOREIGN KEY("IdGenero") REFERENCES "Cliente"("IdCliente")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Documento"
ADD FOREIGN KEY("IdDocumento") REFERENCES "Cliente"("IdCliente")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Estadocivil"
ADD FOREIGN KEY("IdEstadocivil") REFERENCES "Cliente"("IdCliente")
ON UPDATE NO ACTION ON DELETE NO ACTION;