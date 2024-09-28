CREATE OR REPLACE FUNCTION consultar_documento_por_id(p_id UUID)
RETURNS TABLE(IdDocumento UUID, Numero BIGINT, FechaExpedicion DATE, Lugar VARCHAR, Descrip_ VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Documento WHERE IdDocumento = p_id;
END;
$$ LANGUAGE plpgsql;
