# Truck GPS – Seguimiento de Ubicación de Camiones

## Descripción general
Este proyecto permite visualizar la ubicación en tiempo real de los camiones que realizan traslados de larga distancia. La solución integra datos obtenidos desde SQL Server y los presenta mediante dashboards en Power BI, facilitando el control operativo y la toma de decisiones en los centros logísticos.

## Requisitos
El proyecto utiliza las siguientes tecnologías:
- SQL Server (MSSQL) para la extracción, transformación y carga (ETL) de los datos.
- Power BI para la visualización interactiva. Actualización automática de los datos cada 15 minutos por DirectQuery

## Necesidad del negocio
Los operadores de almacenes de todo el país requieren conocer la posición actual de los camiones que se dirigen a sus centros logísticos.
Esta información es clave para:
- Anticipar la recepción de vehículos.
- Organizar tareas internas relacionadas con la descarga, asignación de muelles y disponibilidad operativa.
- Reducir tiempos de espera y mejorar la eficiencia del flujo logístico.

## Proceso
- Extracción y procesamiento (ETL):
Uso de SQL Server para recopilar y transformar datos provenientes de los sistemas de monitoreo y operaciones.
- Visualización en Power BI:
Construcción de dashboards interactivos que muestran la ubicación de los camiones, KPIs operativos y detalles de cada viaje.

## Aclaración sobre los datos
Los nombres de columnas, patentes y cualquier información sensible han sido anonimizados para su publicación, manteniendo la integridad operativa del proyecto y respetando la confidencialidad de la empresa.
