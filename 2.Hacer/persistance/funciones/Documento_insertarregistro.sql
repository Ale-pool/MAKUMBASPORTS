CREATE OR REPLACE FUNCTION insertar_documento(p_id UUID, p_numero BIGINT, p_fecha DATE, p_lugar VARCHAR, p_descrip_ VARCHAR, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Documento (IdDocumento, Numero, FechaExpedicion, Lugar, Descrip_, Activo, Actualizar)
    VALUES (p_id, p_numero, p_fecha, p_lugar, p_descrip_, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
