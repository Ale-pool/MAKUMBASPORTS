CREATE OR REPLACE FUNCTION consultar_sedes()
RETURNS TABLE(IdSede UUID, IdGimnasio UUID, Nombre VARCHAR, Telefono INTEGER, Horario VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Sede WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
