CREATE OR REPLACE FUNCTION eliminar_fisico_estado_civil(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM EstadoCivil WHERE IdEstadoCivil = p_id;
END;
$$ LANGUAGE plpgsql;
