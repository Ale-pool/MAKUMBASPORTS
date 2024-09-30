CREATE OR REPLACE FUNCTION consultar_estado_factura_por_id(p_id UUID)
RETURNS TABLE(IdEstadoFactura UUID, Descr_ VARCHAR, FechaCambio DATE, IdFactura UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM EstadoFactura WHERE IdEstadoFactura = p_id;
END;
$$ LANGUAGE plpgsql;
