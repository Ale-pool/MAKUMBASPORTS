CREATE OR REPLACE FUNCTION eliminar_fisico_estado_factura(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM EstadoFactura WHERE IdEstadoFactura = p_id;
END;
$$ LANGUAGE plpgsql;
