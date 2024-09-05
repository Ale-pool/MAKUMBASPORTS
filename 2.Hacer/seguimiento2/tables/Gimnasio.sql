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