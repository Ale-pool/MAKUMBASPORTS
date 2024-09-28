CREATE OR REPLACE FUNCTION eliminar_logico_gimnasio(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Gimnasio
    SET Activo = B'0'
    WHERE IdGimnasio = p_id;
END;
$$ LANGUAGE plpgsql;
