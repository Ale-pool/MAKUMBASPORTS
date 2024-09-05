CREATE TABLE Factura (
    IdFactura UUID PRIMARY KEY,
    Fecha DATE,
    MontoTotal MONEY,
    IdCliente UUID REFERENCES Cliente(IdCliente),
    IdMetodoPago UUID REFERENCES MetodoPago(IdMetodoPago),
    Activo BIT(1),
    Actualizar TIMESTAMP
);