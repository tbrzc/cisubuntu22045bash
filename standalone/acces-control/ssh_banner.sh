#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

SSHD_CONFING="/etc/ssh/sshd_config"
BANNER_FILE="/etc/issue.net"
BANNER_MESSAGE="""
    ********************************************************************************
    * ADVERTENCIA: Acceso restringido solo a personal autorizado.                 *
    * Cualquier acceso no autorizado será registrado y puede ser sancionado.      *
    ********************************************************************************
    """
CIS_CODE=("5.2.17","1.7.2","1.7.3")
setup() {
    
    echo -e "$banner_message" | tee "$banner_file"
    chmod 644 "$banner_file"

    if grep -q "^Banner" "$ssh_config"; then
        sed -i "s|^Banner.*|Banner $banner_file|" "$ssh_config"
    
    echo 'Authorized uses only. All activity may be monitored and reported.' | tee /etc/issue
    echo 'Authorized uses only. All activity may be monitored and reported.' | tee /etc/issue.net
    sed -i 's/^#Banner none/Banner \/etc\/issue.net/' /etc/ssh/sshd_config


    systemctl restart sshd
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |---------"
    setup
    echo "-----------------------------------"
}
main "$@" >>log.txt 2>&1
