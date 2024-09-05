INSERT INTO TipoMembresia (IdTipoMembresia, Descrip_, Precio, Duracion, Activo, Actualizar) VALUES
(uuid_generate_v4(), 'Mensual', '50000', INTERVAL '1 month', B'1', NOW()),
(uuid_generate_v4(), 'Trimestral', '140000', INTERVAL '3 months', B'1', NOW()),
(uuid_generate_v4(), 'Semestral', '270000', INTERVAL '6 months', B'1', NOW()),
(uuid_generate_v4(), 'Anual', '500000', INTERVAL '1 year', B'1', NOW()),
(uuid_generate_v4(), 'Diaria', '10000', INTERVAL '1 day', B'1', NOW());
