#!/usr/bin/env bash

set -euo pipefail


# shellcheck disable=SC1091
source ./lib/common_check_root.sh



CIS_CODE="4.1.4.11"



setup() {

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
    setup

}
main