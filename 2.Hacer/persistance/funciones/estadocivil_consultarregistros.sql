CREATE OR REPLACE FUNCTION consultar_estados_civiles()
RETURNS TABLE(IdEstadoCivil UUID, FechaCambio DATE, TipoEstadoCivil VARCHAR, Descrip_ VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM EstadoCivil WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
