CREATE OR REPLACE FUNCTION consultar_metodos_pago()
RETURNS TABLE(IdMetodoPago UUID, Descr_ VARCHAR, Activo BOOLEAN, Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM MetodoPago WHERE Activo = TRUE;
END;
$$ LANGUAGE plpgsql;
