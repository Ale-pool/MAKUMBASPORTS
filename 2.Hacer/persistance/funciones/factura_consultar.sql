CREATE OR REPLACE FUNCTION consultar_facturas()
RETURNS TABLE(IdFactura UUID, Fecha DATE, MontoTotal MONEY, IdCliente UUID, IdMetodoPago UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Factura WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
