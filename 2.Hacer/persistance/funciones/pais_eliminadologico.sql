CREATE OR REPLACE FUNCTION eliminar_logico_pais(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Pais
    SET Activo = FALSE
    WHERE IdPais = p_id;
END;
$$ LANGUAGE plpgsql;
