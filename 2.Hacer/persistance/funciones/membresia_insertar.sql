CREATE OR REPLACE FUNCTION insertar_membresia(p_id UUID, p_fecha_inicio DATE, p_fecha_fin INTERVAL, p_id_cliente UUID, p_id_tipo_membresia UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Membresia (IdMembresia, FechaInicio, FechaFin, IdCliente, IdTipoMembresia, Activo, Actualizar)
    VALUES (p_id, p_fecha_inicio, p_fecha_fin, p_id_cliente, p_id_tipo_membresia, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
