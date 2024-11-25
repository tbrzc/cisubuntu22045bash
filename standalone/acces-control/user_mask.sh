#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="5.5.4"



setup() {
    sed -i 's/^UMASK\s\+.*$/UMASK 027/' "/etc/login.defs"
    sed -i 's/^USERGROUPS_ENAB .*/USERGROUPS_ENAB yes/' "/etc/login.defs"
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >> log.txt 2>&1