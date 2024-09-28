CREATE OR REPLACE FUNCTION modificar_pais(p_id UUID, p_nombre VARCHAR, p_activo BOOLEAN, p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Pais
    SET Nombre = p_nombre, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdPais = p_id;
END;
$$ LANGUAGE plpgsql;
