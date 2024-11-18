#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


#5.1.1 Ensure permissions on /etc/ssh/sshd_config are configured
CIS_CODE="3.3.7"

setup_error_trap "$CIS_CODE"


path_filtering_is_enabled() {
    #sysctl -w net.ipv4.conf.all.rp_filter=1
    #sysctl -w net.ipv4.conf.default.rp_filter=1
    #sysctl -w net.ipv4.route.flush=1

    echo "sysctl -w net.ipv4.conf.all.rp_filter=1" >> /etc/sysctl.conf
    echo "sysctl -w net.ipv4.conf.default.rp_filter=1" >> /etc/sysctl.conf
    sysctl -p
}


main () {
    check_root
    path_filtering_is_enabled

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main