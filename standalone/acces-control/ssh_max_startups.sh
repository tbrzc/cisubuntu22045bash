#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="5.2.19"
SSHD_CONFIG="/etc/ssh/sshd_config"



setup() {
    sed -i 's/^#MaxStartups .*/MaxStartups 10:30:60/' "$SSHD_CONFIG"
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "---------------------------------------"
}
main "$@" >> log.txt 2>&1