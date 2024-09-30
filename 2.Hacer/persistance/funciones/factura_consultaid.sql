CREATE OR REPLACE FUNCTION consultar_factura_por_id(p_id UUID)
RETURNS TABLE(IdFactura UUID, Fecha DATE, MontoTotal MONEY, IdCliente UUID, IdMetodoPago UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Factura WHERE IdFactura = p_id;
END;
$$ LANGUAGE plpgsql;
