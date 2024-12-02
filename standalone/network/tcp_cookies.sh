#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="3.3.8"

setup() {
    echo 'net.ipv4.tcp_syncookies = 1' >>/etc/sysctl.conf
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"

}
main "$@" >>log.txt 2>&1
