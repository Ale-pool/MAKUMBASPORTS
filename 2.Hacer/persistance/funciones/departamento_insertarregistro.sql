CREATE OR REPLACE FUNCTION insertar_departamento(p_id UUID, p_idpais UUID, p_nombre VARCHAR, p_activo BOOLEAN, p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Departamento (IdDepartamento, IdPais, Nombre, Activo, Actualizar)
    VALUES (p_id, p_idpais, p_nombre, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
