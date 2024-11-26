#!/usr/bin/env bash

set -euo pipefail


# shellcheck disable=SC1091
source ./lib/common_check_root.sh




CIS_CODE="3.5.1.3"



setup() {
    systemctl unmask ufw.service
    systemctl --now enable ufw.service
    ufw enable
}


main () {
    check_root
    setup


    
}
main