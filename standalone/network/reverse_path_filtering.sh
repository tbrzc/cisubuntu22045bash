#!/usr/bin/env bash

set -euo pipefail


# shellcheck disable=SC1091
source ./lib/common_check_root.sh




CIS_CODE="3.3.7"


setup() {
    #sysctl -w net.ipv4.conf.all.rp_filter=1
    #sysctl -w net.ipv4.conf.default.rp_filter=1
    #sysctl -w net.ipv4.route.flush=1

    echo "net.ipv4.conf.all.rp_filter=1" >> /etc/sysctl.conf
    echo "net.ipv4.conf.default.rp_filter=1" >> /etc/sysctl.conf
    sysctl -p
}


main () {
    check_root
    setup

    
}
main