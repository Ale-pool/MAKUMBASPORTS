SELECT
    P.idpais AS IdPais,
    P.nombre AS NombrePais,
    D.iddepartamento AS IdDepartamento,
    D.nombre AS NombreDepartamento,
    C.idciudad AS IdCiudad,
    C.nombre AS NombreCiudad
FROM pais P
INNER JOIN departamento D
    ON P.idpais = D.idpais
INNER JOIN ciudad C
    ON D.iddepartamento = C.iddepartamento
WHERE 
    P.activo = '1'
    AND D.activo = '1'
    AND C.activo = '1';
