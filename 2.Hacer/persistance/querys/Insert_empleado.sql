INSERT INTO Empleado (IdEmpleado, Nombre, Apellido, Cargo, Salario, IdSede, Activo, Actualizar) VALUES
(uuid_generate_v4(), 'Luis', 'Gómez', 'Entrenador Personal', 2500000.00, (SELECT IdSede FROM Sede WHERE Nombre = 'Sede Poblado'), B'1', NOW()),
(uuid_generate_v4(), 'Marta', 'Ruiz', 'Recepcionista', 1500000.00, (SELECT IdSede FROM Sede WHERE Nombre = 'Sede Chapinero'), B'1', NOW()),
(uuid_generate_v4(), 'Pedro', 'Ramírez', 'Gerente', 4000000.00, (SELECT IdSede FROM Sede WHERE Nombre = 'Sede Centro'), B'1', NOW()),
(uuid_generate_v4(), 'Sofía', 'Vargas', 'Limpieza', 1200000.00, (SELECT IdSede FROM Sede WHERE Nombre = 'Sede Paulista'), B'1', NOW()),
(uuid_generate_v4(), 'Andrés', 'Torres', 'Instructor de Yoga', 2200000.00, (SELECT IdSede FROM Sede WHERE Nombre = 'Sede Las Condes'), B'1', NOW());



