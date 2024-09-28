CREATE OR REPLACE FUNCTION insertar_sede(p_id UUID, p_idgimnasio UUID, p_nombre VARCHAR, p_telefono INTEGER, p_horario VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Sede (IdSede, IdGimnasio, Nombre, Telefono, Horario, Activo, Actualizar)
    VALUES (p_id, p_idgimnasio, p_nombre, p_telefono, p_horario, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
