-- Primer procedimiento: Insertar un nuevo pais
-- Este procedimiento inserta un nuevo registro en la tabla Pais.

CREATE OR REPLACE PROCEDURE insertar_pais(
    p_nombre VARCHAR,
    p_activo BOOLEAN
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Pais (IdPais, Nombre, Activo, Actualizar)
    VALUES (uuid_generate_v4(), p_nombre, p_activo, NOW());
END;
$$;
