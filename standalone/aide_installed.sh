#!/usr/bin/env bash

set -euo pipefail



# shellcheck disable=SC1091
source ./lib/common_check_root.sh



CIS_CODE="6.1.1"




setup() {
    apt install aide aide-common -y || timeout 2 aideinit || echo "exiting aide..."
    mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
}


main () {
    check_root
    setup
}
main