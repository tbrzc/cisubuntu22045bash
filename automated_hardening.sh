#!/usr/bin/env bash

# Enforce strict mode for bash scripting to catch errors early
set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

standalone_hardening_scripts() {

    #----------------------------NOT ADDED-----------------------------
    #1.4.3
    #1.4.2
    #2.2.15
    #1.1.8.2
    #1.1.1.1
    #1.5.1
    #1.5.4
    #1.1.2.3
    #----------------------------TO DO---------------------------------
    #3.3.9
    #1.6.1.2
    #4.2.1.3
    #3.5.2.9
    #3.5.1.4
    #4.2.1.4
    #1.1.8.3
    #3.3.3
    #3.2.2
    #1.1.8.1
    #1.1.2.2
    #3.3.1
    #1.1.2.4
    #4.2.3
    #3.5.1.6
    #3.3.4
    #3.5.2.6
    #3.5.1.7
    #3.5.3.3.1
    #4.1.4.8
    #3.3.8
    #------[ACCES CONTROL]----------------
    #5.4.3
    #5.2.14
    #5.5.1.4
    #5.5.1.2
    #5.1.7
    #5.1.6
    #5.2.19
    #5.1.5
    #5.2.21
    #5.3.7
    #5.5.4
    #5.1.4
    #5.4.2
    #5.4.1
    #5.4.4
    #5.2.7
    #5.1.8

    #----------------------------NOT AUTOMATIZED-------------------------------
    #5.2.4

    #--------------------------[5. ACCES CONTROL]------------------------
    #------[OK]----------------

    # shellcheck disable=SC1091
    source standalone/acces-control/ssh.sh #5.1.1
    # shellcheck disable=SC1091
    source standalone/acces-control/timeout_shell.sh #5.5.5

    #------[NOT TESTED]--------

    # shellcheck disable=SC1091
    source standalone/acces-control/cron_hourly.sh #"5.1.3
    # shellcheck disable=SC1091
    source standalone/acces-control/crontab_permissions.sh #5.1.2
    # shellcheck disable=SC1091
    source standalone/acces-control/sudo_log_file.sh #5.3.3
    # shellcheck disable=SC1091
    source standalone/auth_tries.sh #5.2.18

    #--------------------------SCRIPT BACKLOG------------------------

    #source standalone/apport_stop.sh #1.5.3

    #source standalone/purge_telnet.sh #2.3.4

    #source standalone/rsync_unistall.sh #2.2.16

    #source standalone/aide_audit_secure.sh #4.1.4.11

    #source standalone/service_ufw.sh #3.5.1.3

    #source standalone/aide_installed.sh #6.1.1

    #source standalone/reverse_path_filtering.sh #3.3.7
}


main() {
    check_root
    standalone_hardening_scripts
}
main