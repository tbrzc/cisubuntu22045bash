#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

CIS_CODE=("5.5.1.4" "5.5.1.2")

get_users() {
    cut -d: -f1 /etc/passwd
}

setup() {

    useradd -D -f 30

    for user in $(get_users); do
        chage --inactive 30 "$user"
        chage --maxdays 365 "$user"
    done

}

main() {
    check_root
    setup
}
main
