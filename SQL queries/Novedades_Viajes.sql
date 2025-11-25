SELECT Remitente, Asunto, Dominio, Viaje, Fecha_Hora_Actualizacion
FROM DW.Novedades_Viajes
WHERE CAST(fecha_Sys AS DATE) IN (
    CAST(GETDATE() AS DATE),
    CAST(DATEADD(DAY, -1, GETDATE()) AS DATE))