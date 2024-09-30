CREATE OR REPLACE FUNCTION consultar_detalle_factura_por_id(p_id UUID)
RETURNS TABLE(IdDetalleFactura UUID, Cantidad INTEGER, PrecioUnitario MONEY, IdFactura UUID, Descr_ VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM DetalleFactura WHERE IdDetalleFactura = p_id;
END;
$$ LANGUAGE plpgsql;
