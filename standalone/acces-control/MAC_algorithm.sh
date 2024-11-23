#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh


SSH_CONFIG="/etc/pam.d/common-password"
NEW_LINE="MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512,hmac-sha2-256"
CIS_CODE="5.2.14"




setup() {
    if ! grep -q "^$NEW_LINE" "$SSH_CONFIG"; then
        echo "$NEW_LINE" >> "$SSH_CONFIG"
    fi
    systemctl restart sshd
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "---------------------------------------"
}
main "$@" >> log.txt 2>&1