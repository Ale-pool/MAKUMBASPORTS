CREATE OR REPLACE FUNCTION consultar_detalle_membresia_por_id(p_id UUID)
RETURNS TABLE(IdDetalle UUID, FechaPago DATE, MontoPagado MONEY, IdMembresia UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM DetalleMembresia WHERE IdDetalle = p_id;
END;
$$ LANGUAGE plpgsql;
