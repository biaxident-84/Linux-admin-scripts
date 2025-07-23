#!/bin/bash

# Directorio de salida
mkdir -p output
REPORTE="output/estado_sistema.txt"

# Limpiar archivo previo
> "$REPORTE"

# Fecha y hora
echo "================ SISTEMA ==================" >> "$REPORTE"
echo "Fecha y hora: $(date)" >> "$REPORTE"

# Tiempo encendido
echo "Uptime: $(uptime -p)" >> "$REPORTE"

# Versión del sistema
echo "Versión del SO:" >> "$REPORTE"
cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"' >> "$REPORTE"

# Nombre del host
echo "Hostname: $(hostname)" >> "$REPORTE"

# IP del host
echo "Dirección IP: $(hostname -I | awk '{print $1}')" >> "$REPORTE"

# Procesos activos
echo "Procesos activos: $(ps aux | wc -l)" >> "$REPORTE"

# Uso de CPU y RAM
echo "" >> "$REPORTE"
echo "=============== RECURSOS ==================" >> "$REPORTE"
echo "Uso de CPU:" >> "$REPORTE"
top -bn1 | grep "Cpu(s)" >> "$REPORTE"

echo "Uso de RAM:" >> "$REPORTE"
free -h >> "$REPORTE"

# Disco
echo "" >> "$REPORTE"
echo "=============== DISCO =====================" >> "$REPORTE"
df -h / >> "$REPORTE"

# Últimos accesos
echo "" >> "$REPORTE"
echo "=========== ÚLTIMOS LOGINS ===============" >> "$REPORTE"
last -n 5 >> "$REPORTE"

echo ""
echo "✅ Reporte generado en $REPORTE"

