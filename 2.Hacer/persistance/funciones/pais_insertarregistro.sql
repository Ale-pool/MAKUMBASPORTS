CREATE OR REPLACE FUNCTION insertar_pais(p_id UUID, p_nombre VARCHAR, p_activo BOOLEAN, p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Pais (IdPais, Nombre, Activo, Actualizar)
    VALUES (p_id, p_nombre, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
