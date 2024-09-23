-- organizacion(gimnasio, sede, empleado 

SELECT 
	G.idgimnasio AS IdGimnasio,
	G.Nombre AS NombreGimnasio,
    S.idsede AS IdSede,
	S.Nombre AS NombreSede,
	E.idempleado AS IdEmpleado,
	E.Nombre AS NombreEmpleado

FROM gimnasio G
INNER JOIN sede S ON G.idsede = S.idsede -- Asumiendo que cada cliente tiene un iddocumento que corresponde a la tabla documento
INNER JOIN empleado E ON G.idempleado = E.idempleado             -- Asumiendo claramente que cada cliente tiene un idgenero que corresponde a la tabla genero
WHERE  
    G.activo = '1'
    AND S.activo = '1'
    AND E.activo = '1'


UPDATE gimnasio
SET IdEmpleado = CASE idgimnasio
    WHEN 'cb50b478-e88b-490d-96e9-22b358bdc5a1' THEN 'a6de4638-b926-4d86-847c-ffcff8307a09'
    WHEN 'c1e03573-e89c-44fa-99c5-70d690905f9f' THEN '51814941-c44d-462f-b994-e3b8b2215d5b'
    WHEN '75a8e87d-782f-4c86-9354-8bf3bc455c1a' THEN '8856f58a-dcca-492d-92ed-d2e66225ebb2'
	WHEN 'f1a954ad-25e3-4e82-923d-1dec274eda43' THEN '6ff7f4c3-d71f-4de2-9c3e-82e50b807a6d'
	WHEN 'b3ec73c4-aaa7-40a4-bb15-6ca334627596' THEN '914b4986-df1f-41ec-9922-cf614fbec111'
    ELSE IdEmpleado  -- Mantiene el valor actual si no hay cambios especificados
END
WHERE idgimnasio IN ('cb50b478-e88b-490d-96e9-22b358bdc5a1', 'c1e03573-e89c-44fa-99c5-70d690905f9f', '75a8e87d-782f-4c86-9354-8bf3bc455c1a','f1a954ad-25e3-4e82-923d-1dec274eda43','b3ec73c4-aaa7-40a4-bb15-6ca334627596');  -- Asegúrate de listar todos los IDs que estás actualizando

SELECT *FROM gimnasio;
SELECT *FROM empleado;
