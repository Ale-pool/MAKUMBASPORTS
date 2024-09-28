CREATE OR REPLACE FUNCTION modificar_documento(p_id UUID, p_numero BIGINT, p_fecha DATE, p_lugar VARCHAR, p_descrip_ VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE Documento
    SET Numero = p_numero, FechaExpedicion = p_fecha, Lugar = p_lugar, Descrip_ = p_descrip_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdDocumento = p_id;
END;
$$ LANGUAGE plpgsql;
