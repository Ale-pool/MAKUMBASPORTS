

CREATE OR REPLACE FUNCTION consultarempleado()
RETURNS TABLE (
    IdEmpleado UUID,
    Nombre VARCHAR,
    Apellido VARCHAR,
    Cargo VARCHAR,
    Salario numeric(10, 2),
    IdSede UUID,
    Activo BIT(1),
    Actualizar TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Empleado;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM empleado;