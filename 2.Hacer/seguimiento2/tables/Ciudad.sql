CREATE TABLE Ciudad (
    IdCiudad UUID PRIMARY KEY,
    IdDepartamento UUID REFERENCES Departamento(IdDepartamento),
    Nombre VARCHAR(255),
    Activo BOOLEAN,
    Actualizar TIMESTAMP
);