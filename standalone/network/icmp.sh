#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="3.3.3"

setup() {
    echo "net.ipv4.conf.default.secure_redirects = 0" >>/etc/sysctl.conf
    echo "net.ipv4.conf.all.secure_redirects = 0" >>/etc/sysctl.conf
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"

}
main "$@" >>log.txt 2>&1
