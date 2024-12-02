#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="3.3.1"

setup() {
    {
        echo "net.ipv4.conf.default.accept_source_route = 0"
        echo "net.ipv4.conf.all.accept_source_route = 0"
        echo "net.ipv6.conf.default.accept_source_route = 0"
        echo "net.ipv6.conf.all.accept_source_route = 0"
    } >>/etc/sysctl.conf
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"

}
main "$@" >>log.txt 2>&1
