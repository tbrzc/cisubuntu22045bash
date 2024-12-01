#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

#----READ----
#https://www.tenable.com/audits/items/CIS_Debian_Linux_11_v1.0.0_L2_Server.audit:f3adb6e6c15fe618002f1682dd4f5d5b
CIS_CODE="4.1.4.8"

setup() {
    if ! command -v auditd &>/dev/null; then
        apt install auditd -y

        chmod go-w /sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/augenrules
        chown root:root /sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/augenrules
    fi

}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"

}
main 
