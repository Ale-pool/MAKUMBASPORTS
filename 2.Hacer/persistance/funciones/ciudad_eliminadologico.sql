CREATE OR REPLACE FUNCTION eliminar_logico_ciudad(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Ciudad
    SET Activo = FALSE
    WHERE IdCiudad = p_id;
END;
$$ LANGUAGE plpgsql;
