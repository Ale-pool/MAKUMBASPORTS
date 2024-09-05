ALTER TABLE Sede
ALTER COLUMN Telefono TYPE BIGINT;


INSERT INTO Sede (IdSede, IdGimnasio, Nombre, Telefono, Horario, Activo, Actualizar) VALUES
(uuid_generate_v4(), (SELECT IdGimnasio FROM Gimnasio WHERE Nombre = 'Fit Gym'), 'Sede Poblado', 3001234567, '06:00-22:00', B'1', NOW()),
(uuid_generate_v4(), (SELECT IdGimnasio FROM Gimnasio WHERE Nombre = 'StrongFit'), 'Sede Chapinero', 3107654321, '05:00-23:00', B'1', NOW()),
(uuid_generate_v4(), (SELECT IdGimnasio FROM Gimnasio WHERE Nombre = 'PowerHouse'), 'Sede Centro', 3201122334, '06:00-22:00', B'1', NOW()),
(uuid_generate_v4(), (SELECT IdGimnasio FROM Gimnasio WHERE Nombre = 'Energy Gym'), 'Sede Paulista', 3309988776, '06:00-22:00', B'1', NOW()),
(uuid_generate_v4(), (SELECT IdGimnasio FROM Gimnasio WHERE Nombre = 'BodyFit'), 'Sede Las Condes', 3407766554, '06:00-22:00', B'1', NOW());
