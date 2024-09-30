CREATE OR REPLACE FUNCTION modificar_detalle_factura(p_id UUID, p_cantidad INTEGER, p_precio_unitario MONEY, p_id_factura UUID, p_descr_ VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE DetalleFactura
    SET Cantidad = p_cantidad, PrecioUnitario = p_precio_unitario, IdFactura = p_id_factura, Descr_ = p_descr_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdDetalleFactura = p_id;
END;
$$ LANGUAGE plpgsql;
