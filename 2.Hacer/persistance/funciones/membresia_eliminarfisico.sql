CREATE OR REPLACE FUNCTION eliminar_fisico_membresia(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Membresia WHERE IdMembresia = p_id;
END;
$$ LANGUAGE plpgsql;
