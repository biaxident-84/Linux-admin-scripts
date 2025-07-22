#!/bin/bash

#scripts/monitoreo_cpu.sh

salida="output/monitoreo_cpu.txt"
mkdir -p output

echo "=== Uso de CPU: $(date) ===" > "$salida"

#Uso total del CPU

top -bn1 | grep "Cpu(s)" >> "$salida"

echo "" >> "$salida"

echo " === Top 5 procesos por uso de CPU ===" >> "$salida"

ps -eo pid,comm,pcpu --sort=-pcpu | head -n 6 >> "$salida"

echo "Reporte guardado en $salida"
