#!/usr/bin/env bash

# Enforce strict mode for bash scripting to catch errors early
set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

standalone_hardening_scripts() {

    # shellcheck disable=SC1091
    source standalone/ssh.sh #5.1.1
}


main() {
    check_root
    standalone_hardening_scripts
}