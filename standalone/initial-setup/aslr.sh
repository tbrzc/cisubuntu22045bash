#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="1.5.1"

var1="/etc/sysctl.d/60-kernel_sysctl.conf"

setup() {
    if [[ ! $(cat /proc/sys/kernel/randomize_va_space) == "2" ]]; then
        echo "kernel.randomize_va_space=2" >>/etc/sysctl.conf
        sysctl -p
    fi

    echo "kernel.randomize_va_space = 2" >>$var1
    sysctl -w kernel.randomize_va_space=2
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >>log.txt 2>&1
