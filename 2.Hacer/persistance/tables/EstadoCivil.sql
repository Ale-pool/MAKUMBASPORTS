CREATE TABLE EstadoCivil (
    IdEstadoCivil UUID PRIMARY KEY,
    FechaCambio DATE,
    TipoEstadoCivil VARCHAR(255),
    Descrip_ VARCHAR(255),
    Activo BIT(1),
    Actualizar TIMESTAMP
);