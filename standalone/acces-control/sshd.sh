#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="5.1.1"

setup() {
    chmod u-x,og-rwx /etc/ssh/sshd_config
    chown root:root /etc/ssh/sshd_config

    # while IFS= read -r -d $'\0' l_file; do
    #    if [ -e "$l_file" ]; then
    #       chmod u-x,og-rwx "$l_file"
    #       chown root:root "$l_file"
    #    fi
    # done < <(find /etc/ssh/sshd_config.d -type f -print0 2>/dev/null)

}

main() {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >>log.txt 2>&1
