CREATE OR REPLACE FUNCTION eliminar_logico_cliente(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Cliente
    SET Activo = B'0'
    WHERE IdCliente = p_id;
END;
$$ LANGUAGE plpgsql;
