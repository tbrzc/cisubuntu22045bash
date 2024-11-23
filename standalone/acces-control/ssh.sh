#!/usr/bin/env bash

set -euo pipefail



# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh

#5.1.1  permissions on /etc/ssh/sshd_config are configured
CIS_CODE="5.1.1"

setup_error_trap "$CIS_CODE"


ensure_permissions_sshd_config() {
    chmod u-x,og-rwx /etc/ssh/sshd_config
    chown root:root /etc/ssh/sshd_config

    # while IFS= read -r -d $'\0' l_file; do
    #    if [ -e "$l_file" ]; then
    #       chmod u-x,og-rwx "$l_file"
    #       chown root:root "$l_file"
    #    fi
    # done < <(find /etc/ssh/sshd_config.d -type f -print0 2>/dev/null)

}


main () {
    check_root
    ensure_permissions_sshd_config



    echo "$CIS_CODE: OK"
}
main "$@" >> log.txt 2>&1