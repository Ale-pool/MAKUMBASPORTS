CREATE OR REPLACE FUNCTION consultar_documentos()
RETURNS TABLE(IdDocumento UUID, Numero BIGINT, FechaExpedicion DATE, Lugar VARCHAR, Descrip_ VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Documento WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
