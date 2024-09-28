CREATE OR REPLACE FUNCTION insertar_tipo_membresia(p_id UUID, p_descrip_ VARCHAR, p_precio MONEY, p_duracion INTERVAL, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO TipoMembresia (IdTipoMembresia, Descrip_, Precio, Duracion, Activo, Actualizar)
    VALUES (p_id, p_descrip_, p_precio, p_duracion, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
