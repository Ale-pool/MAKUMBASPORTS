CREATE OR REPLACE FUNCTION consultar_gimnasios()
RETURNS TABLE(IdGimnasio UUID, IdCiudad UUID, Nombre VARCHAR, Tipo VARCHAR, NIT INTEGER, FechaApertura DATE, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Gimnasio WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
