CREATE OR REPLACE FUNCTION consultar_gimnasio_por_id(p_id UUID)
RETURNS TABLE(IdGimnasio UUID, IdCiudad UUID, Nombre VARCHAR, Tipo VARCHAR, NIT INTEGER, FechaApertura DATE, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Gimnasio WHERE IdGimnasio = p_id;
END;
$$ LANGUAGE plpgsql;
