#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="1.1.8.2"
FSTAB="/etc/fstab"

setup() {
    #verify if /dev/shm is mounted with noexec option
    if ! grep -q '/dev/shm' "$FSTAB" && ! grep -q 'noexec' "$FSTAB"; then
        sed -i '/\/dev\/shm/ s/defaults/defaults,noexec/' "$FSTAB"
        mount -o remount,noexec /dev/shm

        #verify if noexec is working
        #echo -e '#!/bin/bash\necho "noexec its not working"' >/dev/shm/test.sh
        #chmod +x /dev/shm/test.sh
        #/dev/shm/test.sh > log.txt 2>&1
        #rm /dev/shm/test.sh
    fi

}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup #bash: /dev/shm/test.sh: Permission denied
    echo "-----------------------------------"
}
main "$@" >>log.txt 2>&1
