CREATE OR REPLACE FUNCTION consultar_metodo_pago_por_id(p_id UUID)
RETURNS TABLE(IdMetodoPago UUID, Descr_ VARCHAR, Activo BOOLEAN, Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM MetodoPago WHERE IdMetodoPago = p_id;
END;
$$ LANGUAGE plpgsql;
