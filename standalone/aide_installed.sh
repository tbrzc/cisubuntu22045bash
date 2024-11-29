#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh
# shellcheck disable=SC1091
source ./standalone/host-firewall/aide_audit_secure.sh

CIS_CODE="6.1.1"

setup() {
    apt install aide aide-common -y #no configuration
    aide -c /etc/aide/aide.conf --init
    aide -c /etc/aide/aide.conf --checks
    aide_conf
    aide -c /etc/aide/aide.conf --update
    mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
}

main() {
    check_root
    setup
}
main
