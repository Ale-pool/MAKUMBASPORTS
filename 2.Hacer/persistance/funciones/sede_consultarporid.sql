CREATE OR REPLACE FUNCTION consultar_sede_por_id(p_id UUID)
RETURNS TABLE(IdSede UUID, IdGimnasio UUID, Nombre VARCHAR, Telefono INTEGER, Horario VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Sede WHERE IdSede = p_id;
END;
$$ LANGUAGE plpgsql;
