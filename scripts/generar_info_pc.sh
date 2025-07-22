#!/bin/bash


#Nomnbre del archivo de salida
archivo="Info-pc.txt"

#Obtener datos
nombre_pc=$(hostname)
modelo_cpu=$(awk -F: '/model name/ {print$2; exit}' /proc/cpuinfo)
ip_pc=$(hostname  -I | awk '{print $1}')

#Escribir el archivo 
echo "PC: $nombre_pc" > "$archivo"
echo "Modelo CPU: $modelo_cpu" >> "$archivo"
echo "IP: $ip_pc" >> "$archivo"


#Mensaje de confirmacion 
echo "Archivo '$archivo' generado correctamente con la informacion del sistema." 
