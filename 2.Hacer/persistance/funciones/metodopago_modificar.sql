CREATE OR REPLACE FUNCTION modificar_metodo_pago(p_id UUID, p_descr_ VARCHAR, p_activo BOOLEAN, p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE MetodoPago
    SET Descr_ = p_descr_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdMetodoPago = p_id;
END;
$$ LANGUAGE plpgsql;
