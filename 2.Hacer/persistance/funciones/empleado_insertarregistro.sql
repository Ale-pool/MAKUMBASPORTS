CREATE OR REPLACE FUNCTION insertar_empleado(p_id UUID, p_nombre VARCHAR, p_apellido VARCHAR, p_cargo VARCHAR, p_salario DECIMAL, p_id_sede UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Empleado (IdEmpleado, Nombre, Apellido, Cargo, Salario, IdSede, Activo, Actualizar)
    VALUES (p_id, p_nombre, p_apellido, p_cargo, p_salario, p_id_sede, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
