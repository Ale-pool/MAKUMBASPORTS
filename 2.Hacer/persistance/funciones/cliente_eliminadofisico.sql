CREATE OR REPLACE FUNCTION eliminar_fisico_cliente(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Cliente WHERE IdCliente = p_id;
END;
$$ LANGUAGE plpgsql;
