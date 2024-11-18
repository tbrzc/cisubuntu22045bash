#!/usr/bin/env bash

# Enforce strict mode for bash scripting to catch errors early
set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

standalone_hardening_scripts() {

    # shellcheck disable=SC1091
    source standalone/ssh.sh #5.1.1
    # shellcheck disable=SC1091
    source standalone/aide_installed.sh #6.1.1

    # shellcheck disable=SC1091
    source standalone/reverse_path_filtering.sh #3.3.7

    # shellcheck disable=SC1091
    source standalone/timeout_shell.sh #5.5.5

    # shellcheck disable=SC1091
    source standalone/service_ufw.sh #3.5.1.3
}


main() {
    check_root
    standalone_hardening_scripts
}
main