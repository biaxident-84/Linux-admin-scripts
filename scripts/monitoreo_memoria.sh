#!/bin/bash

# Crear directorio de salida si no existe

mkdir -p output

#Archivo de salida
archivo="output/monitoreo_memoria.txt"

# Encabezado
echo "===== MONITOREO DE MEMORIA RAM =====" > "$archivo"
echo "Fecha y Hora: $(date)" >> "$archivo"
echo "-----------------------------------" >> "$archivo"

# Mostrar uso de memoria con 'free -h'
echo "Uso general de memoria:" >> "$archivo"
free-h >> "$archivo"

# Agregar linea en blanco
echo "" >> "$archivo"

# Mostrar procesos que mas memoria consumen 
echo "Top 5 procesos por uso de memoria:" >> "$archivo"
ps aux --sort=-%mem | head -n 6 >> "$archivo"

echo "" >> "$archivo"

echo "Reporte guardado en $archivo"
