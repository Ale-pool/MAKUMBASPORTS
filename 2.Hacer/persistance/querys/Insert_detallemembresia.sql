INSERT INTO DetalleMembresia (IdDetalle, FechaPago, MontoPagado, IdMembresia, Activo, Actualizar) VALUES
(uuid_generate_v4(), '2024-01-01', '50000', (SELECT IdMembresia FROM Membresia WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Juan' AND Apellido = 'Pérez')), B'1', NOW()),
(uuid_generate_v4(), '2024-02-01', '140000', (SELECT IdMembresia FROM Membresia WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Ana' AND Apellido = 'García')), B'1', NOW()),
(uuid_generate_v4(), '2024-03-01', '270000', (SELECT IdMembresia FROM Membresia WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Carlos' AND Apellido = 'Martínez')), B'1', NOW()),
(uuid_generate_v4(), '2024-04-01', '500000', (SELECT IdMembresia FROM Membresia WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Lucía' AND Apellido = 'López')), B'1', NOW()),
(uuid_generate_v4(), '2024-05-01', '10000', (SELECT IdMembresia FROM Membresia WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Mario' AND Apellido = 'Rodríguez')), B'1', NOW());
