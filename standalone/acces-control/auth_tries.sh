#!/usr/bin/env bash

set -euo pipefail


# shellcheck disable=SC1091
source ./lib/common_check_root.sh


CIS_CODE="5.2.18"
SSHD_CONFIG="/etc/ssh/sshd_config"
MAX_AUTH_TRIES="MaxAuthTries 4"


setup() {
    if grep -q "^#MaxAuthTries" "$SSHD_CONFIG"; then #if the parameter exists
        sed -i "s/^#*MaxAuthTries .*/$MAX_AUTH_TRIES/" "$SSHD_CONFIG"
    else
        echo "$MAX_AUTH_TRIES" >> "$SSHD_CONFIG"
    fi
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |---------"
    setup
    echo "-----------------------------------"

}
main "$@" >> log.txt 2>&1