CREATE OR REPLACE FUNCTION consultar_detalle_facturas()
RETURNS TABLE(IdDetalleFactura UUID, Cantidad INTEGER, PrecioUnitario MONEY, IdFactura UUID, Descr_ VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM DetalleFactura WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
