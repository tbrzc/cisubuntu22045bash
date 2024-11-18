#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


CIS_CODE="3.5.1.3"

setup_error_trap "$CIS_CODE"


time_in_shell() {
    # Directorio donde se encuentran los archivos .sh
    DIRECTORIO="/etc/profile.d"

    # Valor máximo para TMOUT
    MAX_TMOUT=900

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

    # Buscar archivos .sh y configurar TMOUT en cada uno
     buscar_y_configurar_TMOUT() {
        find "$DIRECTORIO" -type f -name "*.sh" | while IFS= read -r archivo; do
            TMOUT=$(grep -E '^export TMOUT=' "$archivo" | awk -F'=' '{print $2}')
            if [ -n "$TMOUT" ]; then
                configurar_TMOUT "$archivo" "$TMOUT"
            else
                configurar_TMOUT "$archivo" 300
            fi
        done
    }
    buscar_y_configurar_TMOUT
}


main () {
    check_root
    time_in_shell

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main