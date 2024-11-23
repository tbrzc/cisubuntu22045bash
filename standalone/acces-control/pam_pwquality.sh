#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh




CIS_CODE="5.4.1"



setup() {
    apt install libpam-pwquality -y
    {
        echo "minlen = 14"
        echo "minclass = 4"
    } >> /etc/security/pwquality.conf
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >> log.txt 2>&1