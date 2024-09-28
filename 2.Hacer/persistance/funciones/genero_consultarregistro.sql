-- genero

CREATE OR REPLACE FUNCTION consultar_generos()
RETURNS TABLE(IdGenero UUID, Descr_ VARCHAR, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Genero WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
