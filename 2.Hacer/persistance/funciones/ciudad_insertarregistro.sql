CREATE OR REPLACE FUNCTION insertar_ciudad(p_id UUID, p_iddepartamento UUID, p_nombre VARCHAR, p_activo BOOLEAN, p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Ciudad (IdCiudad, IdDepartamento, Nombre, Activo, Actualizar)
    VALUES (p_id, p_iddepartamento, p_nombre, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
