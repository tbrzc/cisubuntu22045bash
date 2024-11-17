#!/usr/bin/env bash


handle_error() {
    local last_command="$1"
    local exit_code="$2"
    local CIS_CODE="$3"

    echo "Error en ${CIS_CODE}: El comando '${last_command}' falló con código de salida ${exit_code}."

    exit "${exit_code}"
}

# Configuración de 'trap' para capturar errores
setup_error_trap() {
    trap 'handle_error "$BASH_COMMAND" "$?" "${CIS_CODE}"' ERR
}