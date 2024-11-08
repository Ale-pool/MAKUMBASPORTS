CREATE OR REPLACE FUNCTION FunctionConsultarPais()
RETURNS TABLE(IdPais UUID, Nombre VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
  RETURN QUERY
    SELECT "IdPais",
           "Nombre",
           "Activo",
           "Actualiza"
    FROM public."Pais"
    WHERE "Activo" = B'1';
END;
$$ LANGUAGE plpgsql;
