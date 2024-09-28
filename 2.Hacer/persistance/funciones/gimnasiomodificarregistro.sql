CREATE OR REPLACE FUNCTION modificar_gimnasio(p_id UUID, p_idciudad UUID, p_nombre VARCHAR, p_tipo VARCHAR, p_nit INTEGER, p_fecha DATE, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Gimnasio
    SET IdCiudad = p_idciudad, Nombre = p_nombre, Tipo = p_tipo, NIT = p_nit, FechaApertura = p_fecha, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdGimnasio = p_id;
END;
$$ LANGUAGE plpgsql;
