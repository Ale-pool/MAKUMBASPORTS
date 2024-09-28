CREATE OR REPLACE FUNCTION modificar_genero(p_id UUID, p_descr_ VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Genero
    SET Descr_ = p_descr_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdGenero = p_id;
END;
$$ LANGUAGE plpgsql;
