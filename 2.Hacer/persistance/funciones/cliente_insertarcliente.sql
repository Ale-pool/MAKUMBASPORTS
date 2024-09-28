CREATE OR REPLACE FUNCTION insertar_cliente(p_id UUID, p_nombre VARCHAR, p_apellido VARCHAR, p_id_documento UUID, p_id_estado_civil UUID, p_id_genero UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Cliente (IdCliente, Nombre, Apellido, IdDocumento, IdEstadoCivil, IdGenero, Activo, Actualizar)
    VALUES (p_id, p_nombre, p_apellido, p_id_documento, p_id_estado_civil, p_id_genero, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
