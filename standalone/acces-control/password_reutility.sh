#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh


COMMON_PASSWORD="/etc/pam.d/common-password"
NEW_LINE="password requisite pam_unix.so obscure sha512 remember=5"
CIS_CODE="5.4.3"




setup() {
    if ! grep -q "^$NEW_LINE" "$COMMON_PASSWORD"; then
        echo "$NEW_LINE" >> "$COMMON_PASSWORD"
    fi
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "---------------------------------------"
}
main "$@" >> log.txt 2>&1