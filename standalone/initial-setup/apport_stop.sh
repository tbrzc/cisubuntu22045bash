#!/usr/bin/env bash

set -euo pipefail


# shellcheck disable=SC1091
source ./lib/common_check_root.sh




CIS_CODE="1.5.3"




setup() {
    sed -i 's/^enabled=1/enabled=0/' /etc/default/apport &&  systemctl stop apport.service && systemctl --now disable apport.service

}


main () {
    check_root
    setup
}
main