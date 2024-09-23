
-- Este es el join para producto
-- va relacionado con membresi, detalle de membresia y tipo de membresia

SELECT
    M.IdMembresia AS IdMembresia,             
    M.fechainicio AS fechainicioMembresia,
    TM.IdTipomembresia AS IdTipomembresia,   
    TM.Descripcion AS DescripcionTipomembresia,
    DM.IdDetalle AS IdDetalle, 
    DM.fechapago AS fechapagoMembresia           
FROM membresia M
INNER JOIN tipomembresia TM
    ON M.IdTipomembresia = TM.IdTipomembresia    
INNER JOIN detallemembresia DM
    ON M.IdMembresia = DM.IdMembresia           
WHERE 
    M.activo = '1'
    AND TM.activo = '1'
    AND DM.activo = '1';





