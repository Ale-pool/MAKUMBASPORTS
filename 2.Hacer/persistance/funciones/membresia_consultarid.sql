CREATE OR REPLACE FUNCTION consultar_membresia_por_id(p_id UUID)
RETURNS TABLE(IdMembresia UUID, FechaInicio DATE, FechaFin INTERVAL, IdCliente UUID, IdTipoMembresia UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM Membresia WHERE IdMembresia = p_id;
END;
$$ LANGUAGE plpgsql;
