CREATE OR REPLACE FUNCTION eliminar_logico_detalle_factura(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE DetalleFactura
    SET Activo = B'0'
    WHERE IdDetalleFactura = p_id;
END;
$$ LANGUAGE plpgsql;
