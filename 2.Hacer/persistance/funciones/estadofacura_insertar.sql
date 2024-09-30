CREATE OR REPLACE FUNCTION insertar_estado_factura(p_id UUID, p_descr_ VARCHAR, p_fecha_cambio DATE, p_id_factura UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO EstadoFactura (IdEstadoFactura, Descr_, FechaCambio, IdFactura, Activo, Actualizar)
    VALUES (p_id, p_descr_, p_fecha_cambio, p_id_factura, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
