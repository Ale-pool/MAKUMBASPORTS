--Insertar un nuevo cliente:
-- Este procedimiento inserta un nuevo cliente en la tabla Cliente.
-- Explicación: Este procedimiento inserta un nuevo cliente, generando un UUID para IdCliente
-- y marcándolo como activo.

CREATE OR REPLACE PROCEDURE insertar_cliente(
    p_nombre VARCHAR,
    p_apellido VARCHAR,
    p_iddocumento UUID,
    p_idestadocivil UUID,
    p_idgenero UUID
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Cliente (IdCliente, Nombre, Apellido, IdDocumento, IdEstadoCivil, IdGenero, Activo, Actualizar)
    VALUES (uuid_generate_v4(), p_nombre, p_apellido, p_iddocumento, p_idestadocivil, p_idgenero, B'1', NOW());
END;
$$;
