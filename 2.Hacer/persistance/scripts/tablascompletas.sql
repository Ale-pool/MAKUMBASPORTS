CREATE SCHEMA IF NOT EXISTS public;
SET search_path TO public;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tabla Pais
CREATE TABLE Pais (
    IdPais UUID PRIMARY KEY,
    Nombre VARCHAR(255),
    Activo BOOLEAN,
    Actualizar TIMESTAMP
);

-- Tabla Departamento
CREATE TABLE Departamento (
    IdDepartamento UUID PRIMARY KEY,
    IdPais UUID REFERENCES Pais(IdPais),
    Nombre VARCHAR(255),
    Activo BOOLEAN,
    Actualizar TIMESTAMP
);

-- Tabla Ciudad
CREATE TABLE Ciudad (
    IdCiudad UUID PRIMARY KEY,
    IdDepartamento UUID REFERENCES Departamento(IdDepartamento),
    Nombre VARCHAR(255),
    Activo BOOLEAN,
    Actualizar TIMESTAMP
);

-- Tabla Gimnasio
CREATE TABLE Gimnasio (
    IdGimnasio UUID PRIMARY KEY,
    IdCiudad UUID REFERENCES Ciudad(IdCiudad),
    Nombre VARCHAR(255),
    Tipo VARCHAR(255),
    NIT INTEGER,
    FechaApertura DATE,
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla Sede
CREATE TABLE Sede (
    IdSede UUID PRIMARY KEY,
    IdGimnasio UUID REFERENCES Gimnasio(IdGimnasio),
    Nombre VARCHAR(255),
    Telefono INTEGER,
    Horario VARCHAR(255),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla Documento
CREATE TABLE Documento (
    IdDocumento UUID PRIMARY KEY,
    Numero BIGINT,
    FechaExpedicion DATE,
    Lugar VARCHAR(255),
    Descrip_ VARCHAR(255),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla EstadoCivil
CREATE TABLE EstadoCivil (
    IdEstadoCivil UUID PRIMARY KEY,
    FechaCambio DATE,
    TipoEstadoCivil VARCHAR(255),
    Descrip_ VARCHAR(255),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla Genero
CREATE TABLE Genero (
    IdGenero UUID PRIMARY KEY,
    Descr_ VARCHAR(255),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla Cliente
CREATE TABLE Cliente (
    IdCliente UUID PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    IdDocumento UUID REFERENCES Documento(IdDocumento),
    IdEstadoCivil UUID REFERENCES EstadoCivil(IdEstadoCivil),
    IdGenero UUID REFERENCES Genero(IdGenero),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla Empleado
CREATE TABLE Empleado (
    IdEmpleado UUID PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Cargo VARCHAR(255),
    Salario DECIMAL(10, 2),
    IdSede UUID REFERENCES Sede(IdSede),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla TipoMembresia
CREATE TABLE TipoMembresia (
    IdTipoMembresia UUID PRIMARY KEY,
    Descrip_ VARCHAR(255),
    Precio MONEY,
    Duracion INTERVAL,
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla Membresia
CREATE TABLE Membresia (
    IdMembresia UUID PRIMARY KEY,
    FechaInicio DATE,
    FechaFin INTERVAL,
    IdCliente UUID REFERENCES Cliente(IdCliente),
    IdTipoMembresia UUID REFERENCES TipoMembresia(IdTipoMembresia),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla DetalleMembresia
CREATE TABLE DetalleMembresia (
    IdDetalle UUID PRIMARY KEY,
    FechaPago DATE,
    MontoPagado MONEY,
    IdMembresia UUID REFERENCES Membresia(IdMembresia),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla MetodoPago
CREATE TABLE MetodoPago (
    IdMetodoPago UUID PRIMARY KEY,
    Descr_ VARCHAR(255),
    Activo BOOLEAN,
    Actualizar TIMESTAMP
);

-- Tabla Factura
CREATE TABLE Factura (
    IdFactura UUID PRIMARY KEY,
    Fecha DATE,
    MontoTotal MONEY,
    IdCliente UUID REFERENCES Cliente(IdCliente),
    IdMetodoPago UUID REFERENCES MetodoPago(IdMetodoPago),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla DetalleFactura
CREATE TABLE DetalleFactura (
    IdDetalleFactura UUID PRIMARY KEY,
    Cantidad INTEGER,
    PrecioUnitario MONEY,
    IdFactura UUID REFERENCES Factura(IdFactura),
    Descr_ VARCHAR(255),
    Activo BIT(1),
    Actualizar TIMESTAMP
);

-- Tabla EstadoFactura
CREATE TABLE EstadoFactura (
    IdEstadoFactura UUID PRIMARY KEY,
    Descr_ VARCHAR(255),
    FechaCambio DATE,
    IdFactura UUID REFERENCES Factura(IdFactura),
    Activo BIT(1),
    Actualizar TIMESTAMP
);
