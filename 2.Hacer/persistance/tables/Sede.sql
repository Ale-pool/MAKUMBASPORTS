CREATE TABLE Sede (
    IdSede UUID PRIMARY KEY,
    IdGimnasio UUID REFERENCES Gimnasio(IdGimnasio),
    Nombre VARCHAR(255),
    Telefono INTEGER,
    Horario VARCHAR(255),
    Activo BIT(1),
    Actualizar TIMESTAMP
);
