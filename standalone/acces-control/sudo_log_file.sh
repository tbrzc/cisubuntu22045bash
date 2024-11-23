#!/usr/bin/env bash

set -euo pipefail


# shellcheck disable=SC1091
source ./lib/common_check_root.sh




CIS_CODE="5.3.3"
SUDOERS_FILE="/etc/sudoers"
LOGFILE="/var/log/sudo.log"


setup() {
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
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "---------------------------------------"

}
main "$@" >> log.txt 2>&1