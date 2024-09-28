CREATE OR REPLACE FUNCTION modificar_sede(p_id UUID, p_idgimnasio UUID, p_nombre VARCHAR, p_telefono INTEGER, p_horario VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Sede
    SET IdGimnasio = p_idgimnasio, Nombre = p_nombre, Telefono = p_telefono, Horario = p_horario, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdSede = p_id;
END;
$$ LANGUAGE plpgsql;
