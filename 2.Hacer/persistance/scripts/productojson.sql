

SELECT json_agg(
    json_build_object(
        'IdMembresia', M.IdMembresia,
        'fechainicioMembresia', M.fechainicio,
        'IdTipomembresia', TM.IdTipomembresia,
        'DescripcionTipomembresia', TM.Descripcion,
        'IdDetalle', DM.IdDetalle,
        'fechapagoMembresia', DM.fechapago
    )
) AS membresias
FROM membresia M
INNER JOIN tipomembresia TM
    ON M.IdTipomembresia = TM.IdTipomembresia    
INNER JOIN detallemembresia DM
    ON M.IdMembresia = DM.IdMembresia           
WHERE 
    M.activo = '1'
    AND TM.activo = '1'
    AND DM.activo = '1';
