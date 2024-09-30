CREATE OR REPLACE FUNCTION modificar_membresia(p_id UUID, p_fecha_inicio DATE, p_fecha_fin INTERVAL, p_id_cliente UUID, p_id_tipo_membresia UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Membresia
    SET FechaInicio = p_fecha_inicio, FechaFin = p_fecha_fin, IdCliente = p_id_cliente, IdTipoMembresia = p_id_tipo_membresia, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdMembresia = p_id;
END;
$$ LANGUAGE plpgsql;
