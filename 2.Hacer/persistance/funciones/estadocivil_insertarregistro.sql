CREATE OR REPLACE FUNCTION insertar_estado_civil(p_id UUID, p_fecha DATE, p_tipo VARCHAR, p_descrip_ VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO EstadoCivil (IdEstadoCivil, FechaCambio, TipoEstadoCivil, Descrip_, Activo, Actualizar)
    VALUES (p_id, p_fecha, p_tipo, p_descrip_, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
