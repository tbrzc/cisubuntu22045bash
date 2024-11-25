#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh




CIS_CODE="5.4.2"
AUTH_FILE="/etc/pam.d/common-auth"
ACCOUNT_FILE="/etc/pam.d/common-account"
FAILLOCK_FILE="/etc/security/faillock.conf"


setup() {
    #AUTH
    grep -q "pam_faillock.so preauth" $AUTH_FILE || echo "auth required pam_faillock.so preauth" >> $AUTH_FILE
    grep -q "pam_unix.so nullok" $AUTH_FILE || echo "auth [success=1 default=ignore] pam_unix.so nullok" >> $AUTH_FILE
    grep -q "pam_faillock.so authfail" $AUTH_FILE || echo "auth [default=die] pam_faillock.so authfail" >> $AUTH_FILE
    grep -q "pam_faillock.so authsucc" $AUTH_FILE || echo "auth sufficient pam_faillock.so authsucc" >> $AUTH_FILE

    #ACCOUNT
    grep -q "pam_faillock.so" $ACCOUNT_FILE || echo "account required pam_faillock.so" >> $ACCOUNT_FILE

    #FAILLOCK
    {
        echo "deny = 4"
        echo "fail_interval = 900"
        echo "unlock_time = 600"
    } >> $FAILLOCK_FILE
}


main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "-----------------------------------"
}
main "$@" >> log.txt 2>&1