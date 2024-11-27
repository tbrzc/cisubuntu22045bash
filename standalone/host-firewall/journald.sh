#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE=("4.2.1.3" "4.2.1.4")
CONFIG_FILE="/etc/systemd/journald.conf"

setup() {

    if grep -qE "^\s*Compress\s*=" "$CONFIG_FILE"; then
        sed -i "s/^\s*Compress\s*=.*/Compress=yes/" "$CONFIG_FILE"
        sed -i "s/^\s*Storage\s*=.*/Storage=persistent/" "$CONFIG_FILE"


    else
        echo "Compress=yes" >>"$CONFIG_FILE"
        echo "Storage=persistent" >>"$CONFIG_FILE"
    fi

    systemctl restart systemd-journald

}

main() {
    check_root
    setup

}
main
