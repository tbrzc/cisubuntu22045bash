#!/usr/bin/env bash

set -euo pipefail

start_time=$(date +%s%3N)

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

# shellcheck disable=SC1091
source ./lib/common_error_handling.sh


CIS_CODE="4.1.4.11"

setup_error_trap "$CIS_CODE"


cryptographic_rules() {

    echo /sbin/auditctl  p+i+n+u+g+s+b+acl+xattrs+sha512

    /sbin/auditd    p+i+n+u+g+s+b+acl+xattrs+sha512

    /sbin/ausearch  p+i+n+u+g+s+b+acl+xattrs+sha512

    /sbin/aureport  p+i+n+u+g+s+b+acl+xattrs+sha512

    /sbin/autrace   p+i+n+u+g+s+b+acl+xattrs+sha512

    /sbin/augenrules p+i+n+u+g+s+b+acl+xattrs+sha512 >> /etc/audit/audit.conf

    aide --update
}


main () {
    check_root
    cryptographic_rules

    #time tracking
    end_time=$(date +%s%3N)
    elapsed_time=$((end_time - start_time))

    echo "$CIS_CODE: OK, $elapsed_time ms"
}
main