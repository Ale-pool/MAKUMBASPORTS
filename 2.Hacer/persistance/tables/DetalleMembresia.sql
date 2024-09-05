CREATE TABLE DetalleMembresia (
    IdDetalle UUID PRIMARY KEY,
    FechaPago DATE,
    MontoPagado MONEY,
    IdMembresia UUID REFERENCES Membresia(IdMembresia),
    Activo BIT(1),
    Actualizar TIMESTAMP
);
