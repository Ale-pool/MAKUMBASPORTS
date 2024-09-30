CREATE OR REPLACE FUNCTION eliminar_logico_detalle_membresia(p_id UUID)
RETURNS VOID AS $$
BEGIN
    UPDATE DetalleMembresia
    SET Activo = B'0'
    WHERE IdDetalle = p_id;
END;
$$ LANGUAGE plpgsql;
