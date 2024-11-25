#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="5.3.7"



setup() {
    groupadd sugroup
    sed -i 's/^#auth required pam_wheel.so.*/auth required pam_wheel.so use_uid group=sugroup/' "/etc/pam.d/su"

}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >> log.txt 2>&1