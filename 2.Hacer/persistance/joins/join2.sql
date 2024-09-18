--Obtener la información de los clientes con sus documentos
-- Este JOIN relaciona la tabla Cliente con la tabla Documento para obtener información del cliente
-- y su documento correspondiente.
-- json array

SELECT 
    c.Nombre,
    c.Apellido,
    d.Numero AS NumeroDocumento,
    d.FechaExpedicion,
    d.Lugar
FROM 
    Cliente c
JOIN 
    Documento d ON c.IdDocumento = d.IdDocumento;

