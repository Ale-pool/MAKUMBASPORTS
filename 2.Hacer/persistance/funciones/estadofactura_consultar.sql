CREATE OR REPLACE FUNCTION consultar_estado_facturas()
RETURNS TABLE(IdEstadoFactura UUID, Descr_ VARCHAR, FechaCambio DATE, IdFactura UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM EstadoFactura WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
