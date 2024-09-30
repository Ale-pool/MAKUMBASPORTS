CREATE OR REPLACE FUNCTION eliminar_logico_factura(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Factura
    SET Activo = B'0'
    WHERE IdFactura = p_id;
END;
$$ LANGUAGE plpgsql;
