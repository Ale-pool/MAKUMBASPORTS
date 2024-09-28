CREATE OR REPLACE FUNCTION eliminar_logico_sede(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Sede
    SET Activo = B'0'
    WHERE IdSede = p_id;
END;
$$ LANGUAGE plpgsql;
