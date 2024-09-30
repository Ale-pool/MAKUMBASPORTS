CREATE OR REPLACE FUNCTION eliminar_fisico_factura(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Factura WHERE IdFactura = p_id;
END;
$$ LANGUAGE plpgsql;
