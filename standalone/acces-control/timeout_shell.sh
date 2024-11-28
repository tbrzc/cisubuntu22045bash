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
        sed -i 's/^export TMOUT=.*/export TMOUT=300/' "$archivo"
    elif [ "$TMOUT" -gt "$MAX_TMOUT" ]; then
        echo "Error: El valor de TMOUT en $archivo no puede exceder los $MAX_TMOUT segundos."
        sed -i 's/^export TMOUT=.*/export TMOUT=300/' "$archivo"
    else
        sed -i "/^export TMOUT=/d" "$archivo"
        echo "export TMOUT=$TMOUT" >>"$archivo"
        echo "TMOUT se ha configurado correctamente en $archivo a $TMOUT segundos."
    fi
}

# setup and main functions
setup() {

    archivos_sh=$(find "$DIRECTORIO" -type f -name "*.sh")

    for archivo in $archivos_sh; do
        TMOUT=$(grep -E '^export TMOUT=' "$archivo" | awk -F'=' '{print $2}' || echo 0)
        if [ "$TMOUT" -eq 0 ]; then
            configurar_TMOUT "$archivo" 300
        else
            configurar_TMOUT "$archivo" "$TMOUT"
        fi
        echo "$archivo", "$TMOUT"
    done
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >>log.txt 2>&1
