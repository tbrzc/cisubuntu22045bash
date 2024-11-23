#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh



CIS_CODE="5.5.1.2"



get_users() {
    cut -d: -f1 /etc/passwd
}

setup() {
    for user in $(get_users); do
        chage --maxdays 365 "$user"
    done
}



main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "---------------------------------------"
}
main "$@" >> log.txt 2>&1