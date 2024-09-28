CREATE OR REPLACE FUNCTION modificar_empleado(p_id UUID, p_nombre VARCHAR, p_apellido VARCHAR, p_cargo VARCHAR, p_salario DECIMAL, p_id_sede UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Empleado
    SET Nombre = p_nombre, Apellido = p_apellido, Cargo = p_cargo, Salario = p_salario, IdSede = p_id_sede, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdEmpleado = p_id;
END;
$$ LANGUAGE plpgsql;
