CREATE TABLE Empleado (
    IdEmpleado UUID PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Cargo VARCHAR(255),
    Salario DECIMAL(10, 2),
    IdSede UUID REFERENCES Sede(IdSede),
    Activo BIT(1),
    Actualizar TIMESTAMP
);