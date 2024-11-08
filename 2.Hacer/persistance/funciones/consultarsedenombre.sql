CREATE OR REPLACE FUNCTION consultarsedenombre(p_nombre VARCHAR)
RETURNS TABLE (
    idsede UUID,
    idgimnasio UUID,
    nombre VARCHAR,
    telefono bigint,
    horario VARCHAR,
    activo bit,
    Actualizar TIMESTAMP
) AS $$
BEGIN
	RETURN QUERY
    SELECT 
        g.IdSede, 
        g.IdGimnasio, 
        g.Nombre, 
        g.Telefono, 
        g.Horario, 
        g.Activo, 
        g.Actualizar
    FROM Sede AS g
    WHERE g.Nombre = p_nombre;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS consultarsedenombre;

SELECT * FROM SEDE;