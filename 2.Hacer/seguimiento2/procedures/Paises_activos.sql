-- Consulta de todos los paises activos
-- Explicación: Esta función devuelve una tabla con los países activos.
CREATE OR REPLACE FUNCTION obtener_paises_activos()
RETURNS TABLE(IdPais UUID, Nombre VARCHAR, Activo BOOLEAN, Actualizar TIMESTAMP)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT IdPais, Nombre, Activo, Actualizar FROM Pais WHERE Activo = TRUE;
END;
$$;
