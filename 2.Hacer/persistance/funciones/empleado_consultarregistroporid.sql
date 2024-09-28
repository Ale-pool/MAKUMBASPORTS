CREATE OR REPLACE FUNCTION consultar_empleado_por_id(p_id UUID)
RETURNS TABLE(IdEmpleado UUID, Nombre VARCHAR, Apellido VARCHAR, Cargo VARCHAR, Salario DECIMAL, IdSede UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Empleado WHERE IdEmpleado = p_id;
END;
$$ LANGUAGE plpgsql;
