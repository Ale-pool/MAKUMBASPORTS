CREATE OR REPLACE FUNCTION insertar_factura(p_id UUID, p_fecha DATE, p_monto_total MONEY, p_id_cliente UUID, p_id_metodo_pago UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Factura (IdFactura, Fecha, MontoTotal, IdCliente, IdMetodoPago, Activo, Actualizar)
    VALUES (p_id, p_fecha, p_monto_total, p_id_cliente, p_id_metodo_pago, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
