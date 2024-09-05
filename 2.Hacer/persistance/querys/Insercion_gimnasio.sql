INSERT INTO Gimnasio (IdGimnasio, IdCiudad, Nombre, Tipo, NIT, FechaApertura, Activo, Actualizar) VALUES
(uuid_generate_v4(), (SELECT IdCiudad FROM Ciudad WHERE Nombre = 'Medellín'), 'Fit Gym', 'Premium', 123456789, '2020-01-15', B'1', NOW()),
(uuid_generate_v4(), (SELECT IdCiudad FROM Ciudad WHERE Nombre = 'Bogotá'), 'StrongFit', 'Standard', 987654321, '2019-06-10', B'1', NOW()),
(uuid_generate_v4(), (SELECT IdCiudad FROM Ciudad WHERE Nombre = 'La Plata'), 'PowerHouse', 'Premium', 112233445, '2021-02-20', B'1', NOW()),
(uuid_generate_v4(), (SELECT IdCiudad FROM Ciudad WHERE Nombre = 'São Paulo'), 'Energy Gym', 'Basic', 556677889, '2018-08-30', B'1', NOW()),
(uuid_generate_v4(), (SELECT IdCiudad FROM Ciudad WHERE Nombre = 'Santiago'), 'BodyFit', 'Standard', 998877665, '2020-09-25', B'1', NOW());
