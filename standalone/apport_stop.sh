#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


CIS_CODE="1.5.3"

setup_error_trap "$CIS_CODE"


stop_apport_service() {
    sed -i 's/^enabled=1/enabled=0/' /etc/default/apport &&  systemctl stop apport.service && systemctl --now disable apport.service

}


main () {
    check_root
    stop_apport_service

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main