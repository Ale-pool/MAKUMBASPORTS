CREATE OR REPLACE FUNCTION eliminar_fisico_genero(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Genero WHERE IdGenero = p_id;
END;
$$ LANGUAGE plpgsql;
