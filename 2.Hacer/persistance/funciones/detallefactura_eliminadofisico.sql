CREATE OR REPLACE FUNCTION eliminar_fisico_detalle_factura(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM DetalleFactura WHERE IdDetalleFactura = p_id;
END;
$$ LANGUAGE plpgsql;
