#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="3.5.1.3"

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
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "---------------------------------------"
}
main "$@" >> log.txt 2>&1