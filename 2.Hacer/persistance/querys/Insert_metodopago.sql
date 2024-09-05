INSERT INTO MetodoPago (IdMetodoPago, Descr_, Activo, Actualizar) VALUES
(uuid_generate_v4(), 'Tarjeta de Crédito', TRUE, NOW()),
(uuid_generate_v4(), 'Tarjeta Débito', TRUE, NOW()),
(uuid_generate_v4(), 'Efectivo', TRUE, NOW()),
(uuid_generate_v4(), 'Transferencia Bancaria', TRUE, NOW()),
(uuid_generate_v4(), 'Paypal', TRUE, NOW());
