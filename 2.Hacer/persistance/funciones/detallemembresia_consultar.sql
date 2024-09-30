CREATE OR REPLACE FUNCTION consultar_detalle_membresias()
RETURNS TABLE(IdDetalle UUID, FechaPago DATE, MontoPagado MONEY, IdMembresia UUID, Activo BIT(1), Actualizar TIMESTAMP) AS $$
BEGIN
    RETURN QUERY SELECT * FROM DetalleMembresia WHERE Activo = B'1';
END;
$$ LANGUAGE plpgsql;
