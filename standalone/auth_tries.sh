#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh

CIS_CODE="5.2.18"
SSH_CONFIG="/etc/ssh/sshd_config"
MAX_AUTH_TRIES="MaxAuthTries 4"
setup_error_trap "$CIS_CODE"


max_auth_tries() {
    if grep -q "^MaxAuthTries" "$SSH_CONFIG"; then #if the parameter exists
        sed -i "s/^MaxAuthTries.*/$MAX_AUTH_TRIES/" "$SSH_CONFIG"
    else
        echo "$MAX_AUTH_TRIES" >> "$SSH_CONFIG"
    fi
    systemctl restart sshd
}


main () {
    check_root
    max_auth_tries

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main