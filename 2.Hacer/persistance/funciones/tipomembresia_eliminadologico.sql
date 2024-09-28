CREATE OR REPLACE FUNCTION eliminar_logico_tipo_membresia(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE TipoMembresia
    SET Activo = B'0'
    WHERE IdTipoMembresia = p_id;
END;
$$ LANGUAGE plpgsql;
