#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh



CIS_CODE="5.1.3"



setup() {
    chown root:root /etc/cron.hourly/
    chmod og-rwx /etc/cron.hourly/
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >> log.txt 2>&1