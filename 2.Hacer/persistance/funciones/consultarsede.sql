CREATE OR REPLACE FUNCTION consultarsede()
RETURNS TABLE (
    IdSede UUID,
    IdGimnasio UUID,
    Nombre VARCHAR,
    Telefono bigint,
    Horario VARCHAR,
    Activo BIT(1),
    Actualizar TIMESTAMP
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Sede;
END;
$$ LANGUAGE plpgsql;


SELECT * FROM SEDE;