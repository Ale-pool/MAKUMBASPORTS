CREATE TABLE EstadoFactura (
    IdEstadoFactura UUID PRIMARY KEY,
    Descr_ VARCHAR(255),
    FechaCambio DATE,
    IdFactura UUID REFERENCES Factura(IdFactura),
    Activo BIT(1),
    Actualizar TIMESTAMP
);
