--Actualizar un cliente:
-- Este procedimiento actualiza la información de un cliente específico.
-- Este procedimiento actualiza la información del cliente, incluyendo su documento, estado civil, y género.

CREATE OR REPLACE PROCEDURE actualizar_cliente(
    p_idcliente UUID,
    p_nombre VARCHAR,
    p_apellido VARCHAR,
    p_iddocumento UUID,
    p_idestadocivil UUID,
    p_idgenero UUID
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Cliente
    SET Nombre = p_nombre, Apellido = p_apellido, IdDocumento = p_iddocumento, IdEstadoCivil = p_idestadocivil, IdGenero = p_idgenero, Actualizar = NOW()
    WHERE IdCliente = p_idcliente;
END;
$$;
