CREATE OR REPLACE FUNCTION consultar_departamento_por_id(p_id UUID)
RETURNS TABLE(IdDepartamento UUID, IdPais UUID, Nombre VARCHAR, Activo BOOLEAN, Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Departamento WHERE IdDepartamento = p_id;
END;
$$ LANGUAGE plpgsql;
