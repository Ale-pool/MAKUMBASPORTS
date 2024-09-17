-- Actualizar un pais: con este procedimiento se actualizara el nombre y el estado de un pais especifico

CREATE OR REPLACE PROCEDURE actualizar_pais(
    p_idpais UUID,
    p_nombre VARCHAR,
    p_activo BOOLEAN
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Pais
    SET Nombre = p_nombre, Activo = p_activo, Actualizar = NOW()
    WHERE IdPais = p_idpais;
END;
$$;
