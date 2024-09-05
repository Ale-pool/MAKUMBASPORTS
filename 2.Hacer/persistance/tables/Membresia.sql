CREATE TABLE Membresia (
    IdMembresia UUID PRIMARY KEY,
    FechaInicio DATE,
    FechaFin INTERVAL,
    IdCliente UUID REFERENCES Cliente(IdCliente),
    IdTipoMembresia UUID REFERENCES TipoMembresia(IdTipoMembresia),
    Activo BIT(1),
    Actualizar TIMESTAMP
);
