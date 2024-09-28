CREATE OR REPLACE FUNCTION eliminar_fisico_empleado(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Empleado WHERE IdEmpleado = p_id;
END;
$$ LANGUAGE plpgsql;
