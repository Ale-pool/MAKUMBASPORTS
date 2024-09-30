CREATE OR REPLACE FUNCTION modificar_estado_factura(p_id UUID, p_descr_ VARCHAR, p_fecha_cambio DATE, p_id_factura UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE EstadoFactura
    SET Descr_ = p_descr_, FechaCambio = p_fecha_cambio, IdFactura = p_id_factura, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdEstadoFactura = p_id;
END;
$$ LANGUAGE plpgsql;
