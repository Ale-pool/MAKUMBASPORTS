CREATE OR REPLACE FUNCTION eliminar_fisico_sede(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Sede WHERE IdSede = p_id;
END;
$$ LANGUAGE plpgsql;
