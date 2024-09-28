CREATE OR REPLACE FUNCTION insertar_genero(p_id UUID, p_descr_ VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Genero (IdGenero, Descr_, Activo, Actualizar)
    VALUES (p_id, p_descr_, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
