CREATE OR REPLACE FUNCTION consultargimnasioid(p_id UUID)
RETURNS TABLE (
    idgimnasio UUID,
    idciudad UUID,
    nombre VARCHAR,
    tipo VARCHAR,
    nit INTEGER,
    fechaapertura DATE,
    activo BIT(1),
    actualizar TIMESTAMP,
	Idsede UUID,
	Idempleado UUID
) AS $$
BEGIN
     RETURN QUERY
    SELECT 
        g.IdGimnasio, 
        g.IdCiudad, 
        g.Nombre, 
        g.Tipo, 
        g.NIT, 
        g.FechaApertura, 
        g.Activo, 
        g.Actualizar,
		g.IdSede,
		g.IdEmpleado
    FROM Gimnasio AS g
    WHERE g.IdGimnasio = p_id;
END;
$$ LANGUAGE plpgsql;