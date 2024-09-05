-- Insertar una nueva membresía:
-- Este procedimiento inserta una nueva membresía en la tabla Membresia.

CREATE OR REPLACE PROCEDURE insertar_membresia(
    p_fecha_inicio DATE,
    p_fecha_fin INTERVAL,
    p_idcliente UUID,
    p_idtipomembresia UUID
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Membresia (IdMembresia, FechaInicio, FechaFin, IdCliente, IdTipoMembresia, Activo, Actualizar)
    VALUES (uuid_generate_v4(), p_fecha_inicio, p_fecha_fin, p_idcliente, p_idtipomembresia, B'1', NOW());
END;
$$;
