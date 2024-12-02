#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="2.2.16"

setup() {
    if dpkg-query -W -f='${Status}\n' rsync 2>/dev/null | grep -q "install ok installed"; then
        apt purge rsync -y
    else
        echo "rsync is already purged"
    fi

}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main
