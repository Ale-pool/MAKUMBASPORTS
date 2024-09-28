CREATE OR REPLACE FUNCTION consultar_tipos_membresia()
RETURNS TABLE(IdTipoMembresia UUID, Descrip_ VARCHAR, Precio MONEY, Duracion INTERVAL, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM TipoMembresia WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
