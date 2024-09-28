CREATE OR REPLACE FUNCTION consultar_genero_por_id(p_id UUID)
RETURNS TABLE(IdGenero UUID, Descr_ VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Genero WHERE IdGenero = p_id;
END;
$$ LANGUAGE plpgsql;
