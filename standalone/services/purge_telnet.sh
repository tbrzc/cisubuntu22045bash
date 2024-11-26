#!/usr/bin/env bash

set -euo pipefail



# shellcheck disable=SC1091
source ./lib/common_check_root.sh



CIS_CODE="2.3.4"




setup() {
    if dpkg-query -W -f='${Status}\n' telnet 2>/dev/null | grep -c "ok installed";then
        apt purge telnet -y
    else
        echo "telnet is already purged"
    fi
}


main () {
    check_root
    setup

}
main