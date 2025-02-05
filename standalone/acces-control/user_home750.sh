#!/usr/bin/env bash

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE="5.2.13"
setup() {
    awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(/usr)?/sbin/nologin(/)?$/ && $7!~/(/usr)?/bin/false(/)?$/) {print $6}' /etc/passwd | while read -r dir; do
        if [ -d '$dir' ]; then
            dirperm=$(stat -L -c '%A' '$dir')
            if [ '$(echo '$dirperm' | cut -c6)' != '-' ] || [ '$(echo '$dirperm' | cut -c8)' != '-' ] || [ '$(echo '$dirperm' | cut -c9)' != '-' ] || [ '$(echo '$dirperm' | cut -c10)' != '-' ]; then
                chmod g-w,o-rwx '$dir'
            fi
        fi
    done
    
}
main() {
    check_root
    echo "----------| Start $CIS_CODE |---------"
    setup
    echo "-----------------------------------"
}
main "$@" >>log.txt 2>&1
