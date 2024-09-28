CREATE OR REPLACE FUNCTION eliminar_fisico_ciudad(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Ciudad WHERE IdCiudad = p_id;
END;
$$ LANGUAGE plpgsql;
