#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh



CIS_CODE="5.2.7"
SSHD_CONFIG="/etc/ssh/sshd_config"



setup() {
    if grep -q "^#PermitRootLogin" "$SSHD_CONFIG"; then #if the parameter exists
        sed -i 's/^#*PermitRootLogin .*/PermitRootLogin no/' "$SSHD_CONFIG"

    fi
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "---------------------------------------"
}
main "$@" >> log.txt 2>&1