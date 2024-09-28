CREATE OR REPLACE FUNCTION modificar_departamento(p_id UUID, p_idpais UUID, p_nombre VARCHAR, p_activo BOOLEAN, p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Departamento
    SET IdPais = p_idpais, Nombre = p_nombre, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdDepartamento = p_id;
END;
$$ LANGUAGE plpgsql;
