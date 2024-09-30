CREATE OR REPLACE FUNCTION insertar_detalle_membresia(p_id UUID, p_fecha_pago DATE, p_monto_pagado MONEY, p_id_membresia UUID, p_activo BIT(1), p_actualizar TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO DetalleMembresia (IdDetalle, FechaPago, MontoPagado, IdMembresia, Activo, Actualizar)
    VALUES (p_id, p_fecha_pago, p_monto_pagado, p_id_membresia, p_activo, p_actualizar);
END;
$$ LANGUAGE plpgsql;
