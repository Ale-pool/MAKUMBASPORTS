CREATE OR REPLACE FUNCTION modificar_ciudad(p_id UUID, p_iddepartamento UUID, p_nombre VARCHAR, p_activo BOOLEAN, p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Ciudad
    SET IdDepartamento = p_iddepartamento, Nombre = p_nombre, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdCiudad = p_id;
END;
$$ LANGUAGE plpgsql;
