CREATE OR REPLACE FUNCTION eliminar_fisico_pais(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Pais WHERE IdPais = p_id;
END;
$$ LANGUAGE plpgsql;
