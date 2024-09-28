CREATE OR REPLACE FUNCTION consultar_ciudad_por_id(p_id UUID)
RETURNS TABLE(IdCiudad UUID, IdDepartamento UUID, Nombre VARCHAR, Activo BOOLEAN, Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Ciudad WHERE IdCiudad = p_id;
END;
$$ LANGUAGE plpgsql;
