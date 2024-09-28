CREATE OR REPLACE FUNCTION consultar_ciudades()
RETURNS TABLE(IdCiudad UUID, IdDepartamento UUID, Nombre VARCHAR, Activo BOOLEAN, Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Ciudad WHERE Activo = TRUE;
END;
$$ LANGUAGE plpgsql;
