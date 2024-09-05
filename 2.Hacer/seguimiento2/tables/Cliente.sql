CREATE TABLE Cliente (
    IdCliente UUID PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    IdDocumento UUID REFERENCES Documento(IdDocumento),
    IdEstadoCivil UUID REFERENCES EstadoCivil(IdEstadoCivil),
    IdGenero UUID REFERENCES Genero(IdGenero),
    Activo BIT(1),
    Actualizar TIMESTAMP
);