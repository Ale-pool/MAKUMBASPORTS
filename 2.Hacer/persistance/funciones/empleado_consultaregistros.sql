CREATE OR REPLACE FUNCTION consultar_empleados()
RETURNS TABLE(IdEmpleado UUID, Nombre VARCHAR, Apellido VARCHAR, Cargo VARCHAR, Salario DECIMAL, IdSede UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Empleado WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
