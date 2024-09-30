CREATE OR REPLACE FUNCTION eliminar_fisico_metodo_pago(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM MetodoPago WHERE IdMetodoPago = p_id;
END;
$$ LANGUAGE plpgsql;
