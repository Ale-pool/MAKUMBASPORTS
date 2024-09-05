
INSERT INTO Departamento (IdDepartamento, IdPais, Nombre, Activo, Actualizar) VALUES
(uuid_generate_v4(), (SELECT IdPais FROM Pais WHERE Nombre = 'Colombia'), 'Antioquia', TRUE, NOW()),
(uuid_generate_v4(), (SELECT IdPais FROM Pais WHERE Nombre = 'Colombia'), 'Cundinamarca', TRUE, NOW()),
(uuid_generate_v4(), (SELECT IdPais FROM Pais WHERE Nombre = 'Argentina'), 'Buenos Aires', TRUE, NOW()),
(uuid_generate_v4(), (SELECT IdPais FROM Pais WHERE Nombre = 'Brasil'), 'São Paulo', TRUE, NOW()),
(uuid_generate_v4(), (SELECT IdPais FROM Pais WHERE Nombre = 'Chile'), 'Santiago', TRUE, NOW());
