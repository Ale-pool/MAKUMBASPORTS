# Utiliza un filtro adicional, como un LIMIT 1, en las subconsultas para garantizar que solo se devuelva un registro.
# se tiene que realizar un ajueste "Asegúrate de que las tablas Documento, EstadoCivil y Genero tengan registros únicos para las combinaciones de campos que estás consultando."

	INSERT INTO Cliente (IdCliente, Nombre, Apellido, IdDocumento, IdEstadoCivil, IdGenero, Activo, Actualizar) VALUES
(uuid_generate_v4(), 'Juan', 'Pérez', 
    (SELECT IdDocumento FROM Documento WHERE Numero = 1122334455 LIMIT 1), 
    (SELECT IdEstadoCivil FROM EstadoCivil WHERE TipoEstadoCivil = 'Soltero' LIMIT 1), 
    (SELECT IdGenero FROM Genero WHERE Descr_ = 'Masculino' LIMIT 1), B'1', NOW()),
(uuid_generate_v4(), 'Ana', 'García', 
    (SELECT IdDocumento FROM Documento WHERE Numero = 2233445566 LIMIT 1), 
    (SELECT IdEstadoCivil FROM EstadoCivil WHERE TipoEstadoCivil = 'Casado' LIMIT 1), 
    (SELECT IdGenero FROM Genero WHERE Descr_ = 'Femenino' LIMIT 1), B'1', NOW()),
(uuid_generate_v4(), 'Carlos', 'Martínez', 
    (SELECT IdDocumento FROM Documento WHERE Numero = 3344556677 LIMIT 1), 
    (SELECT IdEstadoCivil FROM EstadoCivil WHERE TipoEstadoCivil = 'Divorciado' LIMIT 1), 
    (SELECT IdGenero FROM Genero WHERE Descr_ = 'Masculino' LIMIT 1), B'1', NOW()),
(uuid_generate_v4(), 'Lucía', 'López', 
    (SELECT IdDocumento FROM Documento WHERE Numero = 4455667788 LIMIT 1), 
    (SELECT IdEstadoCivil FROM EstadoCivil WHERE TipoEstadoCivil = 'Viudo' LIMIT 1), 
    (SELECT IdGenero FROM Genero WHERE Descr_ = 'Femenino' LIMIT 1), B'1', NOW()),
(uuid_generate_v4(), 'Mario', 'Rodríguez', 
    (SELECT IdDocumento FROM Documento WHERE Numero = 5566778899 LIMIT 1), 
    (SELECT IdEstadoCivil FROM EstadoCivil WHERE TipoEstadoCivil = 'Unión libre' LIMIT 1), 
    (SELECT IdGenero FROM Genero WHERE Descr_ = 'No binario' LIMIT 1), B'1', NOW());
