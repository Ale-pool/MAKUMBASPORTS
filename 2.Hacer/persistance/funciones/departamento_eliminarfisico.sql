CREATE OR REPLACE FUNCTION eliminar_fisico_departamento(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Departamento WHERE IdDepartamento = p_id;
END;
$$ LANGUAGE plpgsql;
