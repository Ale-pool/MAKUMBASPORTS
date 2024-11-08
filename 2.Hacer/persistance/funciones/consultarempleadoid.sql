CREATE OR REPLACE FUNCTION consultarempleadoid(p_id UUID)
RETURNS TABLE (
    idempleado UUID,
    nombre VARCHAR,
    apellido VARCHAR,
    cargo VARCHAR,
    salario numeric(10, 2),
    idsede UUID,
    activo BIT(1),
    actualizar TIMESTAMP
) AS $$
BEGIN
	RETURN QUERY
    SELECT 
        g.IdEmpleado, 
        g.Nombre, 
        g.Apellido, 
        g.Cargo, 
        g.Salario, 
        g.IdSede,  
        g.Activo,
		g.Actualizar
    FROM Empleado AS g
    WHERE g.IdEmpleado = p_id;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM empleado;


