| #  | Punto CIS | Descripción | Script |
|----|-----------|-------------|--------|
| 1  | 1.1.1.1   | Deshabilitar el módulo cramfs | [`standalone/initial-setup/cramfs.sh`](standalone/initial-setup/cramfs.sh) |
| 2  | 1.1.8.2   | Configurar opción noexec en /dev/shm | [`standalone/initial-setup/noexec_option.sh`](standalone/initial-setup/noexec_option.sh) |
| 3  | 1.4.2     | Configurar permisos en /boot/grub/grub.cfg | [`standalone/initial-setup/grub_config.sh`](standalone/initial-setup/grub_config.sh) |
| 4  | 1.5.1     | Configurar ASLR | [`standalone/initial-setup/aslr.sh`](standalone/initial-setup/aslr.sh) |
| 5  | 1.5.3     | Deshabilitar Apport | [`standalone/initial-setup/apport_stop.sh`](standalone/initial-setup/apport_stop.sh) |
| 6  | 1.5.4     | Configurar core dumps | [`standalone/initial-setup/core_dumps.sh`](standalone/initial-setup/core_dumps.sh) |
| 7  | 1.6.1.2   | Configurar AppArmor en GRUB | [`standalone/initial-setup/grub_apparmor.sh`](standalone/initial-setup/grub_apparmor.sh) |
| 8  | 2.2.16    | Desinstalar rsync | [`standalone/services/purge_rsync.sh`](standalone/services/purge_rsync.sh) |
| 9  | 2.3.4     | Desinstalar telnet | [`standalone/services/purge_telnet.sh`](standalone/services/purge_telnet.sh) |
| 10 | 3.2.2     | Deshabilitar IP forwarding | [`standalone/network/ipforwarding_disabled.sh`](standalone/network/ipforwarding_disabled.sh) |
| 11 | 3.3.1     | Deshabilitar source routing | [`standalone/network/origin_packages.sh`](standalone/network/origin_packages.sh) |
| 12 | 3.3.3     | Deshabilitar ICMP redirects | [`standalone/network/icmp.sh`](standalone/network/icmp.sh) |
| 13 | 3.3.4     | Configurar logging de paquetes sospechosos | [`standalone/network/suspect_packages.sh`](standalone/network/suspect_packages.sh) |
| 14 | 3.3.7     | Configurar reverse path filtering | [`standalone/network/reverse_path_filtering.sh`](standalone/network/reverse_path_filtering.sh) |
| 15 | 3.3.8     | Habilitar TCP SYN cookies | [`standalone/network/tcp_cookies.sh`](standalone/network/tcp_cookies.sh) |
| 16 | 3.3.9     | Deshabilitar aceptación de router advertisements | [`standalone/network/ipv6_routers.sh`](standalone/network/ipv6_routers.sh) |
| 17 | 3.5.1.3   | Habilitar y configurar UFW | [`standalone/network/service_ufw.sh`](standalone/network/service_ufw.sh) |
| 18 | 3.5.1.4   | Configurar loopback traffic en UFW | [`standalone/network/loopback_ufw.sh`](standalone/network/loopback_ufw.sh) |
| 19 | 3.5.3.3.1 | Configurar política de firewall para IPv6 | [`standalone/network/ip6tables_firewall_policy.sh`](standalone/network/ip6tables_firewall_policy.sh) |
| 20 | 4.1.4.8   | Instalar y configurar auditd | [`standalone/host-firewall/audit_tools.sh`](standalone/host-firewall/audit_tools.sh) |
| 21 | 4.1.4.11  | Configurar AIDE para auditar archivos | [`standalone/host-firewall/aide_audit_secure.sh`](standalone/host-firewall/aide_audit_secure.sh) |
| 22 | 4.2.1.3   | Configurar journald para compresión | [`standalone/host-firewall/journald.sh`](standalone/host-firewall/journald.sh) |
| 23 | 4.2.1.4   | Configurar journald para almacenamiento persistente | [`standalone/host-firewall/journald.sh`](standalone/host-firewall/journald.sh) |
| 24 | 4.2.3     | Configurar permisos y propiedad de archivos de log | [`standalone/host-firewall/register_files.sh`](standalone/host-firewall/register_files.sh) |
| 25 | 5.1.1     | Asegurar permisos en `/etc/ssh/sshd_config` | [`standalone/acces-control/sshd.sh`](standalone/acces-control/sshd.sh) |
| 26 | 5.1.2     | Asegurar permisos en `/etc/crontab` | [`standalone/acces-control/crontab_permissions.sh`](standalone/acces-control/crontab_permissions.sh) |
| 27 | 5.1.3     | Asegurar permisos en `/etc/cron.hourly` | [`standalone/acces-control/cron_hourly.sh`](standalone/acces-control/cron_hourly.sh) |
| 28 | 5.1.4     | Asegurar permisos en `/etc/cron.daily` | [`standalone/acces-control/cron_daily.sh`](standalone/acces-control/cron_daily.sh) |
| 29 | 5.1.5     | Asegurar permisos en `/etc/cron.weekly` | [`standalone/acces-control/cron_weekly.sh`](standalone/acces-control/cron_weekly.sh) |
| 30 | 5.1.6     | Asegurar permisos en `/etc/cron.monthly` | [`standalone/acces-control/cron_monthly.sh`](standalone/acces-control/cron_monthly.sh) |
| 31 | 5.1.7     | Asegurar permisos en `/etc/cron.d` | [`standalone/acces-control/cron_permissions.sh`](standalone/acces-control/cron_permissions.sh) |
| 32 | 5.1.8     | Asegurar usuarios autorizados para cron | [`standalone/acces-control/cron_authorized_users.sh`](standalone/acces-control/cron_authorized_users.sh) |
| 33 | 5.2.7     | Deshabilitar login de root por SSH | [`standalone/acces-control/root_login.sh`](standalone/acces-control/root_login.sh) |
| 34 | 5.2.14    | Configurar algoritmos MAC para SSH | [`standalone/acces-control/MAC_algorithm.sh`](standalone/acces-control/MAC_algorithm.sh) |
| 35 | 5.2.18    | Configurar intentos de autenticación SSH | [`standalone/acces-control/auth_tries.sh`](standalone/acces-control/auth_tries.sh) |
| 36 | 5.2.19    | Configurar MaxStartups para SSH | [`standalone/acces-control/ssh_max_startups.sh`](standalone/acces-control/ssh_max_startups.sh) |
| 37 | 5.2.21    | Configurar LoginGraceTime para SSH | [`standalone/acces-control/login_grace_time.sh`](standalone/acces-control/login_grace_time.sh) |
| 38 | 5.3.3     | Configurar archivo de log para sudo | [`standalone/acces-control/sudo_log_file.sh`](standalone/acces-control/sudo_log_file.sh) |
| 39 | 5.3.7     | Limitar el uso del comando `su` | [`standalone/acces-control/limit_su.sh`](standalone/acces-control/limit_su.sh) |
| 40 | 5.4.1     | Configurar políticas de calidad de contraseñas | [`standalone/acces-control/pam_pwquality.sh`](standalone/acces-control/pam_pwquality.sh) |
| 41 | 5.4.2     | Configurar intentos fallidos de autenticación | [`standalone/acces-control/failed_attemps.sh`](standalone/acces-control/failed_attemps.sh) |
| 42 | 5.4.3     | Configurar reutilización de contraseñas | [`standalone/acces-control/password_reutility.sh`](standalone/acces-control/password_reutility.sh) |
| 43 | 5.4.4     | Configurar algoritmo de hash para contraseñas | [`standalone/acces-control/hash_algorithm.sh`](standalone/acces-control/hash_algorithm.sh) |
| 44 | 5.5.1.2   | Configurar días de inactividad antes de deshabilitar cuenta | [`standalone/acces-control/change_inactivity_days.sh`](standalone/acces-control/change_inactivity_days.sh) |
| 45 | 5.5.4     | Configurar umask predeterminado para usuarios | [`standalone/acces-control/user_mask.sh`](standalone/acces-control/user_mask.sh) |
| 46 | 5.5.5     | Configurar tiempo de espera de shell | [`standalone/acces-control/timeout_shell.sh`](standalone/acces-control/timeout_shell.sh) |
| 47 | 6.1.1     | Asegurar instalación de AIDE | [`standalone/aide_installed.sh`](standalone/aide_installed.sh) |