CREATE OR REPLACE FUNCTION consultargimnasio()
RETURNS TABLE (
    IdGimnasio UUID,
    IdCiudad UUID,
    Nombre VARCHAR,
    Tipo VARCHAR,
    NIT INTEGER,
    FechaApertura DATE,
    Activo BIT(1),
    Actualizar TIMESTAMP,
	Idsede UUID,
	Idempleado UUID
) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Gimnasio;
END;
$$ LANGUAGE plpgsql;