#!/bin/bash

# Ruta base
SCRIPTS_DIR="./scripts"

# Bucle principal del menú
while true; do
    clear
    echo "===== MENÚ DE MONITOREO DEL SISTEMA ====="
    echo "1) Ver uso de CPU"
    echo "2) Ver uso de Disco"
    echo "3) Ver uso de Memoria"
    echo "4) Ver estado general del sistema"
    echo "5) Ver información de usuarios"
    echo "6) Ver procesos pesados"
    echo "0) Salir"
    echo "=========================================="
    read -p "Seleccione una opción: " opcion

    case $opcion in
        1)
            bash "$SCRIPTS_DIR/monitoreo_cpu.sh"
            ;;
        2)
            bash "$SCRIPTS_DIR/monitoreo_disco.sh"
            ;;
        3)
            bash "$SCRIPTS_DIR/monitoreo_memoria.sh"
            ;;
        4)
            bash "$SCRIPTS_DIR/estado_sistema.sh"
            ;;
        5)
            bash "$SCRIPTS_DIR/usuarios.sh"
            ;;
        6)
            bash "$SCRIPTS_DIR/procesos_pesados.sh"
            ;;
        0)
            echo "Saliendo..."
            sleep 1
            break
            ;;
        *)
            echo "Opción inválida. Presione Enter para continuar..."
            read
            ;;
    esac

    echo ""
    read -p "Presione Enter para volver al menú..."
done

