CREATE OR REPLACE FUNCTION eliminar_logico_estado_civil(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE EstadoCivil
    SET Activo = B'0'
    WHERE IdEstadoCivil = p_id;
END;
$$ LANGUAGE plpgsql;
