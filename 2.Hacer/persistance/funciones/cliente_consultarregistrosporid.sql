CREATE OR REPLACE FUNCTION consultar_cliente_por_id(p_id UUID)
RETURNS TABLE(IdCliente UUID, Nombre VARCHAR, Apellido VARCHAR, IdDocumento UUID, IdEstadoCivil UUID, IdGenero UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Cliente WHERE IdCliente = p_id;
END;
$$ LANGUAGE plpgsql;
