#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


CIS_CODE="6.1.1"

setup_error_trap "$CIS_CODE"


ensure_aide_is_installed() {
    apt install aide aide-common -y
    y || timeout 2 aideinit || echo "exiting init..."
    mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
}


main () {
    check_root
    ensure_aide_is_installed

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main