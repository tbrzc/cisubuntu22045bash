#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh



CIS_CODE="5.1.6"




setup() {
    chown root:root /etc/cron.monthly
    chmod og-rwx /etc/cron.monthly
}


main () {
    check_root
    setup
}
main