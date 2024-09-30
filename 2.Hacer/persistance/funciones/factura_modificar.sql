CREATE OR REPLACE FUNCTION modificar_factura(p_id UUID, p_fecha DATE, p_monto_total MONEY, p_id_cliente UUID, p_id_metodo_pago UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Factura
    SET Fecha = p_fecha, MontoTotal = p_monto_total, IdCliente = p_id_cliente, IdMetodoPago = p_id_metodo_pago, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdFactura = p_id;
END;
$$ LANGUAGE plpgsql;
