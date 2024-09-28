CREATE OR REPLACE FUNCTION eliminar_logico_departamento(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Departamento
    SET Activo = FALSE
    WHERE IdDepartamento = p_id;
END;
$$ LANGUAGE plpgsql;
