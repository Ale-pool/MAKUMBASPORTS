CREATE OR REPLACE FUNCTION eliminar_logico_empleado(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Empleado
    SET Activo = B'0'
    WHERE IdEmpleado = p_id;
END;
$$ LANGUAGE plpgsql;
