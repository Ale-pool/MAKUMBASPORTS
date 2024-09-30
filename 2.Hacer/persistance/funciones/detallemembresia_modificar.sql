CREATE OR REPLACE FUNCTION modificar_detalle_membresia(p_id UUID, p_fecha_pago DATE, p_monto_pagado MONEY, p_id_membresia UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE DetalleMembresia
    SET FechaPago = p_fecha_pago, MontoPagado = p_monto_pagado, IdMembresia = p_id_membresia, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdDetalle = p_id;
END;
$$ LANGUAGE plpgsql;
