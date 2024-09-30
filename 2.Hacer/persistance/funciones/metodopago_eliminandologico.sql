CREATE OR REPLACE FUNCTION eliminar_logico_metodo_pago(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE MetodoPago
    SET Activo = FALSE
    WHERE IdMetodoPago = p_id;
END;
$$ LANGUAGE plpgsql;
