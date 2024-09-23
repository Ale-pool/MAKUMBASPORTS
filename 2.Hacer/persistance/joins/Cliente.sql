-- join para cliente (genero(IdGenero), documento(IdDocumento), estado civil(IdEstadocivil))


SELECT
    C.idcliente AS IdCliente,
    C.nombre AS Nombrecliente,
    D.iddocumento AS IdDocumento,
    D.Descripcion AS DescripcionDocumento,
    g.idgenero AS IdGenero,
    g.Descripcion AS DescripcionGenero,
    te.idestadocivil AS IdEstadocivil,
    te.Descripcion AS DescripcionEstadocivil
FROM cliente C
INNER JOIN documento D ON C.iddocumento = D.iddocumento -- Asumiendo que cada cliente tiene un iddocumento que corresponde a la tabla documento
INNER JOIN genero g ON C.idgenero = g.idgenero             -- Asumiendo claramente que cada cliente tiene un idgenero que corresponde a la tabla genero
INNER JOIN estadocivil te ON C.idestadocivil = te.idestadocivil -- Asumiendo que cada cliente tiene un idestadocivil que corresponde a la tabla estadocivil
WHERE 
    C.activo = '1'
    AND D.activo = '1'
    AND g.activo = '1'
    AND te.activo = '1';









SELECT
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'sede'
  AND table_schema = 'public' 
ORDER BY ordinal_position;

