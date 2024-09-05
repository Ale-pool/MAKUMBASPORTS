INSERT INTO DetalleFactura (IdDetalleFactura, Cantidad, PrecioUnitario, IdFactura, Descr_, Activo, Actualizar) VALUES
(uuid_generate_v4(), 1, '50000', (SELECT IdFactura FROM Factura WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Juan' AND Apellido = 'Pérez')), 'Membresía Mensual', B'1', NOW()),
(uuid_generate_v4(), 1, '140000', (SELECT IdFactura FROM Factura WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Ana' AND Apellido = 'García')), 'Membresía Trimestral', B'1', NOW()),
(uuid_generate_v4(), 1, '270000', (SELECT IdFactura FROM Factura WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Carlos' AND Apellido = 'Martínez')), 'Membresía Semestral', B'1', NOW()),
(uuid_generate_v4(), 1, '500000', (SELECT IdFactura FROM Factura WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Lucía' AND Apellido = 'López')), 'Membresía Anual', B'1', NOW()),
(uuid_generate_v4(), 1, '10000', (SELECT IdFactura FROM Factura WHERE IdCliente = (SELECT IdCliente FROM Cliente WHERE Nombre = 'Mario' AND Apellido = 'Rodríguez')), 'Membresía Diaria', B'1', NOW());
