CREATE OR REPLACE FUNCTION consultar_departamentos()
RETURNS TABLE( iddepartamento UUID, IdPais UUID, Nombre VARCHAR, Activo BOOLEAN, Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Departamento WHERE Activo = TRUE;
END;
$$ LANGUAGE plpgsql;



