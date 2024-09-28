-- cliente

CREATE OR REPLACE FUNCTION consultar_clientes()
RETURNS TABLE(IdCliente UUID, Nombre VARCHAR, Apellido VARCHAR, IdDocumento UUID, IdEstadoCivil UUID, IdGenero UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Cliente WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
