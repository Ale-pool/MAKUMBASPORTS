CREATE OR REPLACE FUNCTION consultar_tipo_membresia_por_id(p_id UUID)
RETURNS TABLE(IdTipoMembresia UUID, Descrip_ VARCHAR, Precio MONEY, Duracion INTERVAL, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM TipoMembresia WHERE IdTipoMembresia = p_id;
END;
$$ LANGUAGE plpgsql;
