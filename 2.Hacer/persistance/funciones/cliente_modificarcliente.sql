CREATE OR REPLACE FUNCTION modificar_cliente(p_id UUID, p_nombre VARCHAR, p_apellido VARCHAR, p_id_documento UUID, p_id_estado_civil UUID, p_id_genero UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Cliente
    SET Nombre = p_nombre, Apellido = p_apellido, IdDocumento = p_id_documento, IdEstadoCivil = p_id_estado_civil, IdGenero = p_id_genero, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdCliente = p_id;
END;
$$ LANGUAGE plpgsql;
