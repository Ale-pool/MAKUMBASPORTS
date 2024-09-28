CREATE OR REPLACE FUNCTION consultar_estado_civil_por_id(p_id UUID)
RETURNS TABLE(IdEstadoCivil UUID, FechaCambio DATE, TipoEstadoCivil VARCHAR, Descrip_ VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM EstadoCivil WHERE IdEstadoCivil = p_id;
END;
$$ LANGUAGE plpgsql;
