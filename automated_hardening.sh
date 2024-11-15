#!/usr/bin/env bash

# Enforce strict mode for bash scripting to catch errors early
set -euo pipefail

# shellcheck disable=SC1091
source ./common.sh

standalone_hardening_scripts() {

    # shellcheck disable=SC1091
    source standalone/ssh.sh
}


main() {
    check_root #common.sh
    standalone_hardening_scripts
}


# Only call main if this script is executed, not sourced/imported
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi