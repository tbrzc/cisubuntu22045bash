#!/usr/bin/env bash

# Enforce strict mode for bash scripting to catch errors early
set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

standalone_hardening_scripts() {

    #----------------------------NOT ADDED-----------------------------
    #4.1.4.8 -add
    #3.3.8 -add
    #1.4.3
    #1.4.2
    #2.2.15
    #1.1.8.2
    #1.1.1.1

    #----------------------------OK------------------------------------

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

    #----------------------------TEST---------------------------------
    # shellcheck disable=SC1091
    source standalone/aide_audit_secure.sh #4.1.4.11
    # shellcheck disable=SC1091
    source standalone/cron_hourly.sh #"5.1.3
    # shellcheck disable=SC1091
    source standalone/crontab_permissions.sh #5.1.2
    # shellcheck disable=SC1091
    source standalone/purge_telnet.sh #2.3.4
    # shellcheck disable=SC1091
    source standalone/rsync_unistall.sh #2.2.16
    # shellcheck disable=SC1091
    source standalone/sudo_log_file.sh #5.3.3
    # shellcheck disable=SC1091
    source standalone/apport_stop.sh #1.5.3
    # shellcheck disable=SC1091
    source standalone/auth_tries.sh #5.2.18

}


main() {
    check_root
    standalone_hardening_scripts
}
main