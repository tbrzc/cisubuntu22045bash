#!/usr/bin/env bash

set -euo pipefail

#5.1.1 Ensure permissions on /etc/ssh/sshd_config are configured

check_root() {
  local uuid
  uuid=$(id -u)
  if [[ ${uuid} -ne 0 ]]; then
    echo "This script must be run as root. Exiting..." >&2
    exit 1
  fi
}


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
}