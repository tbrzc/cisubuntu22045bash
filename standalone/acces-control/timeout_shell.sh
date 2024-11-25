#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="5.5.5"

# Variables
DIRECTORIO="/etc/profile.d"
MAX_TMOUT=900

# Functions
configurar_TMOUT() {
    archivo="$1"
    TMOUT="$2"

    # Validar el valor de TMOUT
    if [ "$TMOUT" -eq 0 ]; then
        echo "Error: El valor de TMOUT en $archivo no puede ser igual a 0."
        return 1
    elif [ "$TMOUT" -gt "$MAX_TMOUT" ]; then
        echo "Error: El valor de TMOUT en $archivo no puede exceder los $MAX_TMOUT segundos."
        return 1
    else
        # Configurar TMOUT eliminando líneas existentes y añadiendo la nueva configuración
        sed -i "/^export TMOUT=/d" "$archivo"
        echo "export TMOUT=$TMOUT" >> "$archivo"
        echo "TMOUT se ha configurado correctamente en $archivo a $TMOUT segundos."
    fi
}

# setup and main functions
setup() {
    # Buscar todos los archivos .sh en el directorio especificado
    archivos_sh=$(find "$DIRECTORIO" -type f -name "*.sh")

    # Iterar sobre los archivos encontrados
    for archivo in $archivos_sh; do
        # Obtener el valor actual de TMOUT en el archivo
        TMOUT=$(grep -E '^export TMOUT=' "$archivo" | awk -F'=' '{print $2}')

        if [ -n "$TMOUT" ]; then
            # Si TMOUT está definido, usar su valor actual
            configurar_TMOUT "$archivo" "$TMOUT"
        else
            # Si TMOUT no está definido, añadirlo con un valor predeterminado de 300 segundos
            configurar_TMOUT "$archivo" 300
        fi
    done
}

main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >> log.txt 2>&1