#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="4.1.4.8"

setup() {
    if ! command -v auditd &>/dev/null; then
        apt install auditd -y

        chmod go-w /bin/auditctl /sbin/auditd /sbin/ausearch /sbin/aureport /sbin/autrace /sbin/augenrules
    fi

}

main() {
    check_root
    setup

}
main
