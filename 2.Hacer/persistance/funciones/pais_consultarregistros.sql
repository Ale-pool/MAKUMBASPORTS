CREATE OR REPLACE FUNCTION consultar_paises()
RETURNS TABLE(IdPais UUID, Nombre VARCHAR, Activo BOOLEAN, Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Pais WHERE Activo = TRUE;
END;
$$ LANGUAGE plpgsql;
