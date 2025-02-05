#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CONFIG_FILE="/etc/login.defs"
PARAM="PASS_MIN_DAYS"
VALUE=1
CIS_CODE="5.5.1.1"

get_users() {
    cut -d: -f1 /etc/passwd
}


setup() {
    
    if grep -q "^$PARAM" "$CONFIG_FILE"; then
        sed -i "s/^$PARAM.*/$PARAM $VALUE/" "$CONFIG_FILE"
    
    for user in $(get_users); do
        chage --mindays $VALUE "$user"
        echo "PASS_MIN_DAYS=$VALUE , user: $user."
    done
}

main() {
    check_root
    echo "----------| Start $CIS_CODE |---------"
    setup
    echo "-----------------------------------"
}
main "$@" >>log.txt 2>&1
