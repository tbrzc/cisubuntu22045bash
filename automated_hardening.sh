#!/usr/bin/env bash

# Enforce strict mode for bash scripting to catch errors early
set -euo pipefail

# shellcheck disable=SC1091
source ./lib/common_check_root.sh

standalone_acces_control_scripts() {

    #----------------------------NOT ADDED-----------------------------
    #5.5.1.4 ----> Not sure if its audit by rapid7
    #----------------------------TO DO---------------------------------
    #5.5.1.1
    #5.2.17
    #5.2.1
    #--------------------------[5. ACCES CONTROL]------------------------
    #------[OK]----------------

    # shellcheck disable=SC1091
    source standalone/acces-control/sshd.sh #5.1.1
    # shellcheck disable=SC1091
    source standalone/acces-control/cron_hourly.sh #"5.1.3
    # shellcheck disable=SC1091
    source standalone/acces-control/crontab_permissions.sh #5.1.2
    # shellcheck disable=SC1091
    source standalone/acces-control/cron_authorized_users.sh #5.1.8
    # shellcheck disable=SC1091
    source standalone/acces-control/cron_permissions.sh #5.1.7
    # shellcheck disable=SC1091
    source standalone/acces-control/cron_monthly.sh #5.1.6
    # shellcheck disable=SC1091
    source standalone/acces-control/cron_weekly.sh #5.1.5
    # shellcheck disable=SC1091
    source standalone/acces-control/change_inactivity_days.sh #5.5.1.2
    # shellcheck disable=SC1091
    source standalone/acces-control/pam_pwquality.sh #5.4.1
    # shellcheck disable=SC1091
    source standalone/acces-control/sudo_log_file.sh #5.3.3
    # shellcheck disable=SC1091
    source standalone/acces-control/root_login.sh #5.2.7
    # shellcheck disable=SC1091
    source standalone/acces-control/auth_tries.sh #5.2.18
    # shellcheck disable=SC1091
    source standalone/acces-control/hash_algorithm.sh #5.4.4
    # shellcheck disable=SC1091
    source standalone/acces-control/ssh_max_startups.sh #5.2.19
    # shellcheck disable=SC1091
    source standalone/acces-control/password_reutility.sh #5.4.3
    # shellcheck disable=SC1091
    source standalone/acces-control/MAC_algorithm.sh #5.2.14
    # shellcheck disable=SC1091
    source standalone/acces-control/login_grace_time.sh #5.2.21
    # shellcheck disable=SC1091
    source standalone/acces-control/cron_daily.sh #5.1.4
    # shellcheck disable=SC1091
    source standalone/acces-control/user_mask.sh #5.5.4
    # shellcheck disable=SC1091
    source standalone/acces-control/limit_su.sh #5.3.7
    # shellcheck disable=SC1091
    source standalone/acces-control/failed_attemps.sh #5.4.2

    systemctl restart sshd
    echo "----------| Finished ACCES CONTROL |---------"

    # --------------------------[TESTING]------------------------
    # shellcheck disable=SC1091
    source standalone/acces-control/timeout_shell.sh #5.5.5
}

standalone_initial_setup() {
    #----------------------------NOT ADDED-----------------------------
    #1.1.8.2

    # shellcheck disable=SC1091
    source standalone/initial-setup/apport_stop.sh #1.5.3
    # shellcheck disable=SC1091
    source standalone/initial-setup/grub_config.sh #1.4.2
    # shellcheck disable=SC1091
    source standaloneinitial-setup//cramfs.sh #1.1.1.1
    # shellcheck disable=SC1091
    source standalone/initial-setup/grub_apparmor.sh #1.6.1.2
    # shellcheck disable=SC1091
    source standalone/initial-setup/core_dumps.sh #1.5.4
    # shellcheck disable=SC1091
    source standalone/initial-setup/asrl.sh ##1.5.1
}
standalone_services() {
    # shellcheck disable=SC1091
    source standalone/services/purge_telnet.sh #2.3.4
    # shellcheck disable=SC1091
    source standalone/services/rsync_unistall.sh #2.2.16

}
standalone_network_configuration() {
    # shellcheck disable=SC1091
    source standalone/network/reverse_path_filtering.sh #3.3.7
    # shellcheck disable=SC1091
    source standalone/network/service_ufw.sh #3.5.1.3
}

standalone_host_firewall() {
    # shellcheck disable=SC1091
    source standalone/host-firewall/aide_audit_secure.sh #4.1.4.11
    # shellcheck disable=SC1091
    source standalone/host-firewall/audit_tools.sh #4.1.4.8
    # shellcheck disable=SC1091
    source standalone/host-firewall/register_files.sh #4.2.3

}



main() {
    check_root
    standalone_initial_setup
    standalone_services
    standalone_network_configuration
    standalone_host_firewall
    standalone_acces_control_scripts
}
main
