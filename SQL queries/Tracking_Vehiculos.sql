SELECT
    Fecha_Hora_Sistema,
    FV.ID_Viaje,
    Transporte_Inicio_Fecha_Hora,
	Transporte_Fin_Fecha_Hora,
    CASE WHEN GPS.Patente IS NOT NULL THEN GPS.Patente ELSE GPS2.Nombre END AS Vehiculo_patente,
    Recorrido_Codigo,
    DR.Recorrido_Descripcion,
    CASE 
		WHEN GPS.Patente IS NOT NULL THEN GPS1.Latitud 
		WHEN GPS2.Nombre IS NOT NULL THEN GPS2.Latitud 
	END AS Latitud,
    CASE WHEN GPS.Patente IS NOT NULL THEN GPS1.Longitud 
		WHEN GPS2.Nombre IS NOT NULL THEN GPS2.Longitud 
	END AS Longitud,
    CASE 
		WHEN GPS.Patente IS NOT NULL THEN GPS1.Fecha_Hora_Actualizacion 
		WHEN GPS2.Nombre IS NOT NULL THEN GPS2.Fecha_Hora_Actualizacion 
	END AS Fecha_Hora_Actualizacion,

    -- Estado del TRC
    CASE 
        WHEN (Transporte_Inicio_Actual_Fecha_Hora IS NOT NULL AND FV.Transporte_Fin_Actual_Fecha_Hora IS NULL) THEN 'TRC activo'
        WHEN (Transporte_Inicio_Actual_Fecha_Hora IS NULL AND Fv.Transporte_Fin_Actual_Fecha_Hora IS NULL) OR (Transporte_Inicio_Actual_Fecha_Hora IS NULL AND FV.Transporte_Fin_Actual_Fecha_Hora IS NOT NULL) THEN 'Revisar TRC'
        ELSE 'TRC finalizado'
    END AS Estado_TRC

FROM DW.FACT_viajes AS FV
LEFT JOIN dw.DIM_Vehiculos AS DV ON FV.tractor = DV.vehiculo_codigo
LEFT JOIN DW.DIM_Recorridos AS DR ON FV.Ruta_Key = DR.Ruta_Key
LEFT JOIN DW.FACT_GPS AS GPS1 ON DV.vehiculo_patente = GPS1.Patente
LEFT JOIN DW.FACT_GPS AS GPS2 ON DV.vehiculo_patente = GPS2.Nombre

WHERE Clase_Transporte = 'TRC'
  AND ((CAST(Transporte_Inicio_Actual_Fecha_Hora AS DATE) 
      BETWEEN CAST(GETDATE() - 1 AS DATE) AND CAST(GETDATE() AS DATE)) OR (Transporte_Inicio_Actual_Fecha_Hora IS NULL AND (CAST(Fecha_Hora_Sistema AS DATE) BETWEEN CAST(GETDATE() - 1 AS DATE) AND CAST(GETDATE() AS DATE))))
  AND (DV.vehiculo_patente != 'TRAMINT' AND DV.vehiculo_patente != 'ZZZ000' OR vehiculo_patente IS NULL)
