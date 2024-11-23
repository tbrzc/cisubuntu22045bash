

| Punto CIS | Descripción | Script |
|-----------|-------------|--------|
| 5.1.1 | Asegurar permisos en `/etc/ssh/sshd_config` | [`standalone/sshd.sh`](standalone/sshd.sh) |
| 5.1.2 | Asegurar permisos en `/etc/crontab` | [`standalone/acces-control/crontab_permissions.sh`](standalone/acces-control/crontab_permissions.sh) |
| 5.1.3 | Asegurar permisos en `/etc/cron.hourly` | [`standalone/acces-control/cron_hourly.sh`](standalone/acces-control/cron_hourly.sh) |
| 5.1.5 | Asegurar permisos en `/etc/cron.weekly` | [`standalone/acces-control/cron_weekly.sh`](standalone/acces-control/cron_weekly.sh) |
| 5.1.6 | Asegurar permisos en `/etc/cron.monthly` | [`standalone/acces-control/cron_monthly.sh`](standalone/acces-control/cron_monthly.sh) |
| 5.1.7 | Asegurar permisos en `/etc/cron.d` | [`standalone/acces-control/cron_permissions.sh`](standalone/acces-control/cron_permissions.sh) |
| 5.1.8 | Asegurar usuarios autorizados para cron | [`standalone/acces-control/cron_authorized_users.sh`](standalone/acces-control/cron_authorized_users.sh) |
| 5.2.7 | Deshabilitar login de root por SSH | [`standalone/acces-control/root_login.sh`](standalone/acces-control/root_login.sh) |
| 5.2.14 | Configurar algoritmos MAC para SSH | [`standalone/acces-control/MAC_algorithm.sh`](standalone/acces-control/MAC_algorithm.sh) |
| 5.2.18 | Configurar intentos de autenticación SSH | [`standalone/acces-control/auth_tries.sh`](standalone/acces-control/auth_tries.sh) |
| 5.2.19 | Configurar MaxStartups para SSH | [`standalone/acces-control/ssh_max_startups.sh`](standalone/acces-control/ssh_max_startups.sh) |
| 5.2.21 | Configurar LoginGraceTime para SSH | [`standalone/acces-control/login_grace_time.sh`](standalone/acces-control/login_grace_time.sh) |
| 5.3.3 | Configurar archivo de log para sudo | [`standalone/acces-control/sudo_log_file.sh`](standalone/acces-control/sudo_log_file.sh) |
| 5.4.1 | Configurar políticas de calidad de contraseñas | [`standalone/acces-control/pam_pwquality.sh`](standalone/acces-control/pam_pwquality.sh) |
| 5.4.3 | Configurar reutilización de contraseñas | [`standalone/acces-control/password_reutility.sh`](standalone/acces-control/password_reutility.sh) |
| 5.4.4 | Configurar algoritmo de hash para contraseñas | [`standalone/acces-control/hash_algorithm.sh`](standalone/acces-control/hash_algorithm.sh) |
| 5.5.1.2 | Configurar días de inactividad antes de deshabilitar cuenta | [`standalone/acces-control/change_inactivity_days.sh`](standalone/acces-control/change_inactivity_days.sh) |