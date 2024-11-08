CREATE OR REPLACE FUNCTION consultarempleadonombre(p_nombre VARCHAR)
RETURNS TABLE (
    idempleado UUID,
    nombre varchar,
    apellido VARCHAR,
    cargo varchar,
    salario numeric (10,2),
    idsede UUID,
    activo bit(1),
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
    WHERE g.Nombre = p_nombre;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM empleado;