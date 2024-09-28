CREATE OR REPLACE FUNCTION eliminar_fisico_tipo_membresia(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM TipoMembresia WHERE IdTipoMembresia = p_id;
END;
$$ LANGUAGE plpgsql;
