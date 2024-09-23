

SELECT json_agg(json_build_object(
    'IdCliente', C.idcliente,
    'Nombrecliente', C.nombre,
    'IdDocumento', D.iddocumento,
    'DescripcionDocumento', D.Descripcion,
    'IdGenero', g.idgenero,
    'DescripcionGenero', g.Descripcion,
    'IdEstadocivil', te.idestadocivil,
    'DescripcionEstadocivil', te.Descripcion
))
FROM cliente C
INNER JOIN documento D ON C.iddocumento = D.iddocumento
INNER JOIN genero g ON C.idgenero = g.idgenero
INNER JOIN estadocivil te ON C.idestadocivil = te.idestadocivil
WHERE 
    C.activo = '1'
    AND D.activo = '1'
    AND g.activo = '1'
    AND te.activo = '1';
