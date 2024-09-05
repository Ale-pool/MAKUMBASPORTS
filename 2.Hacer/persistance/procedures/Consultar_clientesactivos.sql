-- Consultar todos los clientes activos:
-- Este procedimiento recupera todos los clientes que están activos.
--  Esta función devuelve una tabla con los clientes activos.

CREATE OR REPLACE FUNCTION obtener_clientes_activos()
RETURNS TABLE(IdCliente UUID, Nombre VARCHAR, Apellido VARCHAR, Activo BIT, Actualizar TIMESTAMP)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT IdCliente, Nombre, Apellido, Activo, Actualizar FROM Cliente WHERE Activo = B'1';
END;
$$;
