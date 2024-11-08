CREATE OR REPLACE FUNCTION consultargimnasionombre(p_nombre VARCHAR)
RETURNS TABLE (
    idgimnasio UUID,
    idciudad UUID,
    nombre VARCHAR,
    tipo VARCHAR,
    nit INTEGER,
    fechaapertura DATE,
    activo BIT(1),
    actualizar TIMESTAMP,
    idsede UUID,
    idempleado UUID
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
    FROM Gimnasio g
    WHERE g.Nombre = p_nombre;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS consultargimnasionombre;
