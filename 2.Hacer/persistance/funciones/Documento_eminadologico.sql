CREATE OR REPLACE FUNCTION eliminar_logico_documento(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE Documento
    SET Activo = B'0'
    WHERE IdDocumento = p_id;
END;
$$ LANGUAGE plpgsql;
