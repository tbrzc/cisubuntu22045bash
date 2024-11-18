#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


#5.1.1 Ensure permissions on /etc/ssh/sshd_config are configured
CIS_CODE="3.5.1.3"

setup_error_trap "$CIS_CODE"


service_ufw_enabled() {
    systemctl unmask ufw.service
    systemctl --now enable ufw.service
    ufw enable
}


main () {
    check_root
    service_ufw_enabled

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main