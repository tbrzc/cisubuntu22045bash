#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="1.1.1.1"

setup() {
    l_mname="cramfs" # Set module name
    l_conf_file="/etc/modprobe.d/$l_mname.conf"

    # Eliminar el archivo de configuración si existe
    [ -f "$l_conf_file" ] && rm "$l_conf_file"

    # Escribir la configuración en el archivo si no está configurado correctamente
    if ! modprobe -n -v "$l_mname" | grep -P -- '^\h*install \/bin\/(true|false)\b'; then
        printf "install %s /bin/false\n" "$l_mname" >>"$l_conf_file"
    fi

    # Descargar el módulo si está cargado
    if lsmod | grep "$l_mname" >/dev/null 2>&1; then
        modprobe -r "$l_mname"
    fi

    # Añadir el módulo a la lista negra si no está ya presente
    if ! grep -Pq -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*; then
        printf "blacklist %s\n" "$l_mname" >>"$l_conf_file"
    fi
}

main() {
    check_root
    setup
}
main
