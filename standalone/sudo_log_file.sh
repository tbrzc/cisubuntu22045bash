#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


CIS_CODE="5.3.3"
SUDOERS_FILE="/etc/sudoers"
LOGFILE="/var/log/sudo.log"

setup_error_trap "$CIS_CODE"


setup_log_file() {
    if ! grep -q "^Defaults logfile=\"$LOGFILE\"" "$SUDOERS_FILE"; then
        echo "Defaults logfile=\"$LOGFILE\"" | EDITOR='tee -a' visudo
    fi
    if [[ ! -f $LOGFILE ]]; then
        touch $LOGFILE
        chmod 600 $LOGFILE
    fi
}


main () {
    check_root
    setup_log_file

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main