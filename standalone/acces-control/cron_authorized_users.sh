#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="5.1.8"




setup (){
    if [ -f /etc/cron.deny ]; then
        rm /etc/cron.deny
    fi

    if [ ! -f /etc/cron.allow ]; then
        touch /etc/cron.allow
    fi

    chmod g-wx,o-rwx /etc/cron.allow
    chown root:root /etc/cron.allow
}



main () {
    check_root
    echo "----------| Start $CIS_CODE |----------"
    setup
    echo "---------------------------------------"
}
main "$@" >> log.txt 2>&1