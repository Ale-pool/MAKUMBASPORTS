CREATE OR REPLACE FUNCTION eliminar_fisico_documento(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Documento WHERE IdDocumento = p_id;
END;
$$ LANGUAGE plpgsql;
