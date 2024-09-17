--Eliminar una membresía:
-- Este procedimiento elimina una membresía de la tabla Membresia.

CREATE OR REPLACE PROCEDURE eliminar_membresia(
    p_idmembresia UUID
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Membresia
    WHERE IdMembresia = p_idmembresia;
END;
$$;
