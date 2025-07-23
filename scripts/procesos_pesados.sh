#!/bin/bash

# Crear directorio de salida si no existe

mkdir -p output

# Archivo de salida
archivo="output/procesos_pesados.txt"

# Encabezado
echo "===== PROCESOS MAS PESADOS =====" > "$archivo"
echo "Fecha y hora:$(date)" >> "$archivo"
echo "----------------------------------" >> "$archivo"

# Mostrar top 10 procesos por uso de CPU y memoria
echo "Top 10 procesos por uso de CPU  y memoria:" >> "$archivo"
ps aux --sort=-%cpu,-%mem | head -n 11 >> "$archivo"

echo "" >> "$archivo"
echo "Reporte guardado en $archivo"
