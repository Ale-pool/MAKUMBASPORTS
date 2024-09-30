CREATE OR REPLACE FUNCTION eliminar_fisico_detalle_membresia(p_id UUID)
RETURNS VOID AS $$
BEGIN
    DELETE FROM DetalleMembresia WHERE IdDetalle = p_id;
END;
$$ LANGUAGE plpgsql;
