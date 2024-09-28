CREATE OR REPLACE FUNCTION eliminar_fisico_gimnasio(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Gimnasio WHERE IdGimnasio = p_id;
END;
$$ LANGUAGE plpgsql;
