#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh



CIS_CODE="5.4.4"


COMMON_PASSWORD="/etc/pam.d/common-password"
LOGIN_DEFS="/etc/login.defs"

setup() {
    if [ -f "$COMMON_PASSWORD" ]; then
        sudo sed -i '/pam_unix.so/c\password [success=1 default=ignore] pam_unix.so obscure use_authtok try_first_pass remember=5' "$COMMON_PASSWORD"
    fi
    if [ -f "$LOGIN_DEFS" ]; then

        if grep -q '^ENCRYPT_METHOD' "$LOGIN_DEFS"; then
            sudo sed -i 's/^ENCRYPT_METHOD .*/ENCRYPT_METHOD yescrypt/' "$LOGIN_DEFS"
        fi
    fi
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "---------------------------------------"
}
main "$@" >> log.txt 2>&1