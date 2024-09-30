CREATE OR REPLACE FUNCTION eliminar_logico_estado_factura(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE EstadoFactura
    SET Activo = B'0'
    WHERE IdEstadoFactura = p_id;
END;
$$ LANGUAGE plpgsql;
