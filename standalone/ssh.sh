#!/usr/bin/env bash

set -euo pipefail

#5.1.1 Ensure permissions on /etc/ssh/sshd_config are configured

# shellcheck disable=SC1091
source ../common.sh

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
    check_root #common.sh
    ensure_permissions_sshd_config
}