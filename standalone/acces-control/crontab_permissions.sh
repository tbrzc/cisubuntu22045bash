#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


CIS_CODE="5.1.2"

setup_error_trap "$CIS_CODE"


crontab_permissions() {
    chown root:root /etc/crontab
    chmod og-rwx /etc/crontab
}


main () {
    check_root
    crontab_permissions

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main