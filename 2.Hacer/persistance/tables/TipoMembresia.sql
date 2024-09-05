CREATE TABLE TipoMembresia (
    IdTipoMembresia UUID PRIMARY KEY,
    Descrip_ VARCHAR(255),
    Precio MONEY,
    Duracion INTERVAL,
    Activo BIT(1),
    Actualizar TIMESTAMP
);