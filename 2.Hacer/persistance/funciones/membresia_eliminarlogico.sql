CREATE OR REPLACE FUNCTION eliminar_logico_membresia(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Membresia
    SET Activo = B'0'
    WHERE IdMembresia = p_id;
END;
$$ LANGUAGE plpgsql;
