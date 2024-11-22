#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh



CIS_CODE="5.1.7"




setup() {
    chown root:root /etc/cron.d
    chmod og-rwx /etc/cron.d
}


main () {
    check_root
    setup
}
main