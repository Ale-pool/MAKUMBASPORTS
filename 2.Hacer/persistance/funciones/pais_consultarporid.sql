CREATE OR REPLACE FUNCTION consultar_pais_por_id(p_id UUID)
RETURNS TABLE(IdPais UUID, Nombre VARCHAR, Activo BOOLEAN, Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Pais WHERE IdPais = p_id;
END;
$$ LANGUAGE plpgsql;
