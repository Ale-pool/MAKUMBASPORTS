CREATE OR REPLACE FUNCTION eliminar_logico_genero(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Genero
    SET Activo = B'0'
    WHERE IdGenero = p_id;
END;
$$ LANGUAGE plpgsql;
