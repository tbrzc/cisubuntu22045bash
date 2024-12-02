#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="3.2.2"

setup() {
    echo "net.ipv4.ip_forward = 0" >> /etc/sysctl.conf
    echo "net.ipv6.conf.all.forwarding = 0" >> /etc/sysctl.conf
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"

}
main "$@" >>log.txt 2>&1
