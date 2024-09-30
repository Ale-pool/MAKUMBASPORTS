CREATE OR REPLACE FUNCTION consultar_membresias()
RETURNS TABLE(IdMembresia UUID, FechaInicio DATE, FechaFin INTERVAL, IdCliente UUID, IdTipoMembresia UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Membresia WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;

