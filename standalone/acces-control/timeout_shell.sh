#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="3.5.1.3" # <-- Cambiar por el código CIS correspondiente

handle_error() {
    local CIS_CODE="$1"
    local log_file="log.txt"

    echo "${CIS_CODE}: NOT OK" | tee -a "$log_file"
}

trap 'handle_error "$CIS_CODE"' ERR
#---------------------------------------------------------


# Variables
DIRECTORIO="/etc/profile.d"
MAX_TMOUT=900

# Functions
configurar_TMOUT() {
    archivo="$1"
    TMOUT="$2"

    if [ "$TMOUT" -eq 0 ]; then
        echo "Error: El valor de TMOUT en $archivo no puede ser igual a 0."
        return 1
        elif [ "$TMOUT" -gt "$MAX_TMOUT" ]; then
        echo "Error: El valor de TMOUT en $archivo no puede exceder los $MAX_TMOUT segundos."
        return 1
    else
        # Configurar TMOUT
        if [ ! -w "$archivo" ]; then
            echo "Advertencia: No se puede escribir en $archivo. Omitido."
            return 1
        fi
        sed -i "/^export TMOUT=/d" "$archivo"
        echo "export TMOUT=$TMOUT" >> "$archivo"
        echo "TMOUT se ha configurado correctamente en $archivo a $TMOUT s"
    fi
}

# setup and main functions
setup() {
    find "$DIRECTORIO" -type f -name "*.sh" | while IFS= read -r archivo; do
        TMOUT=$(grep -E '^export TMOUT=' "$archivo" | awk -F'=' '{print $2}')
        if [ -n "$TMOUT" ]; then
            configurar_TMOUT "$archivo" "$TMOUT"
        else
            configurar_TMOUT "$archivo" 300
        fi
    done
}

main () {
    check_root
    setup

    echo "$CIS_CODE: OK"
}
main "$@" >> log.txt 2>&1