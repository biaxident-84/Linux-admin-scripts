#!/bin/bash

# Directorio de salida
mkdir -p output
ARCHIVO="output/usuarios_sistema.txt"

# Limpiar archivo previo
> "$ARCHIVO"

echo "======= INFORME DE USUARIOS =======" >> "$ARCHIVO"
echo "Fecha de generación: $(date)" >> "$ARCHIVO"
echo "" >> "$ARCHIVO"

# Leer /etc/passwd y filtrar UID >= 1000 (usuarios reales) y ≠ 65534 (nobody)
awk -F: '($3>=1000)&&($3!=65534){print $1}' /etc/passwd | while read usuario
do
    echo "Usuario: $usuario" >> "$ARCHIVO"
    
    # Último inicio de sesión
    ultimo_login=$(lastlog -u "$usuario" | awk 'NR==2 {print $4, $5, $6, $7}')
    echo "Último login: ${ultimo_login:-Nunca}" >> "$ARCHIVO"

    # ¿Está conectado ahora?
    conectado=$(who | grep "^$usuario" | wc -l)
    if [ "$conectado" -gt 0 ]; then
        echo "Conectado: Sí" >> "$ARCHIVO"
    else
        echo "Conectado: No" >> "$ARCHIVO"
    fi

    # Directorio home y shell
    dir_home=$(getent passwd "$usuario" | cut -d: -f6)
    shell=$(getent passwd "$usuario" | cut -d: -f7)

    echo "Directorio home: $dir_home" >> "$ARCHIVO"
    echo "Shell: $shell" >> "$ARCHIVO"
    echo "----------------------------------" >> "$ARCHIVO"
done

echo ""
echo "✅ Reporte generado en $ARCHIVO"

