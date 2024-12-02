#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="1.5.4"

var1="/etc/security/limits.conf"
var2="/etc/systemd/coredump.conf"

setup() {
    echo "* hard core 0" >>$var1
    # Check if systemd-coredump is installed
    if command -v systemd-coredump &>/dev/null; then
        {
            "Storage": "none",
            "ProcessSizeMax": "0",
        } >$var2
    fi
    systemctl daemon-reload
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >>log.txt 2>&1
