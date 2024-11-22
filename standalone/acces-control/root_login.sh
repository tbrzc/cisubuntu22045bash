#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh


MAX_AUTH_TRIES="PermitRootLogin no"
CIS_CODE="5.2.7"
SSH_CONFIG="/etc/ssh/sshd_config"



setup() {
    if grep -q "^PermitRootLogin" "$SSH_CONFIG"; then #if the parameter exists
        sed -i "s/^PermitRootLogin.*/$MAX_AUTH_TRIES/" "$SSH_CONFIG"

        systemctl restart sshd
    fi
}


main () {
    check_root
    setup
}
main