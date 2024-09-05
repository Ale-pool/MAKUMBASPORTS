CREATE TABLE Departamento (
    IdDepartamento UUID PRIMARY KEY,
    IdPais UUID REFERENCES Pais(IdPais),
    Nombre VARCHAR(255),
    Activo BOOLEAN,
    Actualizar TIMESTAMP
);