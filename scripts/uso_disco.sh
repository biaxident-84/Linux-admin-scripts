#!/bin/bash
# scripts/uso_disco.sh

# Archivo de salida
salida="output/uso_disco.txt"
mkdir -p output

# Fecha y separación
echo "=== Uso de disco:$(date) ===" > "$salida"
echo "" >> "$salida"

# 1) Espacio en particiones
echo "--- Particiones (dh-h) ---" >> "$salida"
df -h >> "$salida"
echo "" >> "$salida"

# 2) Top 5 carpetas mas grandes en $HOME
echo " --- Top 5 carpetas mas grandes en \$HOME --- " >> "$salida"
du -sh $HOME/* 2>/dev/null | sort -hr | head -n >> "$salida"
echo "" >> "$salida"

echo "Reporte de uso de disco guardado en $salida"
