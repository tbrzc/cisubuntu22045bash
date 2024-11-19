#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


CIS_CODE="5.1.3"

setup_error_trap "$CIS_CODE"


cron_hourly_permission() {
    chown root:root /etc/cron.hourly/
    chmod og-rwx /etc/cron.hourly/
}


main () {
    check_root
    cron_hourly_permission

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main