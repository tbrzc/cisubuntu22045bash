#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="1.4.2"

setup() {
    chown root:root /boot/grub/grub.cfg
    chmod u-wx,go-rwx /boot/grub/grub.cfg
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >>log.txt 2>&1
