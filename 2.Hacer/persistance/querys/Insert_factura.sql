INSERT INTO Factura (IdFactura, Fecha, MontoTotal, IdCliente, IdMetodoPago, Activo, Actualizar) VALUES
(uuid_generate_v4(), '2024-01-01', '50000', (SELECT IdCliente FROM Cliente WHERE Nombre = 'Juan' AND Apellido = 'Pérez'), (SELECT IdMetodoPago FROM MetodoPago WHERE Descr_ = 'Tarjeta de Crédito'), B'1', NOW()),
(uuid_generate_v4(), '2024-02-01', '140000', (SELECT IdCliente FROM Cliente WHERE Nombre = 'Ana' AND Apellido = 'García'), (SELECT IdMetodoPago FROM MetodoPago WHERE Descr_ = 'Tarjeta Débito'), B'1', NOW()),
(uuid_generate_v4(), '2024-03-01', '270000', (SELECT IdCliente FROM Cliente WHERE Nombre = 'Carlos' AND Apellido = 'Martínez'), (SELECT IdMetodoPago FROM MetodoPago WHERE Descr_ = 'Efectivo'), B'1', NOW()),
(uuid_generate_v4(), '2024-04-01', '500000', (SELECT IdCliente FROM Cliente WHERE Nombre = 'Lucía' AND Apellido = 'López'), (SELECT IdMetodoPago FROM MetodoPago WHERE Descr_ = 'Transferencia Bancaria'), B'1', NOW()),
(uuid_generate_v4(), '2024-05-01', '10000', (SELECT IdCliente FROM Cliente WHERE Nombre = 'Mario' AND Apellido = 'Rodríguez'), (SELECT IdMetodoPago FROM MetodoPago WHERE Descr_ = 'Paypal'), B'1', NOW());
