--Información de las membresías de los clientes, tipo de membresía y gimnasio
--Este JOIN conecta la tabla Cliente, Membresia, TipoMembresia y Sede para mostrar los detalles de la membresía de un cliente y su tipo, además de la sede asociada.

SELECT 
    c.Nombre,
    c.Apellido,
    m.FechaInicio,
    m.FechaFin,
    tm.Descrip_ AS TipoMembresia,
    s.Nombre AS Sede
FROM 
    Cliente c
JOIN 
    Membresia m ON c.IdCliente = m.IdCliente
JOIN 
    TipoMembresia tm ON m.IdTipoMembresia = tm.IdTipoMembresia
JOIN 
    Sede s ON s.IdSede = (SELECT IdSede FROM Empleado WHERE IdEmpleado = (SELECT IdEmpleado FROM Empleado LIMIT 1));
