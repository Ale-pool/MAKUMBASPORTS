CREATE OR REPLACE FUNCTION insertar_gimnasio(p_id UUID, p_idciudad UUID, p_nombre VARCHAR, p_tipo VARCHAR, p_nit INTEGER, p_fecha DATE, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Gimnasio (IdGimnasio, IdCiudad, Nombre, Tipo, NIT, FechaApertura, Activo, Actualizar)
    VALUES (p_id, p_idciudad, p_nombre, p_tipo, p_nit, p_fecha, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
