CREATE OR REPLACE FUNCTION consultarsedeid(p_id UUID)
RETURNS TABLE (
    idsede UUID,
    idgimnasio UUID,
    nombre VARCHAR,
    telefono bigint,
    horario VARCHAR,
    activo BIT(1),
    actualizar TIMESTAMP
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
    WHERE g.IdSede = p_id;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM SEDE;