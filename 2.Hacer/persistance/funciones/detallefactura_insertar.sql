CREATE OR REPLACE FUNCTION insertar_detalle_factura(p_id UUID, p_cantidad INTEGER, p_precio_unitario MONEY, p_id_factura UUID, p_descr_ VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO DetalleFactura (IdDetalleFactura, Cantidad, PrecioUnitario, IdFactura, Descr_, Activo, Actualizar)
    VALUES (p_id, p_cantidad, p_precio_unitario, p_id_factura, p_descr_, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
