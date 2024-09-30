CREATE OR REPLACE FUNCTION insertar_metodo_pago(p_id UUID, p_descr_ VARCHAR, p_activo BOOLEAN, p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO MetodoPago (IdMetodoPago, Descr_, Activo, Actualizar)
    VALUES (p_id, p_descr_, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
