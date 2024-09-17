-- Actualizar una membresía:
--Este procedimiento actualiza la fecha de finalización y el tipo de membresía de un cliente

CREATE OR REPLACE PROCEDURE actualizar_membresia(
    p_idmembresia UUID,
    p_fecha_fin INTERVAL,
    p_idtipomembresia UUID
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Membresia
    SET FechaFin = p_fecha_fin, IdTipoMembresia = p_idtipomembresia, Actualizar = NOW()
    WHERE IdMembresia = p_idmembresia;
END;
$$;
