#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


CIS_CODE="2.3.4"

setup_error_trap "$CIS_CODE"


purge_telnet() {
    if dpkg-query -W -f='${Status}\n' telnet 2>/dev/null | grep -c "ok installed";then
        apt purge telnet -y
    else
        echo "telnet is already purged"
    fi
}


main () {
    check_root
    purge_telnet

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main