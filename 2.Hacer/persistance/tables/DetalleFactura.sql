CREATE TABLE DetalleFactura (
    IdDetalleFactura UUID PRIMARY KEY,
    Cantidad INTEGER,
    PrecioUnitario MONEY,
    IdFactura UUID REFERENCES Factura(IdFactura),
    Descr_ VARCHAR(255),
    Activo BIT(1),
    Actualizar TIMESTAMP
);