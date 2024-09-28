CREATE OR REPLACE FUNCTION modificar_tipo_membresia(p_id UUID, p_descrip_ VARCHAR, p_precio MONEY, p_duracion INTERVAL, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE TipoMembresia
    SET Descrip_ = p_descrip_, Precio = p_precio, Duracion = p_duracion, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdTipoMembresia = p_id;
END;
$$ LANGUAGE plpgsql;
