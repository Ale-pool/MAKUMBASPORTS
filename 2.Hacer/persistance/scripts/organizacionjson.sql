
SELECT json_agg(
    json_build_object(
        'IdGimnasio', G.idgimnasio,
        'NombreGimnasio', G.Nombre,
        'IdSede', S.idsede,
        'NombreSede', S.Nombre,
        'IdEmpleado', E.idempleado,
        'NombreEmpleado', E.Nombre
    )
) AS gimnasios
FROM gimnasio G
INNER JOIN sede S ON G.idsede = S.idsede
INNER JOIN empleado E ON G.idempleado = E.idempleado
WHERE  
    G.activo = '1'
    AND S.activo = '1'
    AND E.activo = '1';

