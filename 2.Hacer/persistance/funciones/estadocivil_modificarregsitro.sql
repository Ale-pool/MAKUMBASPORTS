CREATE OR REPLACE FUNCTION modificar_estado_civil(p_id UUID, p_fecha DATE, p_tipo VARCHAR, p_descrip_ VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE EstadoCivil
    SET FechaCambio = p_fecha, TipoEstadoCivil = p_tipo, Descrip_ = p_descrip_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdEstadoCivil = p_id;
END;
$$ LANGUAGE plpgsql;
