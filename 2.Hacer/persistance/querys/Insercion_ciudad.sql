INSERT INTO Ciudad (IdCiudad, IdDepartamento, Nombre, Activo, Actualizar) VALUES
(uuid_generate_v4(), (SELECT IdDepartamento FROM Departamento WHERE Nombre = 'Antioquia'), 'Medellín', TRUE, NOW()),
(uuid_generate_v4(), (SELECT IdDepartamento FROM Departamento WHERE Nombre = 'Cundinamarca'), 'Bogotá', TRUE, NOW()),
(uuid_generate_v4(), (SELECT IdDepartamento FROM Departamento WHERE Nombre = 'Buenos Aires'), 'La Plata', TRUE, NOW()),
(uuid_generate_v4(), (SELECT IdDepartamento FROM Departamento WHERE Nombre = 'São Paulo'), 'São Paulo', TRUE, NOW()),
(uuid_generate_v4(), (SELECT IdDepartamento FROM Departamento WHERE Nombre = 'Santiago'), 'Santiago', TRUE, NOW());
