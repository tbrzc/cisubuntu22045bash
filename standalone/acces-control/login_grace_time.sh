#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh




CIS_CODE="5.2.21"



setup() {
    sed -i 's/^#LoginGraceTime .*/LoginGraceTime 60/' "/etc/ssh/sshd_config"
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >> log.txt 2>&1